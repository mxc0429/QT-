#ifndef HAND_H
#define HAND_H

#include <QWidget>
#include<QDialog>
#include<QCamera>
#include<QCameraViewfinder>
#include<QCameraImageCapture>
#include<QTimer>
#include<QImage>
#include<QHBoxLayout>
#include<QDebug>
#include<QVBoxLayout>
#include<QNetworkAccessManager>
#include<QNetworkReply>
#include<QUrl>
#include<QUrlQuery>
#include<QSslConfiguration>
#include<QJsonObject>
#include<QJsonParseError>
#include<QJsonDocument>
#include<QJsonArray>
#include<QImage>
#include<QBuffer>
#include<QThread>
#include<QCameraInfo>
#include<QComboBox>
#include<QPainter>
#include<QIcon>
#include"handthread.h"
namespace Ui {
class Hand;
}

class Hand : public QDialog
{
    Q_OBJECT

public:
    explicit Hand(QWidget *parent = nullptr);
    QCamera *camera;//摄像头类
    QCameraViewfinder *viewfinder;//取景器
    QCameraImageCapture *imgCapture;//拍照对象
    QImage img;//照片信息
    QTimer *refreshtimer;//刷新照片
    QTimer *netWorktimer;//刷新网络请求的定时器
    QNetworkAccessManager *tokenManager;//token请求
    QNetworkAccessManager *imgManager;//图片请求
    QSslConfiguration sslConfiguration;//配置ssl信息
    QString access_token;//acces_token信息
    QThread *childThread;//子线程
    QList<QCameraInfo>cameraList;//摄像头设备名称
     int leastTime;//判断时间戳
     //手势定位信息
     double handTop[100];
     double handWidth[100];
     double handLeft[100];
     double handHight[100];
     int hand_num;
    ~Hand();
public slots:
    //定义的显示照片和拍照片的槽函数
    void showPicture(int id,QImage view);
    void Capture();
    void showHandView();
    //网络请求的配置
    void TokenReply(QNetworkReply *reply );//返回Token
    void StartHandDetect(QByteArray postData,QThread *overThread);//将照片传到上传进行检测
    void imgReply(QNetworkReply *reply);//解析照片返回的信息
    //创建线程处理函数
    void PreparePostData();
    //选择摄像头槽函数
    void ChooseCamera(int index);
signals:
    void startThread(QImage img,QThread *childThread);
private:
    Ui::Hand *ui;
};

#endif // HAND_H
