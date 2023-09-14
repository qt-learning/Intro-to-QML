/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Studio Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12

Item {

    width: 200
    height: 200
    id: root
    property bool flip: false
    property bool rotate: false

    property int thickness: 45

    property int arrowSize: 80

    property int radius: 5
    property color color: "#b6b3b3"

    property bool corner: false

    property bool flipCorner: false

    Item {
        id: content
        implicitWidth: Math.max(16, childrenRect.width + childrenRect.x)
        implicitHeight: Math.max(16, childrenRect.height + childrenRect.y)
        anchors.centerIn: parent

        scale: root.flip ? -1 : 1
        rotation: root.rotate ? 90 : 0

        TriangleItem {
            id: triangle
            x: 0
            y: 0
            anchors.verticalCenter: rectangle.verticalCenter
            rotation: -90
            strokeWidth: -1
            width: root.arrowSize
            height: root.arrowSize
            radius: root.radius
            fillColor: root.color
        }

        RectangleItem {
            id: rectangle
            x: root.arrowSize - root.radius * 2
            //y: ((root.rotate ? root.width : root.height) - root.thickness) / 2
            width: (root.rotate ? root.height : root.width) - (root.arrowSize - root.radius * 2)
            height: root.thickness
            strokeWidth: -1
            radius: root.radius
            fillColor: root.color
        }
        RectangleItem {
            id: rectangle1
            x: 260
            y: 202
            width: root.corner ? root.thickness : 0
            strokeWidth: -1
            height: root.corner ? (root.rotate ? root.width : root.height) / 2 : 0
            anchors.bottom: root.flipCorner ? undefined : rectangle.verticalCenter
            anchors.top: root.flipCorner ? rectangle.verticalCenter : undefined
            anchors.right: rectangle.right
            fillColor: root.color
            visible: root.corner
        }
    }
}
