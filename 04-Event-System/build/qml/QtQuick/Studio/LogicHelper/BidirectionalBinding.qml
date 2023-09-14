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
    \qmltype BidirectionalBinding
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Binds the values of two controls bi-directionally.

    The BidirectionalBinding type binds the values of two controls
    together, so that when one value is changed, the other one follows it.
    For example, this type could be used to synchronize two sliders or a
    slider and checkbox. Typically, it is used to bind a backend value to
    a control, such as a slider.

    The \l target01 and \l target02 properties specify the ids of the components
    to bind together. The \l property01 and \l property02 properties specify the
    names the properties to synchronize.

    Designers can use the BidirectionalBinding type in \QDS instead of writing
    JavaScript expressions.

    A \l StringMapper type can be used to add a text property that displays the
    value.

    \section1 Example Usage

    In the following example, we bind the values of two \l Slider types
    together bidirectionally:

    \code
    Rectangle {
        Slider {
            id: slider
            value: 0.5
        }
        Slider {
            id: slider1
            value: 0.5
        }

        BidrectionalBinding {
            id: biDirectBinding
            property02: "value"
            property01: "value"
            target02: slider1
            target01: slider
        }
    }
    \endcode
*/

QtObject {
    id: object

/*!
    The id of the component to bind to \l target02.
*/
    property QtObject target01

/*!
    The id of the component to bind to \l target01.
*/
    property QtObject target02

/*!
    The name of the property to synchronize with \l property02.
*/
    property string property01

/*!
    The name of the property to synchronize with \l property01.
*/
    property string property02

    property QtObject __internal: QtObject {
        property variant value01
        property variant value02

        property bool block: false

        onValue01Changed: {
            if (__internal.block)
                return;

            __internal.block = true;
            try {
                object.target02[property02] =  __internal.value01
            } catch(error) {
            }
            __internal.block = false;
        }

        onValue02Changed: {
            if (__internal.block)
                return;

            __internal.block = true;
            try {
                object.target01[property01] =  __internal.value02
            } catch(error) {
            }
            __internal.block = false;
        }
    }

    property Binding __b01: Binding {
        target: __internal
        property: "value01"
        value: target01[property01]
    }

    property Binding __b02: Binding {
        target: __internal
        property: "value02"
        value: target02[property02]
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
