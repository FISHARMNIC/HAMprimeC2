const fs = require("fs")

module.exports = function (code) {
    for (i = 0; i < code.length; i++) {
        var x = code[i]
        if (x[0] == "#") {
            var out = treat(x.substring(1).split(" "))
            code.splice(i, 1, ...out)
        } else {
            //console.log(parser.split(x))
            //process.exit(0)
        }
    }
    //console.log(code)
}

function treat(instruction) {
    if (instruction[0] == "include") {
        var fileDir = instruction[1]
        if (instruction[1] == "sys") {
            fileDir = __dirname + "/../libs/include/" + instruction[2] + ".xh"
        }
        var _in;
        try 
        {
            _in = String(fs.readFileSync(fileDir))
        }
        catch (err) 
        {
            console.log(instruction)
            throwE(`Cannot read file "${fileDir}"`)
        }
        var newCode = quickSplit(_in)//.filter(x=> x.trim().length != 0)
        var likeText = _in.split("\n")

        var sum = 0
        likeText.forEach(x => { if (x.trim().length == 0) sum++ })
        //console.log("sum", -sum+11)
        includeFileOff += likeText.length + (-sum + 11)//+ sum//.filter(x=> x.trim().length != 0).length
        return newCode
    }
}