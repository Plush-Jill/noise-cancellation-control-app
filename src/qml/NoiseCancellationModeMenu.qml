import QtQuick
import QtQuick.Controls
import NCMode 1.0

Column {
    id: modeSelectMenu
    spacing: 12
    property string currentMode: "off"
    // property int mode: Noi

    signal modeChanged(string mode)

    Text {
        text: "Noise Cancellation Mode"
        font.pixelSize: 16
        font.bold: true
        color: textColor
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Row {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter

        ModeButton {
            mode: "off"
            label: "Off"
            isSelected: currentMode === "off"
            onClicked: modeChanged("off")
        }

        ModeButton {
            mode: "on"
            label: "On"
            isSelected: currentMode === "on"
            onClicked: modeChanged("on")
        }

        ModeButton {
            mode: "ambient"
            label: "Ambient"
            isSelected: currentMode === "ambient"
            onClicked: modeChanged("ambient")
        }
    }
}