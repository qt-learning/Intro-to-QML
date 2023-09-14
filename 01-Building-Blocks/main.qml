import QtQuick

// This is an object declaration.
Window {
    // This is an identifier.
    id: root
    // These are properties of the object.
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    // This is a nested object declaration.
    Rectangle {
        // The width and height here are bindings.
        width: root.width / 2
        height: root.height / 2
        color: "#00414a"
    }

    // This is a signal handler.
    onWidthChanged: (value)=>{
        console.log("width changed to: " + value)}
}
