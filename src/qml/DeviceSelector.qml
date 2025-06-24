import QtQuick
import QtQuick.Controls


Column {
    id: root
    spacing: 8
    property string selectedDevice: "Device 1"
    property color textColor: "#000000"
    signal deviceChanged(string device)

    Text {
        text: "Audio Device"
        font.pixelSize: 14
        font.bold: true
        color: textColor
        anchors.horizontalCenter: parent.horizontalCenter
    }

    ComboBox {
        id: deviceCombo
        width: 200
        height: 36
        model: BluetoothManager.getConnectedDevices()
        currentIndex: model.indexOf(selectedDevice)
        font.pixelSize: 14
        font.bold: true

        background: Rectangle {
            color: buttonBackgroundColor
            radius: 8
            border.color: borderColor
            border.width: 1
        }

        delegate: ItemDelegate {
            width: deviceCombo.width
            // height: 32

            contentItem: Text {
                id: textContent
                text: modelData
                color: root.textColor
                font: deviceCombo.font
                verticalAlignment: Text.AlignVCenter
                leftPadding: 12
            }

            background: Rectangle {
                color: highlighted ? buttonHighlightColor : buttonBackgroundColor
                radius: 4
            }
        }

        popup: Popup {
            y: deviceCombo.height + 2
            width: deviceCombo.width
            padding: 4

            background: Rectangle {
                color: buttonBackgroundColor
                border.color: buttonBorderColor
                border.width: 1
                radius: 8
            }

            contentItem: ListView {
                clip: true
                implicitHeight: contentHeight
                model: deviceCombo.popup.visible ? deviceCombo.delegateModel : null
            }
        }

        onCurrentTextChanged: deviceChanged(currentText)
    }
}