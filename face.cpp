#include "face.h"
#include "ui_face.h"
using namespace  cv;
Face::Face(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Face)
{
    ui->setupUi(this);
    setWindowTitle("人脸识别系统");
    QIcon icon(":/image/Icon.png");
    setWindowIcon(icon);
    QPalette pal =this->palette();
    pal.setBrush(QPalette::Background,QBrush(QPixmap(":/image/background.jpg")));
    this->setPalette(pal);
    //记录可用的摄像头
    cameraList=QCameraInfo::availableCameras();
    for(const QCameraInfo &tempCamera:cameraList)
    {
        ui->deviceName->addItem(tempCamera.description());
        //qDebug()<<tempCamera.deviceName()<<"|||||"<<tempCamera.description()<<endl;
    }
    //连接下拉框和摄像头的槽函数
    connect(ui->deviceName,QOverload<int>::of(&QComboBox::currentIndexChanged)
            ,this,&Face::ChooseCamera);
    //初始化摄像头模块
    camera = new QCamera();
    viewfinder = new QCameraViewfinder();
    imgCapture = new QCameraImageCapture(camera);
    //设置取景器和拍照方式以及捕获的照片存放目的地
    camera->setViewfinder(viewfinder);
    camera->setCaptureMode(QCamera::CaptureStillImage);
    imgCapture->setCaptureDestination(QCameraImageCapture::CaptureToBuffer);
    camera->start();
    //设置各个控件的布局位置
    this->resize(1000,850);
    QVBoxLayout *vboxl=new QVBoxLayout;
    vboxl->addWidget(ui->view);
    vboxl->addWidget(ui->Capture);
    QVBoxLayout *vboxr=new QVBoxLayout;
    vboxr->addWidget(ui->deviceName);
    vboxr->addWidget(viewfinder);
    vboxr->addWidget(ui->information);
    QHBoxLayout *hbox=new QHBoxLayout(this);
    hbox->addLayout(vboxl);
    hbox->addLayout(vboxr);
    this->setLayout(hbox);
    //连接拍照函数
    //将信号和显示图片的槽连接起来
    connect(imgCapture,&QCameraImageCapture::imageCaptured,this,&Face::showPicture);
    //使用计时器进行动态的照片显示
    refreshtimer = new QTimer(this);
    connect(refreshtimer,&QTimer::timeout,this,&Face::Capture);
    refreshtimer->start(10);//10毫秒刷新一次

    //配置网络请求
    tokenManager = new QNetworkAccessManager(this);
    connect(tokenManager,&QNetworkAccessManager::finished,this,&Face::TokenReply);
    //设置url，如果出现找不到主机情况可能是网络认证到期了，需要登录百度智能云平台进行接口认证
    QUrl url("https://aip.baidubce.com/oauth/2.0/token");
    QUrlQuery query;
    query.addQueryItem("grant_type","client_credentials");
    query.addQueryItem("client_id","ycrMhrA6Ui6YtRYAaxOZMIBK");
    query.addQueryItem("client_secret","2onWHceQ9HhEMbQnMzlbB4z8do8rnSaD");
    url.setQuery(query);
    //配置ssl
    sslConfiguration = QSslConfiguration::defaultConfiguration();
    sslConfiguration.setProtocol(QSsl::TlsV1_1);
    sslConfiguration.setPeerVerifyMode(QSslSocket::QueryPeer);
    //设置网络请求
    QNetworkRequest req;
    req.setSslConfiguration(sslConfiguration);
    req.setUrl(url);
    tokenManager->get(req);
    //设置图片上传请求
    //点击按钮对图片进行转码
    connect(ui->Capture,&QPushButton::clicked,this,&Face::PreparePostData);
    imgManager = new QNetworkAccessManager(this);
    connect(imgManager,&QNetworkAccessManager::finished,this,&Face::imgReply);
    //设置网络请求定时器进行动态识别
    netWorktimer = new QTimer(this);
    connect(netWorktimer,&QTimer::timeout,this,&Face::PreparePostData);

   }

