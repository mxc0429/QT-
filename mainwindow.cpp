#include "mainwindow.h"
#include "ui_mainwindow.h"
#include"face.h"
#include"hand.h"
#include<QPushButton>
#include<QVBoxLayout>
#include<QHBoxLayout>
#include<QPixmap>
#include<QIcon>
#include<QPushButton>
MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    this->setWindowTitle("图像识别系统");
    QIcon icon(":/image/Icon.png");
    setWindowIcon(icon);
    QPalette pal =this->palette();
    pal.setBrush(QPalette::Background,QBrush(QPixmap(":/image/background.jpg")));
    setPalette(pal);
    ui->title->setStyleSheet("color:white");


}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_faceDetect_clicked()
{
    Face f;
    f.showFaceView();
}

void MainWindow::on_handDetect_clicked()
{
    Hand h;
    h.showHandView();
}
