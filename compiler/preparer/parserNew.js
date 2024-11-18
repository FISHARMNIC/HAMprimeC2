var noExes = [
    "<-",
    "->",
    "/*",
    "//",
    "*/",
    "#f",
    "..."
];
noExes.push(...Object.keys(defines.types), ...defines.conditionals, "<<", ">>") // load all types into exceptions

// converts code multi-liners to one-liners
function preSplit(code) {

}