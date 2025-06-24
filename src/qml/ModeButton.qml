import QtQuick
import QtQuick.Controls


RoundButton {
    id: customRoundButton
    property string mode: ""
    property string label: ""
    property bool isSelected: false

    property real hoverScale: 1.02
    property real pressScale: 0.98
    property real targetScale: 1.0


    scale: targetScale
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

        // Subtle animation
        Behavior on color {
            ColorAnimation { duration: 200 }
        }

        Behavior on border.color {
            ColorAnimation { duration: 200 }
        }
    }

    function updateScale() {
        if (pressed) {
            targetScale = pressScale
        } else if (hovered) {
            targetScale = hoverScale
        } else {
            targetScale = 1.0
        }
    }

    onHoveredChanged: updateScale()
    onPressedChanged: updateScale()

    Behavior on targetScale {
        NumberAnimation { duration: 200; easing.type: Easing.OutCubic }
    }
    // Hover effect
    // scale: hovered ? 1.05 : 1.0
    // Behavior on scale {
    //     NumberAnimation { duration: 150 }
    // }
}

