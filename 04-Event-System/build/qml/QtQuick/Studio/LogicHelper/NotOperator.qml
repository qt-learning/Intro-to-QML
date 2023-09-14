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
    \qmltype NotOperator
    \inqmlmodule QtQuick.Studio.LogicHelper
    \since QtQuick.Studio.LogicHelper 1.0
    \inherits QtObject

    \brief Evaluates a boolean input value and provides the result as output.

    The NotOperator type evaluates the boolean input \l input. The \l output
    value is evaluated as \c true if \l input is evaluated as \c false.

    Designers can use the Not Operator type in \QDS instead of writing
    JavaScript expressions.

    \section1 Example Usage

    In the following example, we use the checked state of a \l CheckBox to
    determine the checked state of another one:

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
            checked: notOperator.output
        }
        NotOperator {
            id: notOperator
            input: checkBox1.checked
        }
    }
    \endcode

    \sa AndOperator, OrOperator
*/

QtObject {
    id: object

/*!
    The value to evaluate.
*/
    property bool input: false

/*!
    The result of the evaluation.
*/
    property bool output: !object.input
}
