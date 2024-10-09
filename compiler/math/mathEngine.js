/*
This ENTIRE thing needs to be written to support:
    - shift, etc
    - math precidence
    - operators
*/

/*
todo. Only push non clobbered. use eax, esi, and edi since they are least likely to be clobbered
(eax will never be clobbered)
*/

var tempClobs = []

function _saveRegs() {
    var pushed = []
    Object.entries(helpers.registers.inLineClobbers).forEach(pair => {
        if (pair[1] == 1) {
            var type = helpers.types.formatRegister(pair[0], defines.types.u32)
            pushed.push(type)
            outputCode.autoPush(`push ${type}`)
        }
    })
    return pushed
}

function _restoreRegs(pushed) {
    if (pushed == undefined) {
        throwE("[INTERNAL] Didn't push")
    }

    pushed.reverse().forEach(x => {
        outputCode.autoPush(`pop ${x}`)
    })
}

/* todo, jsut do inside out, each one stores its result in a clobber */
function _doOp(operator, value, valueType) {
    //outputCode.autoPush("# begin")
    if ("formatPtr" in valueType) {
        throwE("Overloads are only supported when the left hand side is the format. Use parenthesis")
    }
    else {
        regA = helpers.types.formatRegister('a', valueType)
        var regB = helpers.types.formatRegister('b', valueType)
        var regD = helpers.types.formatRegister('d', valueType)

        var suffix = ""
        if (helpers.variables.variableExists(value)) {
            suffix = helpers.types.sizeToSuffix(helpers.variables.getVariableType(value))
        } else {
            value = helpers.types.formatIfConstant(value)
        }

        switch (operator) {
            case "+":
                outputCode.autoPush(`add${suffix} ${value}, ${regA}`)
                break;
            case "-":
                outputCode.autoPush(`sub${suffix} ${value}, ${regA}`)
                break;
            case "*":
                outputCode.autoPush(
                    `mov${suffix} ${value}, ${regB}`,
                    `mul ${regB}`,
                )
                break;
            case "/":
                outputCode.autoPush(
                    `mov${suffix} ${value}, ${regB}`,
                    `xor %edx, %edx`,
                    `div ${regB}`,
                )
                break;
            case "%":
                outputCode.autoPush(
                    `mov${suffix} ${value}, ${regB}`,
                    `xor %edx, %edx`,
                    `div ${regB}`,
                    `mov ${regD}, ${regA}`,
                )
                break;
        }
    }
    // outputCode.autoPush("# end")
}

function _treatLine(arr) {
    var old;
    do {
        var leftType = helpers.types.guessType(arr[0])
        var regA = helpers.types.formatRegister('a', leftType)
        old = JSON.stringify(arr)
        if (regA != "%eax")
            outputCode.autoPush("xor %eax, %eax")
        if ("formatPtr" in leftType) {
            //throwE("TODO operator overloads")
            var first = arr[2]
            var operator = arr[1]
            var ret = actions.formats.callOperator(arr[0], operator, first)
            console.log("GOT:", ret)

            arr[0] = ret
            arr.splice(1, 2)

            console.log("IS", arr, "LEN", arr.length)
            if (arr.length == 1) {
                console.log("Single", arr[0])
                return arr[0]
            }

        }
    } while (JSON.stringify(arr) != old)

    outputCode.autoPush(`mov ${helpers.types.formatIfConstant(arr[0])}, ${regA}`)

    for (var i = 1; i < arr.length; i += 2) {
        var right = arr[i + 1]
        var operator = arr[i]


        var rightType = helpers.types.guessType(right)
        _doOp(operator, right, rightType)
    }

    //console.log(helpers.registers.inLineClobbers)
    var out = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
    tempClobs.push(out)
    outputCode.autoPush(`mov %eax, ${out}`)
    return out


}

function _deClob() {
    tempClobs.pop() // last one is the one to keep
    tempClobs.forEach(x => {
        if (helpers.types.stringIsRegister(x)) {
            var rLetter = helpers.registers.registerStringToLetterIfIs(x)
            //console.log("freeing", rLetter)
            helpers.registers.deClobberRegister(rLetter)
        }
    })
}

function evalMath3(arr) {
    var old;

    do { // just keep nesting
        old = JSON.stringify(arr)
        if (arr.find(x => typeof (x) == "object") == undefined) { // only when the line has nothing left to nest is it evaluated
            if (arr.length == 1) {
                console.log("SKIPPING single ", arr, " -> ", arr[0])
                return arr[0]
            }
            else {
                var out = _treatLine(arr)
                console.log("evaluated", arr, "->", out)
                return out
            }
        }
        else {
            for (var i = 0; i < arr.length; i++) {
                if (typeof (arr[i]) == "object") {
                    arr[i] = evalMath3(arr[i])
                }
            }
        }
    } while (old != JSON.stringify(arr))

}

