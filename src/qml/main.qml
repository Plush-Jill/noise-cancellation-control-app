import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window
import QtQuick.Effects

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 280
    title: ""  // Пустой заголовок
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"

    // Принудительно скрываем заголовок после показа окна
    // onVisibilityChanged: {
    //     if (visibility === Window.Windowed || visibility === Window.Maximized) {
    //         flags = Qt.Window | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    //     }
    // }

    // Color theme
    readonly property color backgroundColor: Qt.rgba(0.53, 0.53, 0.53, 0.85) // Semi-transparent
    readonly property color borderColor: "#595959"
    readonly property color buttonBackgroundColor: "#a8a8a8"
    readonly property color buttonBorderColor: "#3f3f3f"
    readonly property color buttonHighlightColor: "#e0e0e0"
    readonly property color textColor: "#000000"
    readonly property color closeButtonColor: "#ff5555"

    readonly property color defaultDarkColor: "#000000"

    // State management
    property string selectedDevice: "Device 1"
    property string noiseCancellationMode: "off" // "off", "on", "ambient"

    // Дополнительная защита от появления заголовка
    Component.onCompleted: {
        window.flags = Qt.Window | Qt.FramelessWindowHint
        window.title = ""
    }

    // Отслеживаем изменения состояния окна
    onActiveChanged: {
        if (active) {
            window.flags = Qt.Window | Qt.FramelessWindowHint
            window.title = ""
        }
    }

    Item {
        id: rootContainer
        anchors.fill: parent

        // Background with blur effect
        Rectangle {
            id: blurBackground
            anchors.fill: parent
            anchors.margins: 1
            color: backgroundColor
            radius: 24
            border.color: borderColor
            border.width: 2

            // Blur effect for the background
            MultiEffect {
                source: blurBackground
                anchors.fill: blurBackground
                // blurEnabled: true
                // blurMax: 16
                // blur: 1.5
                opacity: 0.05
            }
        }

        // Main content
        Rectangle {
            id: contentBackground
            anchors.fill: parent
            anchors.margins: 1
            color: Qt.rgba(backgroundColor.r, backgroundColor.g, backgroundColor.b, 0.7)
            radius: 24
            border.color: borderColor
            border.width: 2

            // Window controls
            WindowControls {
                id: windowControls
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.margins: 8
                onCloseClicked: Qt.quit()
                onMinimizeClicked: window.showMinimized()
            }

            // Drag area for window movement
            MouseArea {
                id: dragArea
                anchors.fill: parent
                anchors.topMargin: 40 // Avoid interference with window controls

                property point clickPos: Qt.point(0, 0)

                onPressed: function(mouse) {
                    clickPos = Qt.point(mouse.x, mouse.y)
                }

                onPositionChanged: function(mouse) {
                    if (pressed) {
                        window.x += mouse.x - clickPos.x
                        window.y += mouse.y - clickPos.y
                    }
                }

                propagateComposedEvents: true
            }

            // Main content layout
            ColumnLayout {
                id: mainLayout
                anchors.centerIn: parent
                spacing: 20
                width: parent.width - 40

                // Device selector
                DeviceSelector {
                    id: deviceSelector
                    textColor: defaultDarkColor
                    Layout.alignment: Qt.AlignHCenter
                    selectedDevice: window.selectedDevice
                    onDeviceChanged: function(device) {
                        window.selectedDevice = device
                        console.log("Selected device:", device)
                    }
                }

                // Mode selector
                NoiseCancellationModeMenu {
                    id: modeSelector
                    Layout.alignment: Qt.AlignHCenter
                    currentMode: window.noiseCancellationMode
                    onModeChanged: function(mode) {
                        window.noiseCancellationMode = mode
                        console.log("Noise cancellation mode:", mode)
                    }
                }
            }
        }
    }
}