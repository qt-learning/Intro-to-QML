import QtQuick

Window {
    id: root
    width: 640
    height: 360
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: rectangle
        width: 100
        height: 100
        color: "#2CDE85"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Clicked")
            rectangle.x = Math.random() * (root.width - rectangle.width)
            rectangle.y = Math.random() * (root.height - rectangle.height)
        }
    }
}