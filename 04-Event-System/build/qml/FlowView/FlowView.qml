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

Item {
    id: root
    width: 200
    height: 200

    property FlowTransition defaultTransition

    property FlowTransition currentTransition

    property FlowTransition __forceTransition

    property list<FlowTransition> flowTransitions
    property list<FlowDecision> flowDecisions
    property list<FlowWildcard> flowWildcards

    property Item interaction: Item {
    }

    property bool __parentFlowChanged: false

    enum EffectEnum {
        Instant,
        Dissolve,
        Fade,
        Pop
    }

    property bool __blockHistory: false

    property bool __isFlowView: true

    function goBack() {
        if (root.__history.length === 0)
            return

        if (root.__parentFlowChanged) {
            root.__parentFlowChanged = false
            parentFlowView().goBack()
        }

        var poppedItem = root.__history.pop()

        root.__blockHistory = true
        root.activatedItem = poppedItem
        root.__activateItem()
        root.__blockHistory = false


        if (root.__history.length > 0)
            root.lastItem = root.__history.slice(-1)[0]
        else
            root.lastItem = null
    }

    function __activateItem() {
        if (!__isCompleted)
            return

        if (root.activatedItem === root.currentItem)
            return;

        if (root.activatedItem === root.nextItem)
            return;

        root.nextItem = root.activatedItem

        for (var i = 0; i <  root.allChildren.length; ++i) {
            if (root.allChildren[i] === root.activatedItem)
                root.currentIndex = i
        }

    }

    function parentFlowView() {
        var par = root.parent
        while (par) {
            if (par.__isFlowView)
                return par
            par = par.parent
        }
        return null
    }

    function parentFlowItem() {
        var par = root.parent
        while (par) {
            if (par.__isFlowItem)
                return par
            par = par.parent
        }
        return null

    }

    default property alias item: stack.data

    property Item nextItem

    property Item currentItem
    property Item activatedItem
    property Item lastItem
    property int currentIndex: 0

    //property list<Item> __history
    property var __history: []

    property int maxIndex: 0

    signal transitionFinished

    property alias __stack: stack

    Item {
        id: stack
        visible: false
    }

    property bool __isCompleted: false

    property real progress: 0

    property bool __blockSchedule: false

    onActivatedItemChanged: {
        root.__activateItem()
    }

    function resetCurrentIndex() {
        root.__blockSchedule = true
        root.lastItem = root.currentItem
        root.__history.push(root.lastItem)

        for (var i = 0; i <  root.allChildren.length; ++i) {
            if (root.allChildren[i] === root.currentItem)
                root.currentIndex = i
        }
        root.__blockSchedule = false
    }

    Component.onCompleted: {
        root.maxIndex = stack.children.length - 1

        root.allChildren = []

        for (var i = 0; i < stack.children.length; ++i) {
            root.allChildren.push(stack.children[i])
            if (stack.children[i].flowView !== undefined) {
                stack.children[i].flowView = root
                stack.children[i].init()
            }
        }

        /* Assign view to all flowTransitions */
        if (defaultTransition) {
            defaultTransition.transitionView = root
        }

        for (i = 0; i < root.flowWildcards.length; ++i) {
            var w = root.flowWildcards[i]
            w.transitionView = root
        }

        var t

        for (i = 0; i < root.flowTransitions.length; ++i) {
            t = root.flowTransitions[i]
            t.transitionView = root
        }

        for (i = 0; i < root.flowTransitions.length; ++i) {
            t = root.flowTransitions[i]
            if (root.checkInclude(t.from, root)) {
                root.currentItem = t.to[0]
                if (root.currentItem.stateChangeTarget !== undefined) {
                    root.currentItem.stateChangeTarget.setState(root.currentItem.targetState)
                    root.currentItem = root.currentItem.stateChangeTarget
                }
            }
        }

        root.resetCurrentIndex()

        __setupCurrentItem()
        __isCompleted = true
    }

    function checkInclude(list, item)
    {
        for (var i = 0; i < list.length; ++i) {
            if (list[i] === item)
                return true
        }
        return false
    }

    function scheduleTransition()
    {
        root.progress = 0

        var pageTransition = null

        /* find correct transition */
        for (var i = 0; i < root.flowTransitions.length; ++i) {
            var t = root.flowTransitions[i]
            if (checkInclude(t.from, root.currentItem) && checkInclude(t.to, root.nextItem)) {
                pageTransition = t
            }
        }

        if (pageTransition !== null) {

        } else {
            pageTransition = root.defaultTransition
        }

        if (root.currentTransition)
            root.currentTransition.__stop()

        /* If a specific transition is forced then use this one. */
        if (__forceTransition)
            pageTransition = __forceTransition
        __forceTransition = null

        root.currentTransition = pageTransition
        if (root.currentTransition)
            root.currentTransition.__reset(root.currentItem, root.nextItem)

        root.progress = Qt.binding(function () {
            if (root.currentTransition)
                return root.currentTransition.progress
            return 0
        })
    }

    onCurrentIndexChanged: {
        root.nextItem = root.allChildren[root.currentIndex]

       if (root.nextItem === root.currentItem)
            return

        if (root.__blockSchedule)
            return

        if (root.nextItem.stateChangeTarget !== undefined) {
            var itemVar = root.nextItem.stateChangeTarget
            var stateVar = root.nextItem.targetState
            itemVar.state = stateVar
            for (var i = 0; i <  root.allChildren.length; ++i) {
                if (root.allChildren[i] === itemVar)
                    root.currentIndex = i
            }
        }

        scheduleTransition()

        if (!root.__blockHistory) {
            root.lastItem = root.currentItem
            if (!Array.isArray(root.__history))
                root.__history = []

            root.__history.push(root.lastItem)
        }

        root.currentTransition.__start()
    }

    function __setupCurrentItem() {
        if (root.currentItem)
            root.currentItem.parent = stack

        if (root.nextItem)
            root.currentItem = root.nextItem
        else
            root.currentItem = root.allChildren[root.currentIndex]


        root.currentItem.parent = root
        root.currentTransition = null
        transitionFinished()
    }

    function gotoPage(transition) {
        var page = transition.to[0]
        /* There might be another transition that fits. We are forcing this one. */
        __forceTransition = transition
        for (var i = 0; i < root.allChildren.length; ++i) {
            if (page === root.allChildren[i]) {
                root.currentIndex = i
            }
        }
    }

    function gotoItem(item) {
        for (var i = 0; i < root.allChildren.length; ++i) {
            if (item === root.allChildren[i]) {
                root.currentIndex = i
                print("index " + i )
            }
        }
    }

    property var allChildren

    property Item __fromContentItem: Item {
        width: root.width
        height: root.height
        parent: root
    }

    property Item __toContentItem: Item {
        width: root.width
        height: root.height
        parent: root
    }
}


