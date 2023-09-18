import QtQuick

Item {
    property string name: "Patron"
    property string cat: name
    property string dog: name

    Component.onCompleted: {
        dog = "Tekila";
        console.log("Dog: " + dog);
        console.log("Cat: " + cat);
    }
}