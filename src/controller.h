#ifndef CONTROLLER_H
#define CONTROLLER_H

#endif // CONTROLLER_H

#pragma once
#include <QObject>
#include <QProcess>

class Controller : public QObject {
    Q_OBJECT
public:
    explicit Controller(QObject *parent = nullptr);

    Q_INVOKABLE void conectar(QString host);

    Q_INVOKABLE void desconectar();
private:
    QProcess *process = nullptr;
};