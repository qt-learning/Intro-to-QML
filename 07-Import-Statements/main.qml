import QtQuick
import "module2.mjs" as M

TapHandler {
    onTapped: (eventpoint, button) => {
        M.square();
M.otherWork()
    }
}