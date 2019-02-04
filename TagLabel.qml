import QtQuick 2.0
import QtQuick.Controls 2.4

Rectangle {
    id: root
    property int horizontalMargin: 6
    property int verticalMargin: 3
    width: childrenRect.width + 2 * horizontalMargin
    height: childrenRect.height + 2 * verticalMargin
    radius: height / 2
    color: "#08f"
    property alias text: textLabel.text
    property alias textColor: textLabel.color
    property bool closeButton: false
    property int closeButtonSize: 15
    signal closeClicked()
    property bool selected: false

    Row {
        anchors.centerIn: parent
        spacing: 4

        Text {
            id: textLabel
            color: "#fff"
            font.weight: Font.Bold
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                hoverEnabled: true
                onClicked: root.focus = true
            }
        }
        CloseButton {
            size: closeButtonSize
            visible: root.closeButton
            onClicked: root.closeClicked()
        }
    }

    states: [
        State {
            name: "selected"; when: root.selected
            PropertyChanges { target: root; border.color: "#00f" }
        },
        State {
            name: "hovered"; when: mouseArea.containsMouse
            PropertyChanges { target: root; color: "#2af" }
        }
    ]
}
