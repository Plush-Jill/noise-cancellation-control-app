import QtQuick
import QtQuick.Controls
import QtQuick.Effects


RoundButton {
    id: customRoundButton
    property string mode: ""
    property string label: ""
    property bool isSelected: false

    property real hoverScale: 1.02
    property real pressScale: 0.98
    property real targetScale: 1.0
    readonly property color selectedButtonBorderColor: "#4a90e2"

    scale: targetScale
    width: 80
    height: 80
    text: label
    font.pixelSize: 14
    font.bold: true
    // opacity: 0  // 60% opacity
    background: Rectangle {
        id: bachgroundRectangle
        anchors.fill: parent
        // color: isSelected ? buttonDefaultHighlightColor : buttonBackgroundColor
        color: isSelected ?
            Qt.rgba(buttonDefaultHighlightColor.r, buttonDefaultHighlightColor.g, buttonDefaultHighlightColor.b, subComponentBackgroundOpacity) :
            subComponentBackgroundColorRGBA
        radius: 40
        border.color: isSelected ? selectedButtonBorderColor : buttonBorderColor
        border.width: isSelected ? 3 : 2

        MultiEffect {
            source: bachgroundRectangle
            anchors.fill: blurBackground
            blurEnabled: true
            blurMax: 16
            blur: 1.5
            opacity: 0.05
        }

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

