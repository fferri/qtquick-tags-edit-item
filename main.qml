import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Flow {
        id: flow
        anchors.margins: 10
        anchors.fill: parent
        spacing: 5

        Repeater {
            id: repeater
            model: ListModel {id: modelTags}

            TagLabel {
                id: label
                text: modelData
                closeButton: true
                onCloseClicked: {
                    for(var i = modelTags.count - 1; i >= 0; i--)
                        if(modelTags.get(i).text == text)
                            modelTags.remove(i)
                }
            }
        }

        TextInput {
            text: "Type a tag here"
            selectByMouse: true
            onAccepted: {
                modelTags.append({"text": text})
                text = ""
            }
            onFocusChanged: if(focus) selectAll(); else if(text == "") text = "Type a tag here";
        }
    }
}
