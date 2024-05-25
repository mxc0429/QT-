#include "handthread.h"
#include<QDir>
#include <QDateTime>
#include <QImage>
#include <QPixmap>
#include <QFileDialog>
#include <QMessageBox>
#include <QScreen>
#include <QGuiApplication>
#include <QImageWriter>
HandThread::HandThread(QObject *parent) : QObject(parent)
{

}

void HandThread::TransformUrlencode(QImage img, QThread *childThread)
{
    //qDebug()<<"子线程启动工作"<<endl;
    //对摄像头获取的图片进行图像增强算法
    Mat src=Mat(img.height(), img.width(),
               CV_8UC4,(void*)img.constBits(),img.bytesPerLine());
    Mat greayImage;
    Mat FinalImage=src;
    cvtColor(src,greayImage,COLOR_RGB2GRAY);
    double Mean = mean(greayImage)[0];
    //qDebug()<<Mean<<endl;
    //曝光度大于180进行伽马变换降低曝光度
    if(Mean>180)
    {
        //伽马增强
        float pixels[256];
           for (int i = 0; i < 256; i++)
           {
               //i的四次方
                pixels[i] = powf(i,4);
           }
           Mat srcGamma(src.size(), CV_32FC4);
           for (int i = 0; i < src.rows; i++)
           {
               for (int j = 0; j < src.cols; j++)
               {
                   //幂律变换(伽马变换)
                   srcGamma.at<Vec4f>(i, j)[0] = pixels[src.at<Vec4b>(i, j)[0]];
                   srcGamma.at<Vec4f>(i, j)[1] = pixels[src.at<Vec4b>(i, j)[1]];
                   srcGamma.at<Vec4f>(i, j)[2] = pixels[src.at<Vec4b>(i, j)[2]];
               }
           }
           //归一化到0~255
           normalize(srcGamma, srcGamma, 0, 255, NORM_MINMAX);
           //转换成8bit图像显示
           convertScaleAbs(srcGamma,FinalImage);
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
    QString fileName = saveTime+".png";
    //将文件保存路径设置成项目对应的文件夹，需要在Debug目录下创建文件夹才能保存对应的文件
    QString filePath = "./EnhanceImage/Face";
    enhanceImage.save(QString("./EnhanceImage/Hand/%1").arg(fileName),"PNG");
//    if(is_save)
//    {
//        qDebug()<<"图片保存成功";
//    }
//    else
//    {
//        qDebug()<<"图片保存失败";
//    }
    //图像增强后进行Base64转码
    QByteArray Barr;
    QBuffer buff(&Barr);
    enhanceImage.save(&buff,"png");
    //手势识别图像格式转换
    QByteArray postData="image=";
    postData.append(Barr.toBase64().toPercentEncoding());
    //qDebug()<<postData;
    //完成转码发出信号
    emit finishThransform(postData,childThread);
}
