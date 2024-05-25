#ifndef FACETHREAD_H
#define FACETHREAD_H

#include <QObject>
#include<QJsonObject>
#include<QJsonParseError>
#include<QJsonDocument>
#include<QImage>
#include<QBuffer>
#include<QThread>
#include<QString>
#include<opencv2/opencv.hpp>
using namespace cv;
class FaceThread : public QObject
{
    Q_OBJECT
public:
    explicit FaceThread(QObject *parent = nullptr);
    QImage enhanceImage;
    long int count;
    // 选择保存格式
    const char* format = "jpg"; // 例如，保存为PNG格式

public slots:
    void TransformBase64(QImage img,QThread *childThread);//进行图片转码
signals:
    void finishTransform(QByteArray postData,QThread *childThread);//发出转码完成信号
};

#endif // FACETHREAD_H
