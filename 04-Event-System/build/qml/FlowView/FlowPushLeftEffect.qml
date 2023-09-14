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
import QtQuick.Timeline 1.0

FlowEffect {
    id: effect

    property real scale: 1
    property real opacity: 1

    duration: 250
    onStarted: {
        group01.target = transitionView.__fromContentItem
        group02.target = transitionView.__toContentItem
        group03.target = transitionView.__fromContentItem
        group04.target = transitionView.__toContentItem
        group05.target = transitionView.__fromContentItem
        group06.target = transitionView.__toContentItem
    }

    timeline: Timeline {
        startFrame: 0
        endFrame: 1000

        KeyframeGroup {
            id: group01

            property: "x"

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1000
                value: effect.transitionView.width
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group02

            property: "x"

            Keyframe {
                frame: 0
                value: -effect.transitionView.width
            }

            Keyframe {
                frame: 1000
                value: 0
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group03

            property: "scale"

            Keyframe {
                frame: 0
                value: 1
            }

            Keyframe {
                frame: 1000
                value: effect.scale
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group04

            property: "scale"

            Keyframe {
                frame: 0
                value: effect.scale
            }

            Keyframe {
                frame: 1000
                value: 1
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group05

            property: "opacity"

            Keyframe {
                frame: 0
                value: 1
            }

            Keyframe {
                frame: 1000
                value: effect.opacity
                easing: effect.easing
            }
        }

        KeyframeGroup {
            id: group06

            property: "opacity"

            Keyframe {
                frame: 0
                value: effect.opacity
            }

            Keyframe {
                frame: 1000
                value: 1
                easing: effect.easing
            }
        }
    }
}
