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

        ///throwE("forEach not done yet")
        /*
        Todo:
        - create index variable (special label generator

        */

        var lbl = helpers.variables.newUntypedLabel()
        var exit = helpers.variables.newUntypedLabel()
        var indexer = helpers.variables.newUntypedLabel()

        actions.variables.create(indexer, defines.types.u32, "0")
        var indexerStackAddr = actions.assembly.getStackVarAsEbp(indexer)

        requestBracket = {
            type: keywordTypes.FOREACH,
            data: {
                name: lbl, // jump to beginning
                indexer: indexerStackAddr,
                arrLength: actions.assembly.getStackVarAsEbp(actions.variables.create(helpers.variables.newUntypedLabel(), defines.types.u32, "0")),
                exit       // exit 
            }
        }

    }
}

module.exports = prioritizeWord