const fs = require("fs")

module.exports = function (code) {
    for (i = 0; i < code.length; i++) {
        var x = code[i]
        if (x[0] == "#") {
            var out = treat(x.substring(1).split(" "))
            code.splice(i, 1, ...out)
        }
    }
    //console.log(code)
}

function treat(instruction) {
    if (instruction[0] == "include") {
        if (instruction[1] == "sys") {
            var _in = String(fs.readFileSync(__dirname + "/../libs/include/" + instruction[2] + ".xh"))
            return quickSplit(_in)
        } else {
            console.log("Local inludes not done yet. Use include sys")
            process.exit(0)
        }
    }
}