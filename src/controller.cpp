#include "controller.h"

Controller::Controller(QObject *parent) : QObject(parent) {}

void Controller::conectar(QString host) {
    process = new QProcess(this);
    process->setWorkingDirectory("C:/Users/filip/Desktop/Vectra/src/dependence/MoonlightPortable-x64-6.1.0/");
    process->start(
        "C:/Users/filip/Desktop/Vectra/src/dependence/MoonlightPortable-x64-6.1.0/Moonlight.exe",
        QStringList() << "stream" << host << "Desktop"
        );
}

void Controller::desconectar() {
    if (process) {
        process->kill();
        process = nullptr;
    }
}