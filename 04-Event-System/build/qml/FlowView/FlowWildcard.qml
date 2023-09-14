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
import QtQuick.Studio.EventSystem 1.0

QtObject {
    id: root

    property list<FlowItem> positivelist
    property list<FlowItem> negativelist

    default property list<QtObject> data

    property FlowTransition target

    property var transitionView: Item {}

    property bool globalWildcard: false

    function trigger() {
        var cItem = root.transitionView.currentItem

        if (root.globalWildcard && root.transitionView.parentFlowView()) {
            root.transitionView.__parentFlowChanged = true
            root.transitionView.parentFlowView().gotoItem(root.transitionView.parentFlowItem())
        }

        if (cItem === undefined)
            return

        if (root.transitionView.checkInclude(root.negativelist, cItem))
            return;

        if (root.positivelist.length !== 0) {
            if (!root.transitionView.checkInclude(root.positivelist, cItem))
                return;
        }

        root.target.trigger()
    }

    property EventListener eventListener: EventListener {
        id: eventListener
        onTriggered: root.trigger()
    }

    property alias eventIds: eventListener.eventIds
}


