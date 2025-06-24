import QtQuick
import QtQuick.Controls


Row {
    id: windowControls
    spacing: 8
    signal closeClicked()
    signal minimizeClicked()

    Button {
        id: minimizeBtn
        text: "−"
        font.pixelSize: 16
        font.bold: true
        width: 24
        height: 24
        background: Rectangle {
            color: parent.hovered ? buttonHighlightColor : "transparent"
            radius: 12
            border.color: borderColor
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

    Button {
        id: closeBtn
        text: "×"
        font.pixelSize: 16
        font.bold: true
        width: 24
        height: 24
        background: Rectangle {
            color: parent.hovered ? closeButtonColor : "transparent"
            radius: 12
            border.color: borderColor
            border.width: parent.hovered ? 1 : 0
        }
        onClicked: closeClicked()
    }
}