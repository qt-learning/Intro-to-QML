import QtQuick

Window {
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")

    Image {
        id: image
        source: "qrc:/images/Qt-Wheel-Car.jpg"

        Text {
            text: "Hello World"
            font.pointSize: 40
            anchors.centerIn: image
            color: "#00414A"
        }
    }
}