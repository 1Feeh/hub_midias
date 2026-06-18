#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QProcess>

struct Resolucao {
    int m_largura = 1920;
    int m_altura  = 1080;
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

    Q_INVOKABLE void setResolucao(int largura, int altura, int index);
    Q_INVOKABLE int getResolucaoIndex();

    Q_INVOKABLE void setFps(int fps, int index);
    Q_INVOKABLE int getFpsIndex();

    Q_INVOKABLE void setBitrate(int bitrate, int index);
    Q_INVOKABLE int getBitrateIndex();

private:
    QProcess *process = nullptr;

    Resolucao m_resolucao;
    int m_resolucaoIndex = 1;

    Fps m_fps;
    int m_fpsIndex = 1;

    Bitrate m_bitrate;
    int m_bitrateIndex = 1;  // Médio padrão
};

#endif // CONTROLLER_H