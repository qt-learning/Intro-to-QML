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
import FlowView 1.0

Item {
    id: flowItem

    width: 400
    height: 400

    property var flowView: Item {}

    property string __designer_url__

    property alias loaderSource: loader.source

    property var stateChangeTarget

    property string defaultState

    clip: true

    function setState(state) {

    }

    onStateChangeTargetChanged: {
        loader.source = stateChangeTarget['__designer_url__']
        loader.item.state = flowItem.targetState
        flowItem.width = flowItem.stateChangeTarget.width
        flowItem.height = flowItem.stateChangeTarget.height
    }


    property string targetState

    onTargetStateChanged: {
        loader.active = false
        loader.active = true
        loader.item.state = flowItem.targetState
    }

    Text {
        text: flowItem.targetState
    }

    property bool active: false


    function init() {
        flowItem.defaultState = flowItem.state
        if (FlowState.loading)
            return

        if (loader.source == "")
            return

        FlowState.loading = true
        flowItem.active = true
    }

    Loader {
        id: loader
        active: flowItem.active
        onLoaded: {
            flowItem.width = loader.item.childrenRect.width
            flowItem.height = loader.item.childrenRect.height
            FlowState.loading = false
        }
    }
}
