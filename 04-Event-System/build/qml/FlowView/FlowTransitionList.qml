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

QtObject {
    id: list
    property Item intialItem
    //has next prev and most likely currentIndex, count
    property var items

    property Item nextItem
    property Item prevItem

    property Item currentItem

    onCurrentItemChanged:  {

        var currentIndex = list.__indexForCurrentItem()

        if (currentIndex < (list.items.length - 1))
            list.nextItem = list.items[currentIndex + 1]
        if (currentIndex > 0)
            list.prevItem = list.items[currentIndex - 1]

    }

    function __indexForCurrentItem() {
        var currentIndex = -1
        for (var i = 0; i < list.items.length; ++i) {
            var item = list.items[i]
            if (item === list.currentItem)
                currentIndex = i
        }
        return currentIndex
    }

    property int length: items.length

    function next() {
        var currentIndex = list.__indexForCurrentItem()

        list.nextItem = null

        if (currentIndex > -1 && (currentIndex < list.items.length - 1)) {
            list.prevItem = list.items[currentIndex]
            list.currentItem = list.items[currentIndex + 1]
            if (currentIndex + 2 < list.items.length)
                list.nextItem = list.items[currentIndex + 2]
        }
    }

    function prev() {
        var currentIndex = list.__indexForCurrentItem()

        list.prevItem = null

        if (currentIndex > 0 && currentIndex < (list.items.length)) {
            if (currentIndex - 2 >= 0)
                list.prevItem = list.items[currentIndex - 2]
            list.currentItem = list.items[currentIndex - 1]

            list.nextItem = list.items[currentIndex]
        }
    }

    Component.onCompleted: {
        list.currentItem = list.intialItem
        var currentIndex = list.__indexForCurrentItem()
        if (currentIndex < (list.items.length - 1))
            list.nextItem = list.items[currentIndex + 1]
        if (currentIndex > 0)
            list.prevItem = list.items[currentIndex - 1]
    }
}
