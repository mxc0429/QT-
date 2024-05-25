#include "hand.h"
#include "ui_hand.h"

Hand::Hand(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Hand)
{
    ui->setupUi(this);
    setWindowTitle("手势识别系统");
    QIcon icon(":/image/Icon.png");
    setWindowIcon(icon);
    QPalette pal =this->palette();
    pal.setBrush(QPalette::Background,QBrush(QPixmap(":/image/background.jpg")));
    setPalette(pal);
    cameraList=QCameraInfo::availableCameras();
    //下拉框显示可用摄像头信息
    for(const QCameraInfo &tempCamera:cameraList)
    {
        ui->DeviceName->addItem(tempCamera.description());
    }
    //初始化摄像头模块
    camera = new QCamera();
    viewfinder = new QCameraViewfinder();
    imgCapture = new QCameraImageCapture(camera);
    //设置取景器和拍照方式以及捕获的照片存放目的地
    camera->setViewfinder(viewfinder);
    camera->setCaptureMode(QCamera::CaptureStillImage);
    imgCapture->setCaptureDestination(QCameraImageCapture::CaptureToBuffer);
    camera->start();
    //连接下拉框和摄像头函数
    connect(ui->DeviceName,QOverload<int>::of(&QComboBox::currentIndexChanged)
            ,this,&Hand::ChooseCamera);
    //设置各个控件的布局位置
    this->resize(1000,750);
    QVBoxLayout *vboxl=new QVBoxLayout;
    vboxl->addWidget(ui->view);
    vboxl->addWidget(ui->Capture);
    QVBoxLayout *vboxr=new QVBoxLayout;
    vboxr->addWidget(ui->DeviceName);
    vboxr->addWidget(viewfinder);
    vboxr->addWidget(ui->information);
    QHBoxLayout *hbox=new QHBoxLayout(this);
    hbox->addLayout(vboxl);
    hbox->addLayout(vboxr);
    this->setLayout(hbox);
    //连接拍照函数
    //点一下按钮拍一张connect(ui->Capture,&QPushButton::clicked,this,&ImageProcess::Capture);
    //将信号和显示图片的槽连接起来
    connect(imgCapture,&QCameraImageCapture::imageCaptured,this,&Hand::showPicture);
    //使用计时器进行动态的照片显示
    refreshtimer = new QTimer(this);
    connect(refreshtimer,&QTimer::timeout,this,&Hand::Capture);
    refreshtimer->start(10);//10毫秒刷新一次

    //配置token获取网络请求
    tokenManager = new QNetworkAccessManager(this);
    connect(tokenManager,&QNetworkAccessManager::finished,this,&Hand::TokenReply);
    //设置url，如果出现找不到主机情况可能是网络认证到期了，需要登录百度智能云平台进行接口认证
    QUrl url("https://aip.baidubce.com/oauth/2.0/token");
    QUrlQuery query;
    query.addQueryItem("grant_type","client_credentials");
    query.addQueryItem("client_id","kesKWEsmRCwXu7orYdBxQK8L");
    query.addQueryItem("client_secret","bpIO5N62Mg6fgVXfbNDFtBZzXfyGH6bl");
    url.setQuery(query);
    //设置SSl
    sslConfiguration =  QSslConfiguration::defaultConfiguration();
    sslConfiguration.setProtocol(QSsl::TlsV1_1);
    sslConfiguration.setPeerVerifyMode(QSslSocket::QueryPeer);
    //设置请求格式
    QNetworkRequest req;
    req.setUrl(url);
    req.setSslConfiguration(sslConfiguration);
    tokenManager->get(req);
    //点击按钮进行网络请求
    connect(ui->Capture,&QPushButton::clicked,this,&Hand::PreparePostData);
    imgManager = new QNetworkAccessManager(this);
    connect(imgManager,&QNetworkAccessManager::finished,this,&Hand::imgReply);
    //设置网络请求定时器进行动态刷新
    netWorktimer = new QTimer(this);
    connect(netWorktimer,&QTimer::timeout,this,&Hand::PreparePostData);
}

Hand::~Hand()
{
    delete ui;
}
//拍照函数
void Hand::Capture()
{
    //调用默认的拍照函数进行拍照
    imgCapture->capture();
}
//显示照片函数
void Hand::showPicture(int id, QImage view)
{
    Q_UNUSED(id);//没有使用到id类
    this->img=view;
    //画出人脸的定位框
    QPainter p(&img);
    for(int i=0;i<100;i++)
    {
        if(handLeft[i]!=0&&handTop[i]!=0&&handHight[i]!=0&&handWidth[i]!=0)
        {
            p.setPen(Qt::blue);
            p.drawRect(handLeft[i],handTop[i],handWidth[i],handHight[i]);
        }

    }

    //将取景器的图片显示到Lable里
    ui->view->setPixmap(QPixmap::fromImage(img));
}

