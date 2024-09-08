module.exports = function (arr) {
    var scanPos = 0
    var numStrs = 0;
    var reps = scanPos - 2;

    arr.reverse()
    //outputCode.autoPush(`pusha`)
    while (scanPos < arr.length) {
        var current = arr[scanPos]
        var ctype = helpers.types.guessType(current)
        if (!(ctype.pointer == true && ctype.size == 8)) { // not a advptr
                actions.assembly.pushToStack(current)
                if (ctype.pointer || !ctype.float) { // int or pointer
                    outputCode.autoPush(
                        `call itos`,
                        `add $4, %esp`
                    )
                } else { // float 
                    outputCode.autoPush(
                        `call ftos`,
                        `add $4, %esp`
                    )
                }
            current = "%eax"
        }
        actions.assembly.pushToStack(current, defines.types.string)
        numStrs++
        scanPos += 2
    }
    var retLbl = helpers.registers.getFreeLabelOrRegister(helpers.types.convertTypeToHasData(defines.types.string))
    outputCode.autoPush(
        `pushl \$${numStrs}`,
        `call strjoinmany`,
        `add \$${numStrs * 4 + 4}, %esp`,
        `mov %eax, ${retLbl}`
    )

    // outputCode.autoPush(`popa`)

    return retLbl
}