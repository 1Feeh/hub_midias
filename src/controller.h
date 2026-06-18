#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QProcess>

struct Resolucao {
    int m_largura = 1280;
    int m_altura  = 960;
};

struct Fps {
    int m_fps = 60;
};

struct Bitrate {
    int m_bitrate = 5000;
};

class Controller : public QObject {

    Q_OBJECT

public:
    explicit Controller(QObject *parent = nullptr);
    Q_INVOKABLE void conectar(QString host);
    Q_INVOKABLE void desconectar();
    Q_INVOKABLE void setResolucao(int largura, int altura);
    Q_INVOKABLE void setFps(int fps);
    Q_INVOKABLE void setBitrate(int bitrate);

private:
    QProcess *process = nullptr;
    Resolucao m_resolucao;
    Fps m_fps;
    Bitrate m_bitrate;
};

#endif // CONTROLLER_H