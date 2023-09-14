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

import QtQuick 2.0

/*!
    \qmltype GroupItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits Item

    \brief A group item that gets its size from its children.

    The Group type is an \l Item type extended with the size property. The value
    of size is automatically calculated to fit the children of the group.

    \section2 Example Usage

    You can use the Group type to specify the size of one or several items.

    \image studio-group.png

    The QML code looks as follows:

    \code
    GroupItem {
        id: group

        Rectangle {
        id: rectangle
        width: 200
        height: 200
        color: "#c2c2c2"
        }

        Rectangle {
        id: rectangle1
        x: 140
        y: 140
        width: 200
        height: 200
        color: "#000000"
        }
    }
    \endcode
*/

Item {
    implicitWidth: Math.max(16, childrenRect.width + childrenRect.x)
    implicitHeight: Math.max(16, childrenRect.height + childrenRect.y)
}
