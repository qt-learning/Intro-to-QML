import QtQuick

Window {
    id: root
    width: 640
    height: 360
    visible: true
    title: "Random Colors"

    /*
    Generate a random value for each color channel (red, green, blue)
    Set the color property of the root item to the generated color.
    */
    function colorRandomizer() {
        const r = Math.random();
        const g = Math.random();
        const b = Math.random();
        root.color = Qt.rgba(r, g, b, 1);
    }

    /*
    Create a timer that triggers the colorRandomizer function every second.
    */
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.colorRandomizer()
    }
}
