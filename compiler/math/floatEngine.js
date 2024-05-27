//https://docs.oracle.com/cd/E19455-01/806-3773/instructionset-142/index.html

module.exports = function (arr) {
    //throwE(typeStack)
    debugPrint("FLOAT MATH ON", arr)
    var scanPos = 0;
    var current = arr[scanPos]
    var mathType = defines.types.u32
    var type = popTypeStack()
    var useFloat = type.float
    var fmtted = actions.formatIfConstantOrLiteral(current)

    if (actions.getVariableOrParamIfExists(fmtted) != null) // if already defined var, load directly into xmm1
    {
        outputCode.autoPush(useFloat ? `movss ${fmtted}, %xmm0` : `cvtsi2ss ${fmtted}, %xmm0`);
    }
    else { // if constant, must load into __fpu_temp__ inorder to be used by xmm1
        outputCode.autoPush(`movl ${fmtted}, __fpu_temp__`, useFloat ? `movss __fpu_temp__, %xmm0` : `cvtsi2ss __fpu_temp__, %xmm0`); // store number in fpu stack
    }

    scanPos += 1
    var reps = scanPos - 2;

    var deletectr = 0
    while (scanPos < arr.length - 1) {

        current = actions.formatIfConstantOrLiteral(arr[scanPos]);

        //throwW(scanPos, current)
        var type = popTypeStack()
        var useFloat = type.float

        var _next = arr[scanPos + 1]

        var item = {
            current,
            next: actions.formatIfConstantOrLiteral(_next),
        }


        if (actions.getVariableOrParamIfExists(_next) != null) // if already defined var, load directly into xmm1
        {
            outputCode.autoPush(useFloat ? `movss ${item.next}, %xmm1` : `cvtsi2ss ${item.next}, %xmm1`); // store number in fpu stack
        }
        else { // if constant, must load into __fpu_temp__ inorder to be used by xmm1
            outputCode.autoPush(`movl ${item.next}, __fpu_temp__`, useFloat ? `movss __fpu_temp__, %xmm1` : `cvtsi2ss __fpu_temp__, %xmm1`); // store number in fpu stack
        }


        outputCode.autoPush(...((inD) => {
            var number = inD.next
            switch (inD.current) {
                case "+":
                    return [`addss %xmm1, %xmm0`] // s(1) += st(0). st(0) = st(1) (pop)
                case "-":
                    return [`subss %xmm1, %xmm0`]
                case "*":
                    return [`mulss %xmm1, %xmm0`]
                case "/":
                    return [`divss %xmm1, %xmm0`]
                default:
                    return ""
            }
        })(item))
        scanPos += 2;
    }
    var lbl = helpers.variables.newTempLabel(defines.type.u32)
    outputCode.autoPush(`movss %xmm0, ${lbl}`)
    typeStack.push(defines.types.u32)
    return lbl
}