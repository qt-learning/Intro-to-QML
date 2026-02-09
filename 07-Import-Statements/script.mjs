// Copyright (C) 2026 Qt Group.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import { square } from "square.mjs"
export { square }

export function showCalculations(value) {
    console.log(
        "Call square() from script.mjs:",
        square(value));
}