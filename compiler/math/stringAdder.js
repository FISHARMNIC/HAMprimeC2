module.exports = function (arr) {
    var scanPos = 0
    var numStrs = 0;
    var reps = scanPos - 2;

    //console.log("ADDING", arr,)
    arr.reverse()
    //outputCode.autoPush(`pusha`)
    actions.assembly.disableGC()

    while (scanPos < arr.length) {
        if (arr[scanPos + 1] != "+" && arr[scanPos + 1] != undefined) {
            throwE("[INTERNAL] Should not use string math on any sequencee that includes a non '+' operator")
        }
        var current = arr[scanPos]
        var ctype = helpers.types.guessType(current)
        if (!(ctype.pointer == true && ctype.size == 8)) { // not a advptr
            if ("formatPtr" in ctype) {                  // instance
                actions.assembly.pushClobbers()
                var out = actions.formats.callMethod(current, "toString", "")
                helpers.registers.deClobberRegister(helpers.registers.registerStringToLetterIfIs(out))
                actions.assembly.popClobbers()

                current = "%eax"
            } else if (ctype.pointer || !ctype.float) { // int or pointer
                actions.assembly.pushToStack(current, ctype)
                if (ctype.size == 8 && !ctype.pointer) {
                    outputCode.autoPush(
                        `call ctos`,
                        `add $4, %esp`
                    )
                }
                else {
                    outputCode.autoPush(
                        `call itos`,
                        `add $4, %esp`
                    )
                }
                current = "%eax"
            } else { // float 
                actions.assembly.pushToStack(current, ctype)
                outputCode.autoPush(
                    `call ftos`,
                    `add $4, %esp`
                )
                current = "%eax"
            }
        }
        //console.log(current)
        actions.assembly.pushToStack(current, defines.types.string)
        //console.log("\t PUSHED", current, numStrs)
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
    allocationOnLine = true
    actions.assembly.restoreGCActive()
    // outputCode.autoPush(`popa`)

    return retLbl
}