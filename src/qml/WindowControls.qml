import QtQuick
import QtQuick.Controls


Row {
    id: windowControls
    spacing: 8

    readonly property color closeButtonHoveredColor: "#ff5555"

    signal closeClicked()
    signal minimizeClicked()


    RoundButton {
        id: minimizeButton
        font.pixelSize: 16
        font.bold: true
        width: 24
        height: 24
        background: Rectangle {
            color: parent.hovered ? buttonDefaultHighlightColor : subComponentBackgroundColorRGBA

            radius: 12
            border.color: buttonBorderColor
            border.width: parent.hovered ? 1 : 0
        }
        onClicked: {
            window.showMinimized()
            // Принудительно восстанавливаем флаги после разворачивания
            Qt.callLater(function() {
                window.flags = Qt.Window | Qt.FramelessWindowHint
            })
        }
    }

    RoundButton {
        id: closeButton
        font.pixelSize: 16
        font.bold: true
        width: 24
        height: 24

        background: Rectangle {
            color: parent.hovered ? closeButtonHoveredColor : subComponentBackgroundColorRGBA
            radius: 12
            border.color: buttonBorderColor
            border.width: parent.hovered ? 1 : 0

            ColorAnimation{
                duration: 500
            }
        }
        onClicked: closeClicked()
    }
}