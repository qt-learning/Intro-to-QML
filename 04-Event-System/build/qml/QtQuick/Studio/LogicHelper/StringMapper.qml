/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Designer Components.
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

import QtQuick 2.10

/*!
    \qmltype StringMapper
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Converts numbers to strings with the defined precision.

    The StringMapper type maps numbers to strings. The string mapper
    \l input property is bound to the \c value property of a control that
    provides the number and the \l text property of the string mapper is
    mapped to the \c text property of type that displays the string.

    Designers can use the String Mapper type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use \l Text type to display the numerical
    value of a \l Slider type as a string:

    \code
    Rectangle {
        Slider {
            id: slider
            value: 0.5
        }
        Text {
            id: text1
            text: stringMapper.text
        }
        StringMapper {
            id: stringMapper
            input: slider.value
        }
    }
    \endcode
*/

QtObject {
    id: object

/*!
    The value to convert to a string.
*/
    property real input: 0

/*!
    The number of digits after the decimal separator.
*/
    property int decimals: 2

/*!
    The \l input value as a string.
*/
    property string text: object.input.toFixed(object.decimals)
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
