#include <iostream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "include/bluetooth-manager.hpp"
#include "include/bluetooth-standard/abstract-standard.hpp"

int main(int argc, char** argv) {
    const QGuiApplication app {argc, argv};
    QQmlApplicationEngine engine;
    BluetoothManager bluetooth_manager {};
    engine.rootContext()->setContextProperty("BluetoothManager", &bluetooth_manager);
    qmlRegisterUncreatableType<NoiseCancellationMode>("NCMode", 1, 0, "NoiseCancellationMode", "Enum only");
    // qmlRegisterType<NoiseCancellationMode>("No", 1, 0, "BluetoothManager");
    engine.load(QUrl {"qrc:/main.qml"});
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }
    return QGuiApplication::exec();
}