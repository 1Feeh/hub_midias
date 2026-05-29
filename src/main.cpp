#include <QGuiApplication> //1 lib
#include <QQmlApplicationEngine> //2 lib
#include <QQmlContext>
#include <iostream> //3 lib padrao do C++
#include "controller.h"

int main(int argc, char *argv[])
{
    //qputenv("QSG_RHI_BACKEND", "vulkan");// muda a api de renderizacao
    QGuiApplication app(argc, argv);//2 passa or argumentos/comandos de entrada ou de inicializacao
    QQmlApplicationEngine engine; //2 estancia o objeto

    Controller controller;
    engine.rootContext()->setContextProperty("Controller", &controller);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("Vectra", "Init");
    std::cout<<"hello"<<std::endl;

    return QGuiApplication::exec();
}