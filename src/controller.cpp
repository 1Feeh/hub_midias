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

void Controller::setResolucao(int largura, int altura, int index) {
    m_resolucao.m_largura = largura;
    m_resolucao.m_altura  = altura;
    m_resolucaoIndex      = index;
}
int Controller::getResolucaoIndex() {
    return m_resolucaoIndex;
}

void Controller::setFps(int fps, int index) {
    m_fps.m_fps = fps;
    m_fpsIndex  = index;
    std::cout << "carregou fps: " << fps << std::endl;
}

int Controller::getFpsIndex() {
    return m_fpsIndex;
}

void Controller::setBitrate(int bitrate, int index) {
    m_bitrate.m_bitrate = bitrate;
    m_bitrateIndex = index;
    std::cout << "carregou bitrate: " << bitrate << std::endl;
}

int Controller::getBitrateIndex() {
    return m_bitrateIndex;
}