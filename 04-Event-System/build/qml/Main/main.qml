import QtQuick

/*
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
*/

Window {
    id: window
    width: 640
    height: 360
    visible: true
    title: qsTr("Hello World")
    color: "#00414A"

    component SquareButton: Rectangle {
        id: root

        // These are the signal declarations.
        signal activated(xPosition:real, yPosition:real)
        signal deactivated

        property int side: 100
        width: side; height: side
        color: "#2CDE85"

        MouseArea {
            anchors.fill: parent
            // This will emit the signal when the mouse is released.
            onReleased: root.deactivated()
            /*
            This will emit the signal when the mouse is pressed.
            The mouse position is passed as an argument.
            */
            onPressed: (mouse)=> root.activated(mouse.x, mouse.y)
        }
    }

    SquareButton{
        // This will print "Deactivated" when the mouse is released.
        onDeactivated: console.log("Deactivated")
        // This will print "Activated at: <xPosition> <yPosition>" when the mouse is pressed.
        onActivated: (xPosition, yPosition)=> console.log("Activated at:", xPosition, yPosition)
    }
}