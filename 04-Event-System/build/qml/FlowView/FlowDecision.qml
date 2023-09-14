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

import QtQuick 2.15
import QtQuick.Window 2.14
import QtQuick.Controls 2.15

QtObject {
    id: root

    property list<FlowTransition> targets

    readonly property bool isFlowDecision: true

    property string dialogTitle: qsTr("Title")

    function trigger() {
        var hasDialog = false
        for (var i = 0; i <  root.targets.length; ++i) {
            if (root.targets[i].question !== "")
                hasDialog = true
        }

        if (hasDialog) {
            loader.show()
        }
    }

    property Loader loader: Loader {
        active: false
        function show() {
            active = true
            item.show()
            item.raise()
            item.requestActivate()
        }

        sourceComponent: windowComponent
    }

    property Component windowComponent:  Component {

        Window {

            id: dialog

            title: root.dialogTitle
            modality: Qt.WindowModal
            transientParent: root.Window.window

            width: 400
            height: column.height

            minimumWidth: 400
            minimumHeight: 100
            flags: Qt.Dialog | Qt.WindowStaysOnTopHint | Qt.WindowTitleHint

            Rectangle {
                id: background
                anchors.fill: parent

                ScrollView {
                    anchors.fill: parent


                    Column {
                        id: column
                        Repeater {
                            model: targets
                            Rectangle {
                                visible: root.targets[index].question !== ""
                                width: background.width
                                height: 20
                                opacity: mouseArea.containsMouse ? 1 : 0.8
                                color: index / 2 ? "#ebecf0" : "white"
                                MouseArea {
                                    id: mouseArea
                                    hoverEnabled: true
                                    onClicked: {
                                        root.targets[index].__decisionTrigger()
                                        loader.item.close()
                                        loader.active = false
                                    }
                                    anchors.fill: parent
                                }

                                Text {
                                    height: 20
                                    text: root.targets[index].question
                                    verticalAlignment: Text.AlignVCenter
                                }
                            }
                        }
                    }
                }
            }
        }

    }
}
