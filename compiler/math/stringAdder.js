module.exports = function(arr)
{
    var scanPos = 0
    var numStrs = 0;
    var reps = scanPos - 2;

    arr.reverse()
    //outputCode.autoPush(`pusha`)
    while (scanPos < arr.length) {
        actions.assembly.pushToStack(arr[scanPos], defines.types.string)
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