void Hand::showHandView()
{
    this->exec();
}
//获取access_token值
void Hand::TokenReply(QNetworkReply *reply)
{
    //返回信息有错进行返回
    if(reply->error()!=QNetworkReply::NoError)
    {
        qDebug()<<reply->errorString();
        return;
    }
    //记录所有返回的信息
    const QByteArray reply_ifo=reply->readAll();
    //设置Json数据进行数据解析
    QJsonParseError JsonErr;
    QJsonDocument doc=QJsonDocument::fromJson(reply_ifo,&JsonErr);
    //Json解析没出错
    if(JsonErr.error==QJsonParseError::NoError)
    {
        QJsonObject obj=doc.object();
        //取出access_token值
        if(obj.contains("access_token"))
        {
            access_token=obj.take("access_token").toString();
        }
        //ui->information->setText(access_token);
    }
    else{
        qDebug()<<JsonErr.errorString();
    }
    //回收数据
    reply->deleteLater();
    //netWorktimer->start(1000);

}
//将照片进行转码并上传
void Hand::StartHandDetect(QByteArray postData,QThread *overThread)
{
    /*QByteArray Barr;
    QBuffer buff(&Barr);
    img.save(&buff,"png");
    //手势识别格式转化成urlencode
    QByteArray postData="image=";
    postData.append(Barr.toBase64().toPercentEncoding());*/

    //发送网络请求前先将线程关闭防止造成卡顿
    overThread->quit();
    overThread->wait();
    QUrl url("https://aip.baidubce.com/rest/2.0/image-classify/v1/gesture");
    QUrlQuery query;
    query.addQueryItem("access_token",access_token);
    url.setQuery(query);
    //设置网络请求
    QNetworkRequest req;
    req.setUrl(url);
    req.setSslConfiguration(sslConfiguration);
    req.setHeader(QNetworkRequest::ContentTypeHeader,QVariant("application/x-www-form-urlencoded"));
    imgManager->post(req,postData);


}
//将返回的值进行解析和处理
void Hand::imgReply(QNetworkReply *reply)
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
        QString HandIfo;//用来拼接所有的json信息
        //取出最外层json
        QJsonObject obj=doc.object();
        //手势识别Json解析
        if(obj.contains("result_num"))
        {
            int resultNum=obj.take("result_num").toInt();
            if(obj.contains("result"))
            {
                QJsonArray objArr=obj.take("result").toArray();
                for(int i=0;i<100;i++)
                {
                    handTop[i]=0;
                    handWidth[i]=0;
                    handLeft[i]=0;
                    handHight[i]=0;
                }
                hand_num=0;
                //遍历返回的Json数组
                for (int i=0;i<resultNum;i++)
                {
                    QJsonObject handObj=objArr.at(i).toObject();
                    if(handObj.contains("classname"))
                    {

                        QString handClass=handObj.take("classname").toString();
                        if(handClass!="Face")
                        {
                            hand_num++;
                            handTop[i]=handObj.take("top").toDouble();
                            handLeft[i]=handObj.take("left").toDouble();
                            handHight[i]=handObj.take("height").toDouble();
                            handWidth[i]=handObj.take("width").toDouble();
                            if(handClass=="One")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字1").append("\r\n");
                            }
                            else if(handClass=="Two")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字2").append("\r\n");
                            }
                            else if(handClass=="Three")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字3").append("\r\n");
                            }
                            else if(handClass=="Four")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字4").append("\r\n");
                            }
                            else if(handClass=="Five")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字5").append("\r\n");
                            }
                            else if(handClass=="Six")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字6").append("\r\n");
                            }
                            else if(handClass=="Seven")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字7").append("\r\n");
                            }
                            else if(handClass=="Eight")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字8").append("\r\n");
                            }
                            else if(handClass=="Nine")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("数字9").append("\r\n");
                            }
                            else if(handClass=="Rock")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("摇滚").append("\r\n");
                            }
                            else if(handClass=="Insult")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("竖中指").append("\r\n");
                            }
                            else if(handClass=="Fist")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("拳头").append("\r\n");
                            }
                            else if(handClass=="OK")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("OK").append("\r\n");
                            }
                            else if(handClass=="Prayer")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("祈祷").append("\r\n");
                            }
                            else if(handClass=="Congratulation")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("作揖").append("\r\n");
                            }
                            else if(handClass=="Honour")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("作别").append("\r\n");
                            }
                            else if(handClass=="Heart_single")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("单手比心").append("\r\n");
                            }
                            else if(handClass=="Thumb_up")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("点赞").append("\r\n");
                            }
                            else if(handClass=="Thumb_down")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("鄙视").append("\r\n");
                            }
                            else if(handClass=="ILY")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("我爱你").append("\r\n");
                            }
                            else if(handClass=="Palm_up")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("掌心向上").append("\r\n");
                            }
                            else if(handClass=="Heart_1"||handClass=="Heart_2"||handClass=="Heart_3")
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("双手比心").append("\r\n");
                            }
                            else
                            {
                                HandIfo.append("手势").append(QString::number(hand_num)).append(":")
                                        .append("其他").append("\r\n");
                            }
                        }
                        ui->information->setText(HandIfo);
                    }

                }
            }
        }
    }
}

void Hand::PreparePostData()
{
    //父类设置为this可以进行自动回收
    childThread = new QThread(this);
    //初始化线程对象
    HandThread *worker=new HandThread;
    //放入子线程
    worker->moveToThread(childThread);
    //启动子线程进行转码
    connect(this,&Hand::startThread,worker,&HandThread::TransformUrlencode);
    //转码结束后进行识别
    connect(worker,&HandThread::finishThransform,this,&Hand::StartHandDetect);
    //将子线程进行回收
    connect(childThread,&QThread::finished,worker,&QObject::deleteLater);
    //启动子线程
    childThread->start();
    //发出启动线程的信号
    emit startThread(img,childThread);
}

void Hand::ChooseCamera(int index)
{
    qDebug()<<cameraList.at(index).description()<<endl;
    //停止计时器和摄像头
    refreshtimer->stop();
    camera->stop();
    //重新初始化摄像头
    camera = new QCamera(cameraList.at(index));
    imgCapture = new QCameraImageCapture(camera);
    camera->setViewfinder(viewfinder);
    camera->setCaptureMode(QCamera::CaptureStillImage);
    imgCapture->setCaptureDestination(QCameraImageCapture::CaptureToBuffer);
    connect(imgCapture,&QCameraImageCapture::imageCaptured,this,&Hand::showPicture);
    //重新启动摄像头
    camera->start();
    refreshtimer->start(10);
}
