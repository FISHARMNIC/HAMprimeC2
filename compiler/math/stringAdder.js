module.exports = function (arr) {
    var scanPos = 0
    var numStrs = 0;
    var reps = scanPos - 2;

    //console.log("ADDING", arr,)
    arr.reverse()
    //outputCode.autoPush(`pusha`)
    outputCode.autoPush("pushw __disable_gc__; movw $1, __disable_gc__")
    while (scanPos < arr.length) {
        var current = arr[scanPos]
        var ctype = helpers.types.guessType(current)
        if (!(ctype.pointer == true && ctype.size == 8)) { // not a advptr
                if("formatPtr" in ctype) {                  // instance
                    actions.assembly.pushClobbers()
                    var out = actions.formats.callMethod(current, "toString", "")
                    helpers.registers.deClobberRegister(helpers.registers.registerStringToLetterIfIs(out))
                    actions.assembly.popClobbers()

                    current = "%eax"
                } else if (ctype.pointer || !ctype.float) { // int or pointer
                    if(ctype.size == 8 && !ctype.pointer)
                    {
                        throwE("Adding chars not done yet")
                    }
                    actions.assembly.pushToStack(current)
                    outputCode.autoPush(
                        `call itos`,
                        `add $4, %esp`
                    )
                    current = "%eax"
                } else { // float 
                    actions.assembly.pushToStack(current)
                    outputCode.autoPush(
                        `call ftos`,
                        `add $4, %esp`
                    )
                    current = "%eax"
                }
        }
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
    outputCode.autoPush("popw __disable_gc__")
    // outputCode.autoPush(`popa`)

    return retLbl
}