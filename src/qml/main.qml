import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window

ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 200
    title: "Noise cancellation control"
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"

    component ButtonBackground: Rectangle {
        anchors.fill: parent
        color: "#8883d2"
        radius: 24
        border.color: "#5986ce"
        border.width: 2
    }
    // background: null

    Rectangle {
        anchors.fill: parent
        color: "#605d95"
        radius: 24
        border.color: "#4669a1"
        border.width: 2


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
                if (mouse.buttons && Qt.LeftButton) {
                    window.x += mouse.x - clickX
                    window.y += mouse.y - clickY
                }
            }
            propagateComposedEvents: true
        }

        Button {
            id: closeButton
            text: "\u2715" // Unicode cross
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.topMargin: 8
            anchors.rightMargin: 8
            background: Rectangle {
                color: "transparent"
                border.width: 0
            }
            onClicked: Qt.quit()
        }
        Button {
            id: minimizeButton
            text: "__"
            font.pixelSize: 20
            anchors.top: parent.top
            anchors.right: closeButton.right
            anchors.topMargin: 8
            anchors.rightMargin: 32
            background: Rectangle {
                color: "transparent"
                border.width: 0
            }
            onClicked: window.showMinimized()
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
                spacing: 48
                anchors.horizontalCenter: parent.horizontalCenter

                Column {
                    spacing: 8
                    RoundButton {
                        width: 64
                        height: 64
                        text: "Off"
                        background: ButtonBackground {}
                        onClicked: {
                            console.log("Noise cancellation off button clicked")
                        }

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
                        background: ButtonBackground {}
                        onClicked: {
                            console.log("Noise cancellation on button clicked")
                        }
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
                        background: ButtonBackground {}
                        onClicked: {
                            console.log("Ambient sound button clicked")
                        }
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