/*
function evalMath2(arr) {
    var first = arr[0]

    if (typeof (first) == "object") {

        arr[0] = evalMath2(first)
        first = arr[0]
    }
    console.log(`${first} -> accum`)

    var right = arr[2]
    var operator = arr[1]

    var out = helpers.registers.getFreeLabelOrRegister(defines.types.u32)

    for (var i = 1; i < arr.length; i += 2) {
        var right = arr[i + 1]
        var operator = arr[i]

        if (typeof (right) == "object") {
            right = evalMath2(right)
            arr[i + 1] = right
        }

        console.log(`accum ${operator} ${right} -> accum`)

    }
    console.log(`accum -> ${out}`)
    return out
}
*/

// this function is wrong. Just do proper nesting maybe using splitter
function formatMath(oldArr) {
    // todo, add shift, bitwise OR and AND, and rotate
    var trumpOps = ["*", "/", "%"]
    var lowerOps = ["+", "-"]
    var allOps = [...trumpOps, ...lowerOps]

    var onOperator = false;

    var arr = objCopy(oldArr)

    var last = arr[arr.length - 1]
    if (allOps.includes(last)) {
        throwE(`Math statement ends on operator "${last}"`)
    }

    var i = 0
    for (; i < arr.length; i++) {
        var e = arr[i]
        if (onOperator) {
            var previous = arr[i - 1]
            var next = arr[i + 1]
            if (!(allOps.includes(e))) {
                throwE(`Expected an operator, but got "${e}"`)
            }

            if (trumpOps.includes(e)) {
                var subArr = [previous, e, next]
                arr.splice(i - 1, 3, subArr)
            }
        }
        else {
            if (allOps.includes(e)) {
                throwE(`Did not expect an operator, but got "${e}"`)
            }
        }
        onOperator = !onOperator;
    }

    // throwE(arr)

    //console.log("TREATING", arr)
    return arr
    //var o = evalMath(arr, true)
    //console.log("ret", o)
    //return o

}


module.exports = function (arr) {

    //secReg = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
    //tempClobs = [secReg]
    tempClobs = []

    var looper = formatMath(arr)
    while (JSON.stringify(looper) != JSON.stringify(formatMath(looper))) {
        looper = formatMath(looper)
    }
    //console.log(looper)
    var o = evalMath3(looper)
    _deClob()
    return o


    // old stuff below

    /*

    //process.exit(0)
    //return formatMath(arr)
    //debugPrint("MATH ON", arr, helpers.registers.inLineClobbers)
    outputCode.autoPush(`# Math begin: [${arr.join(" ")}]`)
    var scanPos = 0;
    var current = arr[scanPos]
    var mathType = defines.types.u32
    var pushed = [];
    Object.entries(helpers.registers.inLineClobbers).forEach(pair => {
        if (pair[1] == 1) {
            var type = helpers.types.formatRegister(pair[0], defines.types.u32)
            pushed.push(type)
            outputCode.autoPush(`push ${type}`)
        }
    })

    debugPrint("CCCCCCCC", arr)
    outputCode.autoPush(`xor %eax, %eax`, `mov ${helpers.types.formatIfConstant(current)}, ${helpers.types.formatRegister('a', helpers.types.guessType(current))}`) // load first value into register a

    scanPos += 1
    var reps = scanPos - 2;
    while (scanPos < arr.length - 1) {

        current = helpers.types.formatIfConstant(arr[scanPos]);

        var regA = helpers.types.formatRegister('a', defines.operators.includes(current) ? mathType : helpers.types.guessType(arr[scanPos]))
        var regB = helpers.types.formatRegister('b', mathType)
        var regC = helpers.types.formatRegister('c', mathType)
        var regD = helpers.types.formatRegister('d', mathType)

        var item = {
            current,
            next: helpers.types.formatIfConstant(arr[scanPos + 1]),
        }

        if (helpers.variables.variableExists(arr[scanPos + 1])) {
            regB = helpers.types.formatRegister('b', helpers.variables.getVariableType(arr[scanPos + 1]))
        }

        outputCode.autoPush(...((inD) => {
            switch (inD.current) {
                case "+":
                    //console.log(inD)
                    return [`add ${inD.next}, ${regA}`]
                case "-":
                    return [`sub ${inD.next}, ${regA}`]
                case "*":
                    return [
                        `mov ${inD.next}, ${regB}`,
                        `mul ${regB}`,
                    ]
                case "/":
                    return [
                        `mov ${inD.next}, ${regB}`,
                        `xor %edx, %edx`,
                        `div ${regB}`,
                    ]
                case "%":
                    return [
                        `mov ${inD.next}, ${regB}`,
                        `xor %edx, %edx`,
                        `div ${regB}`,
                        `mov ${regD}, ${regA}`,
                    ]
                default:
                    return ""
            }
        })(item))
        scanPos += 1;
    }
    var lbl = helpers.registers.getFreeLabelOrRegister(mathType)
    //debugPrint("MATH GOT LBL", lbl)
    outputCode.autoPush(`mov %eax, ${lbl}`)
    pushed.reverse().forEach(x => {
        outputCode.autoPush(`pop ${x}`)
    })

    outputCode.autoPush(`# Math end. result in ${lbl}`)
    //typeStack.push(defines.types.u32)
    return lbl

    */
}