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
import QtQuick.Studio.EventSystem 1.0

Item {
    width: 80
    height: 40

    id: root

    enum ActionType{
        LeftPress = 0,
        LeftDoublePress = 1,
        LeftLongPress = 2,
        RightPress = 3,
        RightDoublePress = 4,
        RightLongPress = 5,
        FlickUp = 6,
        FlickDown = 7,
        FlickLeft = 8,
        FlickRight = 9,
        PinchIn = 10,
        PinchOut = 11
    }

    Item {
        id: priv

        property double dragStartTime;
        property point dragStartPoint;
    }

    signal triggered

    property real maxDragTime: 500
    property real minDragDistance: 50
    property real minPinchFactor: 2.0

    property int eventType: FlowActionArea.LeftPress

    TapHandler {
        enabled: (root.eventType >= FlowActionArea.LeftPress && root.eventType <= FlowActionArea.LeftLongPress)
        acceptedButtons: Qt.LeftButton
        onTapped: if (root.eventType === FlowActionArea.LeftPress) { root.trigger(); }
        onDoubleTapped: if (root.eventType === FlowActionArea.LeftDoublePress) { root.trigger(); }
        onLongPressed: if (root.eventType === FlowActionArea.LeftLongPress) { root.trigger(); }
    }

    TapHandler {
        enabled: (root.eventType >= FlowActionArea.RightPress && root.eventType <= FlowActionArea.RightLongPress)
        acceptedButtons: Qt.RightButton
        onTapped: if (root.eventType === FlowActionArea.RightPress) { root.trigger(); }
        onDoubleTapped: if (root.eventType === FlowActionArea.RightDoublePress) { root.trigger(); }
        onLongPressed: if (root.eventType === FlowActionArea.RightLongPress) { root.trigger(); }
    }

    PointHandler {
        enabled: (root.eventType >= FlowActionArea.FlickUp && root.eventType <= FlowActionArea.FlickRight)
        target: null

        onActiveChanged: {
            if (active) {
                priv.dragStartTime = Date.now();
                priv.dragStartPoint = point.position;
            } else {
                var time = Date.now() - priv.dragStartTime;
                var distance = root.moveDistance(priv.dragStartPoint, point.position);
                if (time < root.maxDragTime && distance > root.minDragDistance){
                    var angle = root.moveAngle(priv.dragStartPoint, point.position);

                    switch (root.eventType){
                    case FlowActionArea.FlickUp:
                        if (angle > 2.618 || angle < -2.618) {
                            root.trigger();
                        }
                        break;
                    case FlowActionArea.FlickDown:
                        if (angle < 0.524 && angle > -0.524) {
                            root.trigger();
                        }
                        break;
                    case FlowActionArea.FlickLeft:
                        if (angle < -1.047 && angle > -2.094) {
                            root.trigger();
                        }
                        break;
                    case FlowActionArea.FlickRight:
                        if (angle < 2.094 && angle > 1.047) {
                            root.trigger();
                        }
                        break;
                    }
                }
            }
        }
    }

    PinchHandler {
        enabled: (root.eventType === FlowActionArea.PinchIn || root.eventType === FlowActionArea.PinchOut)
        target: null

        onActiveChanged: {
            if (active) {
                priv.dragStartTime = Date.now();
            } else {
                var time = Date.now() - priv.dragStartTime;
                if (time < root.maxDragTime) {
                    if (root.eventType  === FlowActionArea.PinchIn && activeScale < (1.0 / root.minPinchFactor)) {
                        root.trigger();
                    } else if (root.eventType === FlowActionArea.PinchOut && activeScale > root.minPinchFactor) {
                        root.trigger();
                    }
                }
            }
        }
    }

    function moveDistance(start, end){
        var x = end.x - start.x;
        var y = end.y - start.y;
        return Math.sqrt(x*x+y*y);
    }

    function moveAngle(start, end){
        var x = end.x - start.x;
        var y = end.y - start.y;
        return Math.atan2(x,y);
    }

    function trigger() {

        var one = root.activeState
        var two = root.parent.state

        if (one !== two)
            return

        if (root.goBack) {
            var par = root.parent
            while (par) {
                if (par.__isFlowView) {
                    par.goBack()
                    return
                }
                par = par.parent
            }
        } else {
            target.trigger()
        }

        root.triggered()
    }

    property Connections connections : Connections {
        id: connections
    }

    property QtObject target

    readonly property bool isActionArea: true
    property bool fromStateChange: false

    property string activeState: ""

    enabled: (target !== null || root.goBack) && (root.activeState === root.parent.state)

    property bool goBack: false

    property alias eventIds: eventListener.eventIds

    function __receiveEvent(parameters) {
        var flowItem = root.parent
        var flow = flowItem.parent

        if (flow.currentItem !== flowItem)
            return;

        root.trigger()
    }

    EventListener {
        id: eventListener
        onTriggered: root.__receiveEvent(parameters)
    }
}
