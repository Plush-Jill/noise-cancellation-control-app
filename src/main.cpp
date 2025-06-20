#include <iostream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "include/bluetooth-manager.hpp"
#include "include/bluetooth-standard/abstract-standard.hpp"

int main(int argc, char** argv) {
    const QGuiApplication app {argc, argv};
    QQmlApplicationEngine engine;
    engine.load(QUrl {"qrc:/main.qml"});
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }
    BluetoothManager bluetooth_manager {};

    return app.exec();
}