#include <iostream>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char** argv) {
    const QGuiApplication app {argc, argv};
    QQmlApplicationEngine engine;
    engine.load(QUrl {"qrc:/main.qml"});
    if (engine.rootObjects().isEmpty()) {
        return -1;
    }

    return QGuiApplication::exec();
}