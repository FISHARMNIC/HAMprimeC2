function prioritizeWord(word) {
    var lbl = helpers.variables.newUntypedLabel()
    var exit = helpers.variables.newUntypedLabel()

    requestBracket = {
        type: keywordTypes.WHILE,
        data: {
            name: lbl, // jump to beginning
            exit       // exit 
        }
    }
    outputCode.autoPush(`${lbl}:`)
}

module.exports = prioritizeWord