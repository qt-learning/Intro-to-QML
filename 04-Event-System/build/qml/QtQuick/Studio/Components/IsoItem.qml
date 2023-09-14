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
import QtQuick 2.9
import QtQuick.Extras 1.4

/*!
    \qmltype IsoItem
    \inqmlmodule QtQuick.Studio.Components
    \since QtQuick.Studio.Components 1.0
    \inherits ShapePath
    \ingroup qtquickstudio-components

    \brief An ISO 7000 icon.

    The IsoItem type specifies an icon from an ISO 7000 icon library as a
    \l [QtQuickExtras] {Picture} type. The icon to use for the type and its
    color can be specified.

    \section2 Example Usage

    You can use the IsoItem type in \QDS to add ISO 7000 icons.

    \image studio-flipable.png

    The QML code looks as follows:

    \code
    IsoItem {
        id: arrowIsoIcon
        color: "#808080"
        anchors.fill: parent
        source: "./iso-icons/iso_grs_7000_4_0251.dat"
    }
    \endcode
*/

Picture {

}
