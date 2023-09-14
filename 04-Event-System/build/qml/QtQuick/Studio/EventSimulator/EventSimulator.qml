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

pragma Singleton
import QtQuick 2.10
import QtQuick.Window 2.2
import QtQuick.Studio.EventSystem 1.0

QtObject {
    id: root

    property ListModel __filteredModel: ListModel{}
    property font font: {
        family: "Verdana"
        bold: true
    }

    property alias cellColor: simulatorWindow.cellColor
    property alias borderColor: simulatorWindow.borderColor
    property alias textColor: simulatorWindow.textColor
    property alias backgroundColor: simulatorWindow.backgroundColor
    property alias listView: list

    property alias x: simulatorWindow.x
    property alias y: simulatorWindow.y

    property alias width: simulatorWindow.width
    property alias height: simulatorWindow.height


    function show()
    {
        simulatorWindow.show()
        simulatorWindow.raise()
    }

    function hide()
    {
        simulatorWindow.hide()
        simulatorWindow.lower()
    }

    function __filterModel(idFilter) {
        __filteredModel.clear()

        // reset the model when the filter is empty
        var alwaysAdd = idFilter === ""

        for (var i = 0; i < EventSystem.model.count; i++) {
            if (alwaysAdd || EventSystem.model.get(i).eventId.startsWith(idFilter)) {
                __filteredModel.append(EventSystem.model.get(i))
            }
        }
    }

    property Window eventDialog: Window {
        id: simulatorWindow
        width: 200
        height: 1280
        color: backgroundColor

        property color cellColor: defaultPalette.mid
        property color borderColor: defaultPalette.light
        property color textColor: defaultPalette.text
        property color backgroundColor: defaultPalette.window

        SystemPalette {
            id: defaultPalette
            colorGroup: SystemPalette.Active
        }

        Component.onCompleted: {
            // call the filter with an empty string to populate the list after component is created
            root.__filterModel("")
        }
        Rectangle {
            id: inputContainer
            color: defaultPalette.shadow
            height: 25
            width: 190
            x: 5

            border {
                color: simulatorWindow.borderColor
                width: 1
            }
            anchors.horizontalCenter: simulatorWindow.horizontalCenter

            TextInput {
                id: filterInput
                text: qsTr("Filter...")
                color: root.textColor

                leftPadding: 5
                verticalAlignment: Text.AlignVCenter
                anchors.fill: inputContainer

                selectByMouse: true
                KeyNavigation.tab: list

                onTextEdited: {
                    root.__filterModel(this.text);
                }

                onEditingFinished: {
                    list.focus = true
                }

                onActiveFocusChanged: {
                    if (focus == true) {
                        if (text === "Filter...") {
                            filterInput.clear()
                        }
                    } else {
                        if (text === "") {
                            text = qsTr("Filter...")
                        }
                    }
                }
            }
        }
        ListView {
            id: list
            width: inputContainer.width
            anchors {
                top: inputContainer.bottom
                left: inputContainer.left
                bottom: parent.bottom
            }
            clip: true
            focus: true
            spacing: 2

            model: root.__filteredModel
            delegate: EventSimulatorDelegate { }

        }
    }
}
