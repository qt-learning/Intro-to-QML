import { square } from "square.mjs"
export { square }

export function showCalculations(value) {
    console.log(
        "Call square() from script.mjs:",
        square(value));
}