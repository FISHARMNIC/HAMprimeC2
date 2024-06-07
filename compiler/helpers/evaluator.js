function evaluate(line) {
    debugPrint(line)
    line = line.map((x) => { // bad code yes

        if (objectIncludes(defines.types, x) && !objectIncludes(userFormats, x)) {
            typeStack.splice(0, 0, objCopy(defines.types[x]))
            return null
        } else if (helpers.variables.variableExists(x)) {
            typeStack.splice(0, 0, helpers.variables.getVariableType(x))
        }
        return x;
    }).filter(x => x)
    //throwE(line, typeStack)

    for (var wordNum = 0; wordNum < line.length; wordNum++) {

        var word = line[wordNum]
        var offsetWord = x => wordNum + x >= 0 ? line[wordNum + x] : null;

        // #region modifications
        if(word == '(' || word == ')')
        {
            line.splice(wordNum, 1)
            wordNum--;
        }
        // #endregion
        // #region Formats
        else if (word == '.') { // child property UNFINISHED
            if (objectValuesIncludes(nest.nesters, offsetWord(-1))) // if like >. or ].
            {
                parent = offsetWord(-1)
            } else {

            }
        } else if (objectIncludes(userFormats, word)) // if word is a class
        {
            //console.log("=======", scope)
            if (offsetWord(1) == '<') // if using an init
            {
                var dataLbl = actions.formats.parseParams(word, offsetWord(2))
                line[wordNum] = dataLbl
                line.splice(wordNum + 1, 3)
            }
            //console.log("=======", scope)
        }
        // #endregion
        // #region Variables
        else if (word == "create") {        // variable creation
            /*
               0    1   2  3
            create bob <- jon
            create bob u32    (u32 will not show up)
            */
            if (getLastScopeType == keywordTypes.FORMAT) {
                throwE("'Create' should not be used inside of a format")
            }

            if (offsetWord(2) == '<-') {
                return actions.variables.create(offsetWord(1), popTypeStack(true), offsetWord(3))
            } else {
                return actions.variables.create(offsetWord(1), popTypeStack(true), 0)
            }
        } else if (offsetWord(1) == "<-") { // variable setting
            if (getLastScopeType() == keywordTypes.FORMAT) { // just creating a property
                scope[scope.length - 1].data.properties.push({
                    name: word,
                    type: popTypeStack()
                })
            } else {
                typeStack.push(defines.types.u32)
                return actions.variables.set(word, offsetWord(2))
            }
        } else if (word[0] == '"' && word[word.length - 1] == '"') {
            line[wordNum] = actions.allocations.newStringLiteral(word.substring(1, word.length - 1))
        } else if(objectIncludes(getAllStackVariables(), word)) // get stack var
        {
            line[wordNum] = actions.assembly.getStackVarAsEbp(word)
            typeStack.push(getAllStackVariables()[word].type)
        } else if(scope.length > 0 && (helpers.general.getMostRecentFunction() != undefined) && helpers.general.getMostRecentFunction().data.parameters.findIndex(x => x.name == word) != -1)
        {
            //debugPrint("READING PARAM", word, helpers.functions.getParameterWithOffset(helpers.functions.getParameterOffset(word) + 8))
            line[wordNum] = (helpers.functions.getParameterOffset(word) + 8) + "(%ebp)"
        }
        // #endregion
        // #region Brackets
        else if (word == "{") {
            if (requestBracket != 0) {
                newScope(requestBracket)
                debugPrint("ENTERTING", requestBracket)
                requestBracket = 0
            } else {
                // array
            }
        } else if (word == "}") {
            var oldScope = scope.pop()
            debugPrint("EXITING", oldScope)
            var oldStack = stackVariables.pop()
            if (oldScope.type == keywordTypes.FORMAT) {
                userFormats[oldScope.data.name] = {
                    properties: oldScope.data.properties,
                    statics: oldScope.data.statics,
                    methods: {},
                    inits: {},
                    size: helpers.formats.getFormatSize(oldScope.data.properties)
                }
                var nobj = objCopy(defines.types.___format_template___)
                nobj.formatPtr = userFormats[oldScope.data.name]
                defines.types[oldScope.data.name] = nobj
                //actions.allocations.deallocStack()
            } else if(oldScope.type == keywordTypes.FUNCTION)
            {
                actions.functions.closeFunction(oldScope, oldStack)
            } else if(oldScope.type == keywordTypes.WHILE)
            {
                outputCode.autoPush(
                    `jmp ${oldScope.data.name}`,
                    `${oldScope.data.exit}:` // exit loop
                )
            } else if (oldScope.type == keywordTypes.IF) {
                outputCode.text.push(
                    `jmp ${oldScope.data.name}`, // final termination
                    `${oldScope.data.localExit}:`
                )
                var preview = previewNextLine()
                if (!(line.includes("else") || line.includes("elif")) && !(preview.includes("else") || preview.includes("elif"))) // fully escape block since we are done with all elif/else
                {
                    outputCode.autoPush(
                        `${oldScope.data.name}:`
                    )
                    mostRecentIfStatement.pop()
                }
            }
            console.log("IJWJWWO", scope)
        }
        // #endregion
        // #region Keywords
        else if (defines.keywords.includes(word)) // keyword   
        {
            var kname = offsetWord(-1)
            if (word == "format") {
                requestBracket = {
                    type: keywordTypes.FORMAT,
                    data: {
                        name: kname,
                        properties: [],
                        statics: [],
                        size: 0
                    }
                }
            } else if (word == "persistent") {
                nextAllocIsPersistent = true;
            } else if (word == "function")
            {
                var fname = offsetWord(-1)
                var params = offsetWord(2)
                if(typeof(params) == "string")
                    params = [params]
                var params_obj = actions.functions.createParams(params)
                var returnType = objCopy(defines.types.u32)
                
                if(offsetWord(3) == "->")
                {
                    returnType = popTypeStack()
                }

                var data = {
                    name: fname,
                    parameters: params_obj.params,
                    returnType,
                    variadic: false,
                    totalAlloc: 0,
                }

                requestBracket = {
                    type: keywordTypes.FUNCTION,
                    data
                }

                userFunctions[fname] = data
                actions.functions.createFunction(fname)
            } else if (word == "while") {
                outputCode.autoPush(
                    `cmpb $1, ${offsetWord(2)}`,
                    `jne ${requestBracket.data.exit}` // jump out if not equal
                )
            } else if (word == "return") {
                debugPrint("closer", line, scope)
                actions.functions.closeFunction(helpers.general.getMostRecentFunction(), oldStack, true, offsetWord(2))
            }
            else if (word == "if") {
                var localExit = helpers.variables.newUntypedLabel() // jump out of this if, but not out of whole block
                outputCode.autoPush(
                    `cmpb $1, ${offsetWord(2)}`, // checks if value = 1
                    `jne ${localExit}`
                )
                requestBracket = {
                    type: keywordTypes.IF,
                    data: {
                        name: helpers.variables.newUntypedLabel(), // final termination
                        localExit
                    }
                }
                mostRecentIfStatement.push(objCopy(requestBracket))
            } else if (word == "elif") {
                var localExit = helpers.variables.newUntypedLabel()// jump out of this if, but not out of whole block
                outputCode.text.push(
                    `cmpb $1, ${offsetWord(2)}`, // checks if value = 1
                    `jne ${localExit}`
                )
                requestBracket = mostRecentIfStatement.pop() // copy final termination
                mostRecentIfStatement.push(objCopy(requestBracketStack))
                requestBracketStack.data.localExit = localExit // new local exit
            }
            else if (word == "else") {
                var localExit = helpers.variables.newUntypedLabel()
                requestBracketStack = mostRecentIfStatement.pop()
                mostRecentIfStatement.push(objCopy(requestBracketStack))
                requestBracketStack.data.localExit = localExit
            }
        }
        // #endregion
        // #region Functions
        else if(offsetWord(1) == "(" && objectIncludes(userFunctions,word)) // function call
        {
            var fname = word
            var args = offsetWord(2)
            if(typeof(args) == "string")
                args = [args]
            //debugPrint(line)
            line[wordNum] = actions.functions.callFunction(fname, args)
            line.splice(wordNum + 1, args.length + 1)
        }
        // #endregion
    }


    // EVERYTHING MUST BE ABOVE THIS

    for (var wordNum = 0; wordNum < line.length; wordNum++) {
        var word = line[wordNum]
        // #region Math
        if (defines.operators.includes(line[wordNum + 1])) {
            var start = wordNum
            var onNum = true;
            var build = [];
            while (wordNum < line.length) {
                word = line[wordNum]
                if (onNum) {
                    if (defines.symbols.includes(word) || defines.operators.includes(word)) {
                        break;
                    }
                }
                build.push(word)
                onNum = !onNum;
                wordNum++;
            }
            var lbl = mathEngine(build)
            line.splice(start, build.length + 1, lbl)
        } 
        // #endregion
        // #region Conditionals
        else if(defines.conditionals.includes(offsetWord(-1)))
        {
            var left = offsetWord(-2)
            var right = word
            var cond = offsetWord(-1)

            var left_type = helpers.types.guessType(left)
            var right_type = helpers.types.guessType(right)

            
            if(typeof(left) != "string" || typeof(right) != "string")
            {
                throwE("Cannot compare expanded statements", left, right)
            }

            var regL = helpers.types.formatRegister("a", left_type)
            var regR = helpers.types.formatRegister("d", right_type)
            var lbl = helpers.registers.getFreeLabelOrRegister(defines.types.u8)

            

            if(!helpers.types.isConstant(left))
            {
                outputCode.autoPush(`mov ${left}, ${regL}`)
                left = regL
            } else { 
                left = helpers.types.formatIfConstOrLit(left)
            }

            if(!helpers.types.isConstant(right))
            {
                outputCode.autoPush(`mov ${right}, ${regR}`)
                right = regR
            } else {
                right = helpers.types.formatIfConstOrLit(right)
            }

            outputCode.autoPush(
                `mov${helpers.types.stringIsRegister(lbl)? "b" : ""} \$0, ${lbl}`,
                `cmp ${right}, ${left}`,
                `${defines.conditionalMap[cond]} ${lbl}`,
            )

            //throwE(line)
            line[wordNum - 2] = lbl
            line.splice(wordNum - 1, 2)

            wordNum -= 2

        }
        // #endregion
    }

    return line

}
module.exports = evaluate