module.exports = function (arr) {
    debugPrint("MATH ON", arr)
    var scanPos = 0;
    var current = arr[scanPos]
    var mathType = defines.types.u32

    outputCode.autoPush(
        `pusha`,
        `xor %eax, %eax`,
        `xor %ebx, %ebx`,
        `xor %ecx, %ecx`,
        `mov ${actions.formatIfConstantOrLiteral(current)}, ${asm.formatRegister('a', popTypeStack())}`
    ) // load first value into register a

    scanPos += 1
    var reps = scanPos - 2;
    while (scanPos < arr.length - 1) {

        current = actions.formatIfConstantOrLiteral(arr[scanPos]);

        var regA = asm.formatRegister('a', defines.mathOps.includes(current)? mathType : popTypeStack())
        var regB = asm.formatRegister('b', mathType)
        var regC = asm.formatRegister('c', mathType)
        var regD = asm.formatRegister('d', mathType)


        var item = {
            current,
            next: actions.formatIfConstantOrLiteral(arr[scanPos + 1]),
        }

        var g = actions.getVariableOrParamIfExists(arr[scanPos + 1])
        if (g != null) {
            regB = asm.formatRegister('b', g)
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
                case ">": //TODO
                    return [
                        `cmp ${inD.next}, ${regB}`,
                    ]
                default:
                    return ""
            }
        })(item))
        scanPos += 1;
    }
    var lbl = actions.requestTempLabel(defines.types.u32);
    outputCode.autoPush(`mov %eax, ${lbl}`, `popa`)
    typeStack.push(defines.types.u32)
    return lbl
}