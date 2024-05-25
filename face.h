#ifndef FACE_H
#define FACE_H

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
#include<QPainter>
#include"facethread.h"
#include<QCameraInfo>
#include<QComboBox>
#include<QIcon>
#include<QDir>
#include<opencv2/highgui.hpp>
#include<opencv2/opencv.hpp>
using namespace cv;
namespace Ui {
class Face;
}

class Face : public QDialog
{
    Q_OBJECT

public:
    explicit Face(QWidget *parent = nullptr);
    QCamera *camera;//摄像头类
    QCameraViewfinder *viewfinder;//取景器
    QCameraImageCapture *imgCapture;//拍照对象
    QImage img;//照片信息
    Mat src;
    QImage enhanceImage;
    QTimer *refreshtimer;//刷新照片的定时器
    QTimer *netWorktimer;//刷新网络请求的定时器
    QNetworkAccessManager *tokenManager;//token请求
    QNetworkAccessManager *imgManager;//图片请求
    QSslConfiguration sslConfiguration;//配置ssl信息
    QString access_token;//acces_token信息
    QThread *childThread;//创建子线程
    QList<QCameraInfo>cameraList;
     int leastTime;//判断时间戳
    //人脸信息
    double age;
    QString gender;
    QString type;
    int mask;
    int face_num;
    //人脸定位信息
    double faceTop[100];
    double faceWidth[100];
    double faceLeft[100];
    double faceHight[100];

    ~Face();
public slots:
    //定义的显示照片和拍照片的槽函数
    void showPicture(int id,QImage view);
    void Capture();
    void showFaceView();
    //网络请求的配置
    void TokenReply(QNetworkReply *reply );//返回Token
    void StartFaceDetect(QByteArray postDate,QThread *overThread);//将照片传到上传进行检测
    void imgReply(QNetworkReply *reply);//解析照片返回的信息
    //创建线程进行转码操作
    void PreparePostData();
    //选择摄像头的槽函数
    void ChooseCamera(int index);
signals:
    //启动线程工作的信号
    void startThread(QImage img,QThread *childThread);
private:
    Ui::Face *ui;
};

#endif // FACE_H
