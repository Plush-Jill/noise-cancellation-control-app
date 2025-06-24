import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window
import QtQuick.Effects


ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 200
    title: ""
    flags: Qt.Window | Qt.FramelessWindowHint
    color: "transparent"
    // background: null
    property color backgroundColor: "#868686"
    property color borderColor: "#595959"
    property color buttonBackgroundColor: "#a8a8a8"
    property color buttonBorderColor: "#3f3f3f"
    property color buttonBackgroundHighlightColor: "#e0e0e0"
    property color defaultDarkColor: "#000000"

    Item {
        id: rootItem
        anchors.fill: parent

        MultiEffect {
            source: background
            anchors.fill: background
            blurEnabled: true
            blurMax: 32
            blur: 1.0
            opacity: 0.6
        }

        Rectangle {
            id: background
            anchors.fill: parent
            anchors.margins: 1
            // color: Qt.rgba(backgroundColor.r, backgroundColor.g, backgroundColor.b, 0.8) // Добавляем прозрачность
            color: backgroundColor
            radius: 24
            border.color: borderColor
            border.width: 2

            MouseArea {
                id: dragArea
                anchors.fill: parent
                property real clickX
                property real clickY
                onPressed: function (mouse) {
                    clickX = mouse.x
                    clickY = mouse.y
                }
                onPositionChanged: function (mouse) {
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

                ComboBox {
                    id: deviceSelector
                    width: 180
                    height: 32
                    model: ["Device 1", "Device 2", "Device 3"]  // Замените на реальный список устройств
                    font.pixelSize: 16
                    font.bold: true
                    anchors.horizontalCenter: parent.horizontalCenter

                    background: Rectangle {
                        color: buttonBackgroundColor
                        radius: 12
                        border.color: borderColor
                        border.width: 2
                    }

                    delegate: ItemDelegate {
                        width: deviceSelector.width
                        contentItem: Text {
                            text: modelData
                            color: defaultDarkColor
                            font: deviceSelector.font
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }
                        highlighted: deviceSelector.highlightedIndex === index
                        background: Rectangle {
                            color: highlighted ? buttonBackgroundHighlightColor : buttonBackgroundColor
                            radius: 8
                        }
                    }

                    popup: Popup {
                        y: deviceSelector.height
                        width: deviceSelector.width
                        padding: 1

                        background: Rectangle {
                            color: buttonBackgroundColor
                            border.color: buttonBorderColor
                            border.width: 2
                            radius: 8
                        }

                        contentItem: ListView {
                            clip: true
                            implicitHeight: contentHeight
                            model: deviceSelector.popup.visible ? deviceSelector.delegateModel : null
                        }
                    }

                    onCurrentTextChanged: {
                        console.log("Selected device:", currentText)
                    }
                }
                Text {
                    text: "Noise cancellation mode"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Row {
                    component ButtonBackground: Rectangle {
                        anchors.fill: parent
                        color: buttonBackgroundColor
                        radius: 24
                        border.color: buttonBorderColor
                        border.width: 2
                    }
                    spacing: 48
                    anchors.horizontalCenter: parent.horizontalCenter

                    Column {
                        spacing: 8
                        RoundButton {
                            width: 80
                            height: 80
                            font.pixelSize: 16
                            font.bold: true
                            text: "Off"
                            background: ButtonBackground {
                            }
                            onClicked: {
                                console.log("Noise cancellation off button clicked")
                            }

                        }
                    }

                    Column {
                        spacing: 8
                        RoundButton {
                            width: 80
                            height: 80
                            font.pixelSize: 16
                            font.bold: true
                            text: "On"
                            background: ButtonBackground {
                            }
                            onClicked: {
                                console.log("Noise cancellation on button clicked")
                            }
                        }
                    }

                    Column {
                        spacing: 8
                        RoundButton {
                            width: 80
                            height: 80
                            font.pixelSize: 16
                            font.bold: true
                            text: "Ambient"
                            background: ButtonBackground {
                            }
                            onClicked: {
                                console.log("Ambient sound button clicked")
                            }
                        }
                    }
                }
            }
        }
    }
}