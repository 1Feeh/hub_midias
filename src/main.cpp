#include <QGuiApplication> //1 lib
#include <QQmlApplicationEngine> //2 lib
#include <iostream> //3 lib padrao do C++

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);//2 passa or argumentos/comandos de entrada ou de inicializacao

    QQmlApplicationEngine engine; //2 estancia o objeto

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