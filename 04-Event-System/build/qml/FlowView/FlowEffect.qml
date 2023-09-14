/****************************************************************************
**
** Copyright (C) 2018 The Qt Company Ltd.
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
import QtQuick.Timeline 1.0

QtObject {
    id: root
    signal finished
    signal started
    signal reseted
    function reset() {
        /*
        if (root.duration === 0) {
            root.transitionView.__setupCurrentItem()
            return
        }*/

        /* We set the parents to the content items to apply effects */

        resetProperties()

        from.parent = transitionView.__fromContentItem
        to.parent = transitionView.__toContentItem
        root.progress = root.backwards ? 100 : 0

        enable()
        root.progress = -1
        root.progress = 0
    }

    property bool __aborted: false

    function enable() {
        timeline.enabled = true
        root.started()
    }

    function start() {
        anim.from = Math.min(root.progress, 100)
        anim.to = root.backwards ? 0 : 100
        anim.duration = root.duration * Math.abs(anim.to - anim.from) / 100

        root.__aborted = false

        anim.start()
    }

    function abort() {

        anim.from = root.progress
        anim.to = root.backwards ? 100 : 0

        anim.duration = root.duration * Math.abs(anim.from - anim.to) / 100

        root.__aborted = true
        anim.restart()

    }

    function stop() {
        anim.stop()
    }

    property Item from
    property Item to

    property Item transitionView

    property real duration: 250
    property alias easing: anim.easing

    property Timeline timeline: Timeline {

    }

    property real progress: 0

    property bool backwards: false

    property Binding timelineBinding: Binding {
        target: timeline
        property: "currentFrame"
        value: root.progress * 10
    }

    function resetProperties() {
        transitionView.__fromContentItem.opacity = 1
        transitionView.__fromContentItem.x = 0
        transitionView.__fromContentItem.y = 0
        transitionView.__fromContentItem.z = 0
        transitionView.__fromContentItem.scale = 1

        transitionView.__toContentItem.opacity = 1
        transitionView.__toContentItem.x = 0
        transitionView.__toContentItem.y = 0
        transitionView.__toContentItem.z = 0
        transitionView.__toContentItem.scale = 1
    }

    property PropertyAnimation __anim: PropertyAnimation {
        id: anim
        duration: 250
        loops: 1
        target: root
        property: "progress"
        onStopped: {
            timeline.enabled = false
            /* reset all typical properties */

            resetProperties()

            root.finished()

            if (!root.__aborted) {
                root.transitionView.__setupCurrentItem()
            } else {
                if (root.transitionView.nextItem) {
                    root.transitionView.nextItem.parent = transitionView.__stack
                    root.transitionView.nextItem = root.transitionView.currentItem
                }
                root.transitionView.__setupCurrentItem()
                root.transitionView.nextItem = null
            }

            root.progress = 0
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