Face::~Face()
{
    delete ui;
}
//显示照片
void Face::showPicture(int id, QImage view)
{
    Q_UNUSED(id);//没有使用到id类
    this->img=view;
    //画出人脸的定位框
    QPainter p(&img);
    for(int i=0;i<face_num;i++)
    {
        p.setPen(Qt::blue);
        p.drawRect(faceLeft[i],faceTop[i],faceWidth[i],faceHight[i]);
    }

    //将取景器的图片显示到Lable里
    ui->view->setPixmap(QPixmap::fromImage(img));
}
//拍照
void Face::Capture()
{
    //调用默认的拍照函数
    imgCapture->capture();
}
//显示界面
void Face::showFaceView()
{
    this->exec();
}
//获取token信息
void Face::TokenReply(QNetworkReply *reply)
{
    //返回错误信息就进行返回
    if(reply->error()!=QNetworkReply::NoError)
    {
        qDebug()<<reply->errorString();//打印错误信息
        return;
    }
     const QByteArray reply_ifo=reply->readAll();//没有错误打印所有token信息
     //qDebug()<<reply_ifo<<endl;
     //进行Json数据解析
     QJsonParseError Jsonerr;
     QJsonDocument doc = QJsonDocument::fromJson(reply_ifo,&Jsonerr);//将返回值转换成JSON格式
     //JSON解析没出错
     if(Jsonerr.error==QJsonParseError::NoError)
     {
         QJsonObject obj=doc.object();
         if(obj.contains("access_token"))//存在键值对
         {
             access_token=obj.take("access_token").toString();//将获取的token值赋给access_token
         }
        // ui->information->setText(access_token);//将获取的token值显示出来
     }
     else{
         qDebug()<<Jsonerr.errorString();//打印解析错误的信息
     }

     reply->deleteLater();//解析结束后清除
     //自动刷新数据
     netWorktimer->start(1000);
}

