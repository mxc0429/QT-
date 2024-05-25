#ifndef HANDTHREAD_H
#define HANDTHREAD_H

#include <QObject>
#include<QJsonObject>
#include<QJsonParseError>
#include<QJsonDocument>
#include<QImage>
#include<QBuffer>
#include<QThread>
#include<QDebug>
#include<opencv2/opencv.hpp>
#include<opencv2/highgui.hpp>
using namespace cv;
class HandThread : public QObject
{
    Q_OBJECT
public:
    explicit HandThread(QObject *parent = nullptr);
    QImage enhanceImage;
    Mat src;
public slots:
    void TransformUrlencode(QImage img,QThread *childThread);
signals:
    void finishThransform(QByteArray postData,QThread *childThread);
};

#endif // HANDTHREAD_H
