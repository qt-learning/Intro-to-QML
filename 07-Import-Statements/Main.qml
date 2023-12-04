import QtQuick
import "script.mjs" as MyScript

Window {
    visible: true
    width: 640; height: 480

    MouseArea {
        anchors.fill: parent
        onClicked: {
            MyScript.showCalculations(10)
            console.log("Call square() from QML:",
                MyScript.square(10))
        }
    }
}