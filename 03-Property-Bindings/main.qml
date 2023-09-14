import QtQuick

Window {
    id: root
    width: 1280/2
    height: 720/2
    visible: true
    title: qsTr("Hello World")


    property bool isClicked: false // This boolean will store the state of the mouse click

    Rectangle {
        id: rectangle
        width: root.width / 2
        height: root.height / 2
        color: isClicked ? "#2CDE85" : "#00414A" // Change the colour based on the boolean value

        MouseArea {
            anchors.fill: rectangle
            onClicked: isClicked = !isClicked // Toggle the boolean value
        }
    }
}
