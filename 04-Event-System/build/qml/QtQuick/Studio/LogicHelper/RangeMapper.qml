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
    \qmltype RangeMapper
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Maps a numerical range to another range, so that the output value
    of the second range follows that of the original range.

    The minimum and maximum input and output values are specified as values of
    the \l inputMinimum, \l inputMaximum, \l outputMinimum, and \l outputMaximum properties.
    The original value is specified as the value of the \l output property.

    For example, if you map input in the range of \c {-1,1} to output in the
    range of \c {0,1000}, and the original value changes from -1 to 1, the
    output value will change from 0 to 1000. This is useful when remapping
    the current frame on the timeline, for example.

    Designers can use the Range Mapper type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use a RangeMapper type to map the value range
    from -1 to 1 that is specified for a \l Slider type to a range from 10 to
    1000:

    \code
    Rectangle {
        Slider {
            id: slider
            from: -1
            to: 1
            value: -1
        }
        RangeMapper {
            id: rangeMapper
            outputMinimum: 10
            outputMaximum: 1000
            inputMinimum: slider.from
            inputMaximum: slider.to
            input: slider.value
        }
    }
    \endcode
*/

QtObject {
    id: object

/*!
    The input value.
*/
    property real input: 0

/*!
    The output value.
*/
    property real output: {
        var slope = (object.outputMaximum - object.outputMinimum) / (object.inputMaximum - object.inputMinimum)
        return object.outputMinimum + slope * (object.input - object.inputMinimum)
    }

/*!
    The minimum input value.
*/
    property real inputMinimum: 0

/*!
    The maximum input value.
*/
    property real inputMaximum: 100

/*!
    The minimum output value.
*/
    property real outputMinimum: 0

/*!
    The maximum output value.
*/
    property real outputMaximum: 100

}
