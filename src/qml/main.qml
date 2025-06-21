import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 200
    // minimumWidth: 500
    // minimumHeight: 400
    title: "Noise cancellation control"
    flags: Qt.FramelessWindowHint
    Rectangle {
        anchors.fill: parent
        color: "#f0f0f0"
        radius: 24
        border.color: "#888"
        border.width: 2

        ToolButton {
            id: closeButton
            text: "\u2715" // Unicode cross
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 8
            anchors.rightMargin: 8
            background: Rectangle {
                color: "transparent"
            }
            onClicked: window.close()
        }

        // Window drag area
        MouseArea {
            id: dragArea
            anchors.fill: parent
            property real clickX
            property real clickY
            onPressed: function(mouse) {
                clickX = mouse.x
                clickY = mouse.y
            }
            onPositionChanged: function(mouse) {
                if (mouse.buttons & Qt.LeftButton) {
                    window.x += mouse.x - clickX
                    window.y += mouse.y - clickY
                }
            }
            propagateComposedEvents: true
        }

        Column {
            anchors.centerIn: parent
            spacing: 12

            Text {
                text: "Device Name"
                font.pixelSize: 24
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
            Text {
                text: "Noise cancellation mode"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Row {
                spacing: 32
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    spacing: 8
                    RoundButton {
                        width: 64
                        height: 64
                        text: "Off"
                    }
                    Text {
                        text: "Noise cancellation off"
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        wrapMode: Text.WordWrap
                    }
                }

                Column {
                    spacing: 8
                    RoundButton {
                        width: 64
                        height: 64
                        text: "On"
                    }
                    Text {
                        text: "Noise cancellation on"
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        wrapMode: Text.WordWrap
                    }
                }

                Column {
                    spacing: 8
                    RoundButton {
                        width: 64
                        height: 64
                        text: "Ambient"
                    }
                    Text {
                        text: "Ambient sound"
                        font.pixelSize: 12
                        horizontalAlignment: Text.AlignHCenter
                        width: parent.width
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }
    }
}