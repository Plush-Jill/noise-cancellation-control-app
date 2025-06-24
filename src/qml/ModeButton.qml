import QtQuick
import QtQuick.Controls


RoundButton {
    id: customRoundButton
    property string mode: ""
    property string label: ""
    property bool isSelected: false

    width: 80
    height: 80
    text: label
    font.pixelSize: 14
    font.bold: true

    background: Rectangle {
        anchors.fill: parent
        color: isSelected ? buttonHighlightColor : buttonBackgroundColor
        radius: 40
        border.color: isSelected ? "#4a90e2" : buttonBorderColor
        border.width: isSelected ? 3 : 2

        // Selection indicator
        Rectangle {
            visible: isSelected
            width: 12
            height: 12
            radius: 6
            color: "#4a90e2"
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.margins: 8
        }

        // Subtle animation
        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        Behavior on border.color {
            ColorAnimation { duration: 200 }
        }
    }

    // Hover effect
    scale: hovered ? 1.05 : 1.0
    Behavior on scale {
        NumberAnimation { duration: 150 }
    }
}

