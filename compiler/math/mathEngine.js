/*
todo. Only push non clobbered. use eax, esi, and edi since they are least likely to be clobbered
(eax will never be clobbered)
*/

var tempClobs = []

function _doOp(operator, value, valueType) {
    //outputCode.autoPush("# begin")
    if ("formatPtr" in valueType) {
        throwE("Overloads are only supported when the left hand side is the format. Use parenthesis")
    }
    else {
        var regA = helpers.types.formatRegister('a', valueType)
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
            case ">>":
                outputCode.autoPush(
                    `shr${suffix} ${value}, ${regA}`,
                )
                break;
            case "<<":
                outputCode.autoPush(
                    `shl${suffix} ${value}, ${regA}`,
                )
                break;
            case "&":
                outputCode.autoPush(
                    `and${suffix} ${value}, ${regA}`,
                )
                break;
            case "|":
                outputCode.autoPush(
                    `or${suffix} ${value}, ${regA}`,
                )
                break;
            case "^":
                outputCode.autoPush(
                    `xor${suffix} ${value}, ${regA}`,
                )
                break;
            default:
                throwE(`Unable to perform "${operator}"`)
                break;
        }
    }
    // outputCode.autoPush("# end")
}

function _treatLine(arr) {
    var old;
    var regA;
    do { // while loop is in for chaining operators like: "list + 5 + 4"
        var leftType = helpers.types.guessType(arr[0])
        regA = helpers.types.formatRegister('a', leftType)
        old = JSON.stringify(arr)
        if (regA != "%eax")
            outputCode.autoPush("xor %eax, %eax")
        if ("formatPtr" in leftType) {
            //throwE("TODO operator overloads")
            var first = arr[2]
            var operator = arr[1]
            var ret = actions.formats.callOperator(arr[0], operator, first)
            //console.log("GOT:", ret)

            arr[0] = ret
            arr.splice(1, 2)

            //console.log("IS", arr, "LEN", arr.length)
            if (arr.length == 1) {
                //console.log("Single", arr[0])
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

module.exports = function (arr) {

    //secReg = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
    //tempClobs = [secReg]
    tempClobs = []

    var parsed = formatMath(arr)
    var o = evalMath(parsed, _treatLine)
    _deClob(tempClobs)
    return o
}