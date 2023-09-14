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
    \qmltype MinMaxMapper
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Provides access to values that are out or range.

    The MinMaxMapper type has output values even if the input value is out
    of range or too small or big. This enables applying actions to values
    even if they are out of range, such as changing a color in a state.

    To access the values of a control, the \l input property of the
    minimum-maximum mapper is bound to that of the \c value property
    of the control.

    For example, to restrict the maximum value of a slider to 0.60,
    regardless of the maximum value set in the slider properties,
    we bind the value of the \l input property of the mapper to
    the value of the \c value property of the slider and set the value
    of the \l maximum property to 0.60.

    The \l outOfRange, \l aboveMaximum and \l belowMinimum properties are set to
    \c true if the value of the \l input property is out of range.
    For example, in the context of speed, \l aboveMaximum being \c true
    would mean \e {too fast}, whereas \l belowMinimum being \c true would
    mean \e {too slow}, and \l outOfRange being \c true would mean
    \e {either too fast or too slow}.

    Designers can use the Min Max Mapper type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use the MinMaxMapper type to restrict the
    maximum value of a \l Slider type to 0.60, regardless of the maximum
    value set in the Slider properties:

    \code
    Rectangle {
        Slider {
            id: slider
            value: 0.5
        }
        MinMaxMapper {
            id: minMaxMapper
            input: slider.value
            maximum: 0.6
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
    Whether \l input is less than \l minimum.
*/
    property bool belowMinimum: object.input < object.minimum

/*!
    Whether \l input is larger than \l maximum.
*/
    property bool aboveMaximum: object.input > object.maximum

/*!
    Whether \l input is out of range. Returns \c true if \l belowMinimum or
    \l aboveMaximum is \c true.
*/
    property bool outOfRange: object.aboveMaximum ||object.belowMinimum

/*!
    The value of \l input. If \l aboveMaximum is \c true, returns the value of
    \l maximum. If \l belowMinimum is \c true, returns the value of \l minimum.
*/
    property real output: {
        if (object.aboveMaximum)
            return object.maximum

        if (object.belowMinimum)
            return object.minimum

        return object.input
    }

/*!
    The minimum value of \l input.
*/
    property real minimum: 0

/*!
    The maximum value of \l input.
*/
    property real maximum: 100
}
