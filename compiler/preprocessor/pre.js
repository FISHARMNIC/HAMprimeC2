const fs = require("fs")

module.exports = function (code) {
    for (i = 0; i < code.length; i++) {
        var x = code[i]
        if (x[0] == "#") {
            var out = treat(x.substring(1).split(" "))
            code.splice(i, 1, ...out)
        } else {
            code[i] = treatOther(parser.split(x)).join(" ")

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
        try {
            _in = String(fs.readFileSync(fileDir))
        }
        catch (err) {
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

function treatOther(line) {
    for (var wordNum = 0; wordNum < line.length; wordNum++) {
        var word = line[wordNum]
        var offsetWord = x => wordNum + x >= 0 ? line[wordNum + x] : null;

        //console.log(word)
        if (word == "lambda") {

            var noReturnType = true

            if (offsetWord(4) == "->")
                noReturnType = false

            var num = 0
            while(offsetWord(num) != "{" && offsetWord(num) != undefined)
            {
                num++
            }

            if(offsetWord(num) == undefined)
            {
                throwE("No function statement provided in lambda")
            }

            var nest = 0

            var numStart = ++num

            // capture code in lambda
            while (num < line.length) {
                if (offsetWord(num) == "{") {
                    //console.log("n", nest)
                    nest++
                }
                else if (offsetWord(num) == "}") {
                    //console.log("c", nest)
                    if (nest == 0) {
                        break
                    }
                    else {
                        nest--
                    }
                }
                num++
            }

            if (num >= line.length) {
                throwE("Lambda was not closed")
            }

            numStart += wordNum
            num += wordNum

            //console.log(line.slice(wordNum, num + 1)) // whole thing including dec
            // issue is that things are being evaluated inside the lmabda since they have parenthesis
            var t = line.slice(numStart, num)
            var build = []
            var out = []
            for(var i = 0; i < t.length; i++)
            {
                var letter = t[i]
                if(letter == ";")
                {
                    out.push(build.join(" "))
                    build = []
                }
                else
                {
                    build.push(letter)
                }
            }

            var lbname = helpers.functions.newAnonFunctionLabel()
            lambdaQueue.push({name: lbname, code: out, def:line.slice(wordNum + 1, numStart - 1).join(" ")})

            line[wordNum] = "$" + lbname
            //console.log(line.slice(wordNum, num + 1))
            line.splice(wordNum + 1, line.slice(wordNum, num + 1).length - 1)
        }
    }
    return line
}