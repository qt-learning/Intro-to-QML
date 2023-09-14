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

import QtQuick 2.12

Item {
    id: flowItem

    width: 400
    height: 400

    property var flowView: Item {}

    property alias loaderSource: loader.source

    property var stateChangeTarget

    property string targetState

    property string defaultState: undefined

    property bool forceActive: false

    property bool __isFlowItem: true

    function setState(newState) {
        flowItem.state = newState
    }

    property bool active: {
        if (flowItem.forceActive)
            return true;
        if (flowItem.flowView !== null
                && flowItem.flowView.currentItem !== undefined
                && flowItem.flowView.currentItem === flowItem)
            return true

        if (flowItem.flowView !== null
                && flowItem.flowView.nextItem !== undefined
                && flowItem.flowView.nextItem === flowItem)
            return true

        return false
    }

    Loader {
        id: loader
        active: flowItem.active
    }


    function init() {

        flowItem.x = 0
        flowItem.y = 0

        flowItem.defaultState = flowItem.state
        var itemVar
        var i

        if (flowItem.stateChangeTarget === undefined) {

            for (i = 0; i < flowItem.children.length; ++i) {
                itemVar = flowItem.children[i]
                if (itemVar.isActionArea === true
                        && !itemVar.fromStateChange) {
                    itemVar.activeState = flowItem.state
                }

            }
        } else {
            var childNum = flowItem.children.length
            var childArray = []

            for (i = 0; i < flowItem.children.length; ++i) {
                childArray.push(flowItem.children[i])
            }

            for (i = 0; i < childNum; ++i) {
                itemVar = childArray[i]

                if (itemVar.isActionArea === true) {
                    itemVar.fromStateChange = true
                    itemVar.activeState = flowItem.targetState
                    itemVar.parent = flowItem.stateChangeTarget
                }
            }
        }
    }
}
