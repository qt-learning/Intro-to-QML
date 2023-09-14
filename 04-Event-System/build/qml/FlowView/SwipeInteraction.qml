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
import TransitionItem 1.0
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0

Item {
    id: root
    property var transitionView
    property var list
    parent: transitionView
    anchors.fill: parent
    z: -1

    property real threshold: 35
    property bool horizontal: true
    property Item __activeItem
    property bool __reactToTransition: false

    Timer {
        id: blocker
        running: false
        interval: 200
        repeat: false
        onTriggered: handler.enabled = true
    }

    Connections {
        target: transitionView
        function onTransitionFinished() {
            if (!root.__reactToTransition)
                return
            /* This is a tricky one. We have to also update the list.
               The connection could be also done the other way around */
            list.currentItem = root.__activeItem
            root.__reactToTransition = false
        }
    }

    DragHandler {
        id: handler
        xAxis.enabled: root.horizontal
        yAxis.enabled: !root.horizontal
        target: null
        enabled: true

        function distance() {
            if (root.horizontal)
                return (centroid.position.x - centroid.pressPosition.x) / transitionView.width
            return -(centroid.position.y - centroid.pressPosition.y) / transitionView.height
        }

        onActiveChanged: {
            if (handler.active) {
                if (distance() < 0)
                    transitionView.nextItem = list.nextItem
                else
                    transitionView.nextItem = list.prevItem

                transitionView.scheduleTransition()
                if (transitionView.currentTransition)
                    transitionView.currentTransition.effect.enable()
            } else {
                var p = Math.abs(distance()) * 100
                if (transitionView.currentTransition && transitionView.currentTransition.effect.progress > root.threshold) {
                    root.__activeItem = transitionView.nextItem
                    root.__reactToTransition = true
                    transitionView.currentTransition.__start()
                } else { /* Drag was released, but threshold was not passed */
                    if (transitionView.currentTransition)
                        transitionView.currentTransition.effect.abort()
                }
                /* Block for 100ms */
                handler.enabled = false
                blocker.start()
            }
        }

        onCentroidChanged: {
            if (!handler.enabled)
                return

            var p = Math.abs(distance()) * 100

            if (transitionView.currentTransition)
                transitionView.currentTransition.effect.progress = p * 2
        }
    }
}
