// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Item {
    // Create a QtObject for our cat.
    QtObject {
        id: patron
        property string name: "patron"
        property int age: 6
    }

    // Create a property for the cat.
    property QtObject cat: patron

    Component.onCompleted: {
        // Modify the cat's name and age.
        cat.name = "mafya";
        cat.age = 5;

        // Print Patron's name and age. Notice that values are updated with the cat's values.
        console.log("Name:", patron.name, "Age:", patron.age);
    }
}