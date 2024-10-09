/*
todo. Only push non clobbered. use eax, esi, and edi since they are least likely to be clobbered
(eax will never be clobbered)
*/

module.exports = function (arr) {
    //debugPrint("MATH ON", arr, helpers.registers.inLineClobbers)
    outputCode.autoPush(`# Math begin: [${arr.join(" ")}]`)
    var scanPos = 0;
    var current = arr[scanPos]
    var mathType = defines.types.u32
    var pushed = [];
    Object.entries(helpers.registers.inLineClobbers).forEach(pair => {
        if(pair[1] == 1)
        {
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

        var regA = helpers.types.formatRegister('a', defines.operators.includes(current)? mathType : helpers.types.guessType(arr[scanPos]))
        var regB = helpers.types.formatRegister('b', mathType)
        var regC = helpers.types.formatRegister('c', mathType)
        var regD = helpers.types.formatRegister('d', mathType)

        var item = {
            current,
            next: helpers.types.formatIfConstant(arr[scanPos + 1]),
        }

        if(helpers.variables.variableExists(arr[scanPos + 1]))
        {
            regB = helpers.types.formatRegister('b', helpers.variables.getVariableType(arr[scanPos + 1]))
        }

        outputCode.autoPush(...((inD) => {
            switch (inD.current) {
                case "+":
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
}