void Face::StartFaceDetect(QByteArray postData,QThread *overThread)
{
     /*QByteArray Barr;
     QBuffer buff(&Barr);
     img.save(&buff,"png");
     QString base64_str = Barr.toBase64();
     //qDebug()<<base64_str<<endl;
     //设置POSTJSON数据
     QJsonObject PostJson;
     QJsonDocument doc;
     PostJson.insert("image",base64_str);
     PostJson.insert("image_type","BASE64");
     PostJson.insert("face_field","age,expression,face_shape,gender,glasses,emotion,face_type,mask");
     doc.setObject(PostJson);
     QByteArray postData = doc.toJson(QJsonDocument::Compact);//设置JSON数据格式为一整行*/
    //开始发起网络请求时先进行线程关闭操作
    overThread->quit();
    overThread->wait();
    QUrl url("https://aip.baidubce.com/rest/2.0/face/v3/detect");
     QUrlQuery query;
     query.addQueryItem("access_token",access_token);
     url.setQuery(query);

     QNetworkRequest req;
     req.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/json"));
     req.setSslConfiguration(sslConfiguration);
     req.setUrl(url);
     imgManager->post(req,postData);
}
//解析返回的数据进行显示
void Face::imgReply(QNetworkReply *reply)
{
    if(reply->error()!=reply->NoError)
    {
        qDebug()<<reply->errorString();//打印错误信息
        return;
    }
    const QByteArray replyData = reply->readAll();
    //qDebug()<<replyData;//打印返回的json信息
    QJsonParseError jsonErr;
    //将返回数据转换成JSON格式
    QJsonDocument doc=QJsonDocument::fromJson(replyData,&jsonErr);
    if(jsonErr.error==QJsonParseError::NoError)
    {
        //人脸检测Json解析
        QString FaceData;//用来拼接所有的json信息
        //取出最外层json
        QJsonObject obj=doc.object();
        //通过时间戳判断请求顺序排在防止数据覆盖
        if(obj.contains("timestamp")){
            int timeStamp=obj.take("timestamp").toInt();
            if(timeStamp<leastTime)
            {
                return;
            }
            else {
                leastTime=timeStamp;
            }
        }
        if(obj.contains("result"))
        {
            QJsonObject resultObj= obj.take("result").toObject();//取出json中的结果
            face_num=resultObj.take("face_num").toInt();
            //qDebug()<<face_num<<endl;
            //取出第一张人脸信息表
            if(resultObj.contains("face_list"))
            {
                QJsonArray face_list=resultObj.take("face_list").toArray();

                for(int i=0;i<face_num;i++)
               {
                QJsonObject faceObj = face_list.at(i).toObject();//取出第一张人脸信息
                 FaceData.append("人脸:").append(QString::number(i+1)).append("\r\n");
                //定位人脸信息
                if(faceObj.contains("location"))
                {
                    QJsonObject locObj = faceObj.take("location").toObject();
                    if(locObj.contains("left"))
                    {
                        faceLeft[i]= locObj.take("left").toDouble();
                    }
                    if(locObj.contains("top"))
                    {
                       faceTop[i]= locObj.take("top").toDouble();
                    }
                    if(locObj.contains("width"))
                    {
                        faceWidth[i]= locObj.take("width").toDouble();
                    }
                    if(locObj.contains("height"))
                    {
                        faceHight[i]= locObj.take("height").toDouble();
                    }

                }
                //取出性别
                if(faceObj.contains("gender"))
                {
                    QJsonObject genderObj = faceObj.take("gender").toObject();
                    if(genderObj.contains("type"))
                    {
                         gender = genderObj.take("type").toString();
                         if(gender=="male")
                         {
                             FaceData.append("性别:").append("男").append("\r\n");
                         }
                         if(gender=="female")
                         {
                             FaceData.append("性别:").append("女").append("\r\n");
                         }

                    }
                }

                //取出表情
                if(faceObj.contains("emotion"))
                {
                    QJsonObject emotionObj = faceObj.take("emotion").toObject();
                    if(emotionObj.contains("type"))
                    {
                        QString emotion = emotionObj.take("type").toString();
                        if(emotion=="angry")
                        {
                            FaceData.append("表情:").append("愤怒").append("\r\n");
                        }
                        else if(emotion=="disgust")
                        {
                             FaceData.append("表情:").append("厌恶").append("\r\n");
                        }
                        else if(emotion=="fear")
                        {
                            FaceData.append("表情:").append("恐惧").append("\r\n");
                        }
                        else if(emotion=="happy")
                        {
                            FaceData.append("表情:").append("高兴").append("\r\n");
                        }
                        else if(emotion=="sad")
                        {
                             FaceData.append("表情:").append("伤心").append("\r\n");
                        }
                        else if(emotion=="surprise")
                        {
                            FaceData.append("表情:").append("惊讶").append("\r\n");
                        }
                        else if(emotion=="neutral")
                        {
                            FaceData.append("表情:").append("无表情").append("\r\n");
                        }
                        else if(emotion=="pouty")
                        {
                            FaceData.append("表情:").append("撅嘴").append("\r\n");
                        }
                        else if(emotion=="grimace")
                        {
                            FaceData.append("表情:").append("鬼脸").append("\r\n");
                        }
                        else
                        {
                            FaceData.append("表情:").append("其他").append("\r\n");
                        }
                    }
                }
                //判断是否戴眼镜
                if(faceObj.contains("glasses"))
                {
                    QJsonObject typeObj=faceObj.take("glasses").toObject();
                    if(typeObj.contains("type"))
                    {
                        type=typeObj.take("type").toString();
                        FaceData.append("眼镜:").append(type=="none"?"没戴眼镜":"戴眼镜了").append("\r\n");
                    }
                }
                //取出是否戴口罩
                if(faceObj.contains("mask"))
                {
                    QJsonObject maskObj = faceObj.take("mask").toObject();
                    if(maskObj.contains("type"))
                    {
                         mask = maskObj.take("type").toInt();
                        FaceData.append("口罩:").append(mask==0?"没带口罩":"戴口罩了").append("\r\n");
                    }
                }

                FaceData.append("\r\n");
             }
            }
        }
 ui->information->setText(FaceData);//显示人脸信息
    }
    //打印错误信息
    else
    {
        qDebug()<<jsonErr.errorString();
    }

    reply->deleteLater();
}
//使用线程进行数据处理优化速度
void Face::PreparePostData()
{
    //父类设置成this在运行结束时直接被系统回收
     childThread = new QThread(this);
     //创建线程对象
     FaceThread *worker = new FaceThread;
     //放入子线程
     worker->moveToThread(childThread);
     connect(this,&Face::startThread,worker,&FaceThread::TransformBase64);
     //转码结束启动识别
     connect(worker,&FaceThread::finishTransform,this,&Face::StartFaceDetect);
     //子线程处理结束后将线程对象进行回收
     connect(childThread,&QThread::finished,worker,&QObject::deleteLater);
     //启动子线程
     childThread->start();
     //发出启动线程的信号
     emit startThread(img,childThread);
}

void Face::ChooseCamera(int index)
{
    //qDebug()<<cameraList.at(index).description();
    //切换摄像头时先暂停当前的计时器和摄像头
    refreshtimer->stop();
    camera->stop();
    //重新初始化摄像头和对应的槽函数
    camera = new QCamera(cameraList.at(index));
    imgCapture = new QCameraImageCapture(camera);
    camera->setViewfinder(viewfinder);
    camera->setCaptureMode(QCamera::CaptureStillImage);
    imgCapture->setCaptureDestination(QCameraImageCapture::CaptureToBuffer);
    connect(imgCapture,&QCameraImageCapture::imageCaptured,this,&Face::showPicture);
    //重新启动摄像头和定时器
    camera->start();
    refreshtimer->start(10);
}


