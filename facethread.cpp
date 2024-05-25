#include "facethread.h"
#include<QDebug>
#include<QDir>
#include <QDateTime>
#include <QImage>
#include <QPixmap>
#include <QFileDialog>
#include <QMessageBox>
#include <QScreen>
#include <QGuiApplication>
#include <QImageWriter>
using namespace  cv;
FaceThread::FaceThread(QObject *parent) : QObject(parent)
{

}

void FaceThread::TransformBase64(QImage img, QThread *childThread)
{
    //qDebug()<<"子线程线程开始工作"<<endl;
    //对摄像头获取的图片进行图像增强算法
    //将QImage转化成OpenCV对应的图像格式
    Mat src=Mat(img.height(), img.width(),CV_8UC4,(void*)img.constBits(),img.bytesPerLine());
    Mat greayImage;
    Mat FinalImage=src;
    //将图像转化成灰度图
    cvtColor(src,greayImage,COLOR_RGB2GRAY);
    //通过mean方法计算图像的平均灰度值
    double Mean = mean(greayImage)[0];
    //qDebug()<<Mean<<endl;
    //曝光度大于180进行伽马变换降低曝光度
    if(Mean>180)
    {
        //伽马增强
        float pixels[256];
        for (int i = 0; i < 256; i++)
          {

              pixels[i] = powf(i,4);
          }
           Mat srcLog(src.size(), CV_32FC4);
           for (int i = 0; i < src.rows; i++)
           {
             for (int j = 0; j < src.cols; j++)
              {

                srcLog.at<Vec4f>(i, j)[0] = pixels[src.at<Vec4b>(i, j)[0]];
                srcLog.at<Vec4f>(i, j)[1] = pixels[src.at<Vec4b>(i, j)[1]];
                srcLog.at<Vec4f>(i, j)[2] = pixels[src.at<Vec4b>(i, j)[2]];
              }
           }
           //归一化到0~255
           normalize(srcLog, srcLog, 0, 255, NORM_MINMAX);
           //转换成8bit图像显示
           convertScaleAbs(srcLog,FinalImage);
    }
    //曝光度小于50使用对数LOG算法提高图片的亮度
   if(Mean<50)
   {
       Mat dst(src.size(), CV_32FC4);
       for (int i = 0; i < src.rows; i++)
       {
          for (int j = 0; j < src.cols; j++)
             {
               dst.at<Vec4f>(i, j)[0] = log(1 + src.at<Vec4b>(i, j)[0]);
               dst.at<Vec4f>(i, j)[1] = log(1 + src.at<Vec4b>(i, j)[1]);
               dst.at<Vec4f>(i, j)[2] = log(1 + src.at<Vec4b>(i, j)[2]);
              }
       }
       //归一化到0~255
       normalize(dst, dst, 0, 255, NORM_MINMAX);
       //转换成8bit图像显示
       convertScaleAbs(dst,FinalImage);
   }
    //直方图均衡化图像增强
    Mat src_RGB[4], dst;

    split(FinalImage, src_RGB);

    for (int i = 0; i < 4; i++)
    {
        equalizeHist(src_RGB[i], src_RGB[i]);
    }
    merge(src_RGB, 4, dst);
    enhanceImage=QImage((const unsigned char*)dst.data, dst.cols, dst.rows, dst.step, QImage::Format_ARGB32);
    //保存图片
    QDateTime CurrentTime=QDateTime::currentDateTime();
    QString saveTime = CurrentTime.toString("yyyy-MM-dd-HH-mm-ss");
    //qDebug()<<saveTime;
    QString fileName = saveTime+".png";
    //将文件保存路径设置成项目对应的文件夹，需要在Debug目录下创建文件夹才能保存对应的文件
//    QString filePath = "./EnhanceImage/Face";
    bool is_save=enhanceImage.save(QString("./EnhanceImage/Face/%1").arg(fileName),"PNG");
    if(is_save)
    {
        qDebug()<<"图片保存成功";
    }
    else
    {
        qDebug()<<"图片保存失败";
    }
    //图像增强后进行Base64转码
    QByteArray Barr;
    QBuffer buff(&Barr);
    enhanceImage.save(&buff,"png");
    QString base64_str = Barr.toBase64();
    //qDebug()<<base64_str<<endl;
    //设置POSTJSON数据
    QJsonObject PostJson;
    QJsonDocument doc;
    PostJson.insert("image",base64_str);
    PostJson.insert("image_type","BASE64");
    PostJson.insert("face_field","age,expression,face_shape,gender,glasses,emotion,face_type,mask");
    //最大处理人脸数量
    PostJson.insert("max_face_num",100);
    doc.setObject(PostJson);
    QByteArray postData = doc.toJson(QJsonDocument::Compact);//设置JSON数据格式为一整行
    //转码完成发出信号
    emit finishTransform(postData,childThread);
}
