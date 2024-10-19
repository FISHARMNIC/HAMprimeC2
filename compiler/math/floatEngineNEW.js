/*
todo. Only push non clobbered. use eax, esi, and edi since they are least likely to be clobbered
(eax will never be clobbered)
*/

// more instructions: https://www.songho.ca/misc/sse/sse.html

var tempClobs = []

function useAppropriateLoad(value, dest, type) {
    if (type.float) {
        outputCode.autoPush(`movss ${value}, ${dest}`)
    } else {
        outputCode.autoPush(`cvtsi2ss ${value}, ${dest}`);
    }

}

function _doOp(operator, value, valueType) {
    //outputCode.autoPush("# begin")
    if ("formatPtr" in valueType) {
        throwE("Overloads are only supported when the left hand side is the format. Use parenthesis")
    }
    else {

        if (helpers.types.isConstant(value) || helpers.types.stringIsRegister(value)) // must be in addr first. movss and cvtsi2ss can only take source from memory or xmm
        {
            outputCode.autoPush(`movl ${(helpers.types.formatIfConstant(value))}, __xmm_sse_temp__`)
            value = "__xmm_sse_temp__"
        }

        useAppropriateLoad(value, "%xmm1", valueType)

        switch (operator) {
            case "+":
                outputCode.autoPush(`addss %xmm1, %xmm0`)
                break;
            case "-":
                outputCode.autoPush(`subss %xmm1, %xmm0`)
                break;
            case "*":
                outputCode.autoPush(`mulss %xmm1, %xmm0`)
                break;
            case "/":
                outputCode.autoPush(`divss %xmm1, %xmm0`)
                break;
            case "%":
                throwE("Modulo not working yet for float math")
                break;
        }
    }
    // outputCode.autoPush("# end")
}

function _treatLine(arr) {
    var old;
    var regA;
    do {
        var left = arr[0]
        var leftType = helpers.types.guessType(left)
        old = JSON.stringify(arr)

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

    var left = arr[0]
    if (helpers.types.isConstant(left) || helpers.types.stringIsRegister(left)) // must be in addr first. movss and cvtsi2ss can only take source from memory or xmm
    {
        outputCode.autoPush(`movl ${helpers.types.formatIfConstant(left)}, __xmm_sse_temp__`)
        left = "__xmm_sse_temp__"
    }

    useAppropriateLoad(left, "%xmm0", leftType)

    for (var i = 1; i < arr.length; i += 2) {
        var right = arr[i + 1]
        var operator = arr[i]


        var rightType = helpers.types.guessType(right)
        _doOp(operator, right, rightType)
    }

    //console.log(helpers.registers.inLineClobbers)

    var lbl = helpers.variables.newTempLabel(defines.types.f32)
    tempClobs.push(lbl)
    outputCode.autoPush(`movss %xmm0, ${lbl}`)
    return lbl
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