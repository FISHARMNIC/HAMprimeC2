function prioritizeWord(word, line) {
    if (word == "while") {
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
    else if (word == "forEach") {

        throwE("forEach not done yet")
        /*
        Todo:
        - create index variable (special label generator

        */

        var lbl = helpers.variables.newUntypedLabel()
        var exit = helpers.variables.newUntypedLabel()

        requestBracket = {
            type: keywordTypes.FOREACH,
            data: {
                name: lbl, // jump to beginning
                exit       // exit 
            }
        }
        outputCode.autoPush(`${lbl}:`)
    }
}

module.exports = prioritizeWord