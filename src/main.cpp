#include <iostream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "include/bluetooth-manager.hpp"
#include "include/bluetooth-standard/abstract-standard.hpp"

int main(int argc, char** argv) {
    const QGuiApplication app {argc, argv};
    QGuiApplication::setApplicationDisplayName("NCC App");
    // 1. Регистрируем типы
    qmlRegisterUncreatableType<NoiseCancellationMode>("NCMode", 1, 0, "NoiseCancellationMode", "Enum only");

    // 2. Создаем engine и BluetoothManager
    QQmlApplicationEngine engine;
    BluetoothManager bluetooth_manager {};

    // 3. Устанавливаем контекстные свойства ДО загрузки QML
    engine.rootContext()->setContextProperty("BluetoothManager", &bluetooth_manager);

    // 4. Загружаем QML ПОСЛЕ установки контекстных свойств
    engine.load(QUrl {"qrc:/main.qml"});
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return QGuiApplication::exec();
}