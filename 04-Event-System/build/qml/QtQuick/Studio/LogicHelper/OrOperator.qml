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
    \qmltype OrOperator
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Evaluates two boolean input values and provides the result as output.

    The OrOperator type evaluates two boolean inputs, \l input01 and \l input02.
    The \l output is evaluated as \c true if either \l input01 or \l input02 is
    evaluated as \c true.

    Designers can use the Or Operator type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use the checked state of two \l CheckBox
    types to determine the checked state of a third one:

    \code
    Rectangle {
        CheckBox {
            id: checkBox1
            text: qsTr("Check Box 1")
            checked: false
        }
        CheckBox {
            id: checkBox2
            text: qsTr("Check Box 2")
        }

        CheckBox {
            id: checkBox3
            text: qsTr("Check Box 3")
            checked: orOperator.output
        }

        OrOperator {
            id: orOperator
            input02: checkBox2.checked
            input01: checkBox1.checked
        }
    }
    \endcode

    \sa AndOperator, NotOperator
*/

QtObject {
    id: object

/*!
    The first value to evaluate.
*/
    property bool input01: false

/*!
    The second value to evaluate.
*/
    property bool input02: false

/*!
    The result of the evaluation.
*/
    property bool output: object.input01 || object.input02
}
