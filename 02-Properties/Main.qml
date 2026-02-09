// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick

Window {
    id: root
    width: 1280
    height: 720
    visible: true
    title: qsTr("Hello World")

    Image {
        id: image
        source: "Images/Qt-Wheel-Car.jpg"

        Text {
            text: "Hello World"
            font.pointSize: 40
            anchors.centerIn: image
            color: "#00414A"
        }
    }
}
