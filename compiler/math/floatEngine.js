/*
todo. Only push non clobbered. use eax, esi, and edi since they are least likely to be clobbered
(eax will never be clobbered)
*/

function useAppropriateLoad(value, dest, type) {
    if (type.float) {
        outputCode.autoPush(`movss ${value}, ${dest}`)
    } else {
        outputCode.autoPush(`cvtsi2ss ${value}, ${dest}`);
    }

}
module.exports = function (arr) {

    //debugPrint("MATH ON", arr, helpers.registers.inLineClobbers)
    var scanPos = 0;
    var current = arr[scanPos]
    var currentType = helpers.types.guessType(current)

    // var pushed = [];
    // Object.entries(helpers.registers.inLineClobbers).forEach(pair => {
    //     if (pair[1] == 1) {
    //         var type = helpers.types.formatRegister(pair[0], defines.types.u32)
    //         pushed.push(type)
    //         outputCode.autoPush(`push ${type}`)
    //     }
    // })

    if (helpers.types.isConstant(current) || helpers.types.stringIsRegister(current)) // must be in addr first. movss and cvtsi2ss can only take source from memory or xmm
    {
        outputCode.autoPush(`movl ${(helpers.types.isConstant(current) ? "$" : "") + current}, __xmm_sse_temp__`)
        current = "__xmm_sse_temp__"
    }

    useAppropriateLoad(current, "%xmm0", currentType)

    scanPos += 1
   // var reps = scanPos - 2;

    while (scanPos < arr.length - 1) {

        current = arr[scanPos]
        var next = arr[scanPos + 1]
        var nextType = helpers.types.guessType(next)
        //console.log("hi", next)

        if (helpers.types.isConstant(next) || helpers.types.stringIsRegister(next)) // must be in addr first. movss and cvtsi2ss can only take source from memory or xmm
        {
            outputCode.autoPush(`movl ${(helpers.types.isConstant(next) ? "$" : "") + next}, __xmm_sse_temp__`)
            next = "__xmm_sse_temp__"
        }

        useAppropriateLoad(next, "%xmm1", nextType)

        outputCode.autoPush(...(() => {
            switch (current) {
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
        })())
        scanPos += 2;
    }
    var lbl = helpers.variables.newTempLabel(defines.types.f32)
    outputCode.autoPush(`movss %xmm0, ${lbl}`)
    // pushed.forEach(x => {
    //     outputCode.autoPush(`pop ${x}`)
    // })

    //typeStack.push(defines.types.u32)

    //throwE("dine")
    return lbl
}