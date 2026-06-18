#include "controller.h"
#include <iostream>

Controller::Controller(QObject *parent) : QObject(parent) {}

void Controller::conectar(QString host) {
    process = new QProcess(this);
    process->setWorkingDirectory("C:/Users/filip/Desktop/Vectra/src/dependence/MoonlightPortable-x64-6.1.0/");
    process->start(
        "C:/Users/filip/Desktop/Vectra/src/dependence/MoonlightPortable-x64-6.1.0/Moonlight.exe",
        QStringList() << "stream"
                      << host
                      << "Desktop"
                      << "--resolution" << QString::number(m_resolucao.m_largura) + "x" + QString::number(m_resolucao.m_altura)
                      << "--fps"        << QString::number(m_fps.m_fps)
                      << "--bitrate"    << QString::number(m_bitrate.m_bitrate)
        );
}

void Controller::desconectar() {
    if (process) {
        process->kill();
        process = nullptr;
    }
}

void Controller::setResolucao(int largura, int altura) {
    m_resolucao.m_largura = largura;
    m_resolucao.m_altura  = altura;
    std::cout<<"carregou resolucao"<<std::endl;
}

void Controller::setFps(int fps) {
    m_fps.m_fps = fps;
    std::cout<<"carregou fps"<<std::endl;
}

void Controller::setBitrate(int bitrate) {
    m_bitrate.m_bitrate = bitrate;
    std::cout<<"carregou bitrate"<<std::endl;
}