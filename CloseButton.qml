import QtQuick 2.0

Rectangle {
    id: root
    property int size
    property bool hovered: false
    width: size
    height: size
    color: "#c42"
    radius: size / 2

    signal clicked()

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
        hoverEnabled: true
        onEntered: root.hovered = true
        onExited: root.hovered = false
        Text {
            id: txt
            anchors.fill: parent
            anchors.leftMargin: 0
            anchors.topMargin: 0
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: "black"
            text: "x"//"\u2a2f" size issue with \u2a2f
            minimumPixelSize: 20
            font.weight: Font.Bold
            fontSizeMode: Text.VerticalFit
        }
    }

    states: [
        State {
            name: "down"; when: mouseArea.pressed
            PropertyChanges { target: txt; anchors.leftMargin: 2; anchors.topMargin: 2 }
            PropertyChanges { target: root; color: "red" }
            PropertyChanges { target: txt; color: "white" }
        },
        State {
            name: "hovered"; when: root.hovered && !mouseArea.pressed
            PropertyChanges { target: root; color: "red" }
            PropertyChanges { target: txt; color: "white" }
        }
    ]
}
