function evaluate(line) {
    debugPrint(line)
    // line = line.map((x) => { // bad code yes

    //     if (objectIncludes(defines.types, x) && !objectIncludes(userFormats, x)) {
    //         typeStack.splice(0, 0, objCopy(defines.types[x]))
    //         return null
    //     } else if (helpers.variables.variableExists(x)) {
    //         typeStack.splice(0, 0, helpers.variables.getVariableType(x))
    //     }
    //     return x;
    // }).filter(x => x)

    //throwE(line, typeStack)

    // just for macros
    for (var wordNum = 0; wordNum < line.length; wordNum++) {
        var word = line[wordNum]
        if (objectIncludes(macros, word)) {
            line[wordNum] = macros[word]
        }
    }

    for (var wordNum = 0; wordNum < line.length; wordNum++) {

        var word = line[wordNum]
        var offsetWord = x => wordNum + x >= 0 ? line[wordNum + x] : null;

        // #region comments
        if (inComment) {
            if (word == "*/") {
                inComment = false
                //debugPrint("EXIR")
            }
            //debugPrint("YA")
            continue
        } else if (word == "/*") {

            inComment = true
            continue
        }
        // #endregion comments

        // EVERYTHING MUST BE BELOW THIS


        // #region modifications
        if (word == '(' || word == ')') {
            if(offsetWord(-2) == "call" || (offsetWord(-3) == "call" && (offsetWord(-2) in defines.types))) {
                var returnType = defines.types.u32
                var offset = -2
                if(offsetWord(-2) in defines.types) // if next word is a type
                {
                    returnType = defines.types[offsetWord(-2)]
                    offset += 1
                }

                var fnName = offsetWord(1 + offset)
                var params = offsetWord(3 + offset)

                // call as address
                if((offsetWord(-2) in defines.types))
                {
                    line[wordNum - 3] = actions.functions.callFunction(fnName, params, false, null, returnType)
                    line.splice(wordNum - 2, 5)
                } else {
                    line[wordNum - 2] = actions.functions.callFunction(fnName, params, false, null, returnType)
                    line.splice(wordNum - 1, 4)
                }

            } else {
                line.splice(wordNum, 1)
                wordNum--;
            }
        } else if (objectIncludes(defines.types, word)) { // types
            if (offsetWord(1) == "(") {
                if (objectIncludes(userFormats, word)) // format constructor
                {
                    line[wordNum] = actions.formats.callConstructor(word, offsetWord(2))
                    line.splice(wordNum + 1, 3)
                } else {
                    throwE("CAST TODO")
                }
            } else if (offsetWord(1) == "{") {
                arrayClamp = defines.types[word]
                line.splice(wordNum, 1)
                wordNum--;
                //throwE("CAMP", arrayClamp,line,wordNum)
            } else if (offsetWord(1) == "<" && objectIncludes(userFormats, word)) // format initiation
            {
                var dataLbl = actions.formats.parseParams(word, offsetWord(2))
                line[wordNum] = dataLbl

                line.splice(wordNum + 1, 3)
            } else {
                typeStack.push(objCopy(defines.types[word]))
                line.splice(wordNum, 1)
                wordNum--;
            }
        }

        //else if(word == ',' && scope[scope.length - 1].type == keywordTypes.ARRAY) {
        //     scope[scope.length - 1].data.push(offsetWord(-1))
        // }
        // #endregion
        // #region Formats and Numbers
        else if (word == '.') { // child property UNFINISHED
            // creating a new property
            if ((getLastScopeType() == keywordTypes.FORMAT) && (offsetWord(-1) == null)) { // just creating a property
                if (offsetWord(2) == "constructor") {
                    var nobj = objCopy(defines.types.___format_template___)
                    nobj.formatPtr = scope[scope.length - 1].data
                    globalVariables.__this__ = newGlobalVar(nobj)

                    actions.formats.createMethodOrConstructor(scope[scope.length - 1].data, helpers.formatters.formatConstructorName(scope[scope.length - 1].data.name), offsetWord(4))
                    // HERE AUGUST 5 2024
                } else if(offsetWord(2) == "method") {
                    // yes this is repeated.
                    var nobj = objCopy(defines.types.___format_template___)
                    nobj.formatPtr = scope[scope.length - 1].data
                    globalVariables.__this__ = newGlobalVar(nobj)

                    var retType = objCopy(offsetWord(6) == "<-" ? defines.types[offsetWord(7)] : defines.types.u32) // default return if none given. Note: prob don't need objcopy for this
                    actions.formats.createMethodOrConstructor(scope[scope.length - 1].data, helpers.formatters.formatMethodName(scope[scope.length - 1].data.name, offsetWord(1)), offsetWord(4), retType)

                    //throwE(line)
                } else {
                    scope[scope.length - 1].data.properties.push({
                        name: offsetWord(1),
                        type: objectIncludes(defines.types, offsetWord(2)) ? objCopy(defines.types[offsetWord(2)]) : objCopy(defines.types.u32)
                    })
                }
            }
            else {
                if (offsetWord(2) == "(") {
                    line[wordNum - 1] = actions.formats.callMethod(offsetWord(-1), offsetWord(1), offsetWord(3))
                    line.splice(wordNum, 5)
                }
                else {
                    // free old clobbers in a property chain
                    oldFormatAllocs.forEach(x => {
                        helpers.registers.inLineClobbers[helpers.registers.registerStringToLetterIfIs(x)] = 0
                    })
                    oldFormatAllocs = []

                    var base = offsetWord(-1)
                    var ptype = helpers.types.guessType(base)

                    if (offsetWord(2) == "<-") { //setting

                        //throwE(base, ptype.formatPtr)
                        var dest = actions.formats.readProperty(base, ptype, offsetWord(1), true)
                        actions.assembly.optimizeMove(offsetWord(3), dest.ptr, helpers.types.guessType(offsetWord(3)), dest.type)
                        return [""]
                    } else {

                        var out = actions.formats.readProperty(base, ptype, offsetWord(1), false)
                        line[wordNum - 1] = out
                        line.splice(wordNum, 2)
                        wordNum--

                        if (!(                       // negate the following: 
                            offsetWord(2) == "." || // if next is property
                            (objectIncludes(parser.nesters, offsetWord(2)) && offsetWord(4) == ".") // if next after fn call or something is property
                        )) {
                            oldFormatAllocs.pop() // actually keep this one
                        }
                    }
                }
            }
            //throwE(guessType(offsetWord(-1)))
            // } else if (objectValuesIncludes(nest.nesters, offsetWord(-1))) // if like >. or ].
            // {
            //     parent = offsetWord(-1)
            // } else {

            // }
        } else if (offsetWord(1) == "." && (word == parseInt(word)) && (offsetWord(2) == parseInt(offsetWord(2)))) // float 
        {
            var num = parseFloat(word + "." + offsetWord(2))
            var asflt = String(doubleIEEE(num))
            line.splice(wordNum + 1, 2)
            line[wordNum] = asflt
            nextNumIsFloat = true;
        } else if (word == parseInt(word)) // int
        {
            nextNumIsFloat = false;
        } else if (objectIncludes(userFormats, word)) // if word is a class
        {
            // moved to region above
            //console.log("=======", scope)
            // if (offsetWord(1) == '<') // if using an init
            // {
            //     var dataLbl = actions.formats.parseParams(word, offsetWord(2))
            //     line[wordNum] = dataLbl
            //     line.splice(wordNum + 1, 3)
            // }
            //console.log("=======", scope)
        }
        // #endregion
        // #region Arrays
        else if (word == "[") {
            var index = offsetWord(1)
            var vname = offsetWord(-1)
            if (typeof (index) == "string") {
                index = [index]
            }

            if (offsetWord(3) == "<-") {
                var value = offsetWord(4)
                return actions.variables.loadArrayIndex(vname, index, value)
            } else {
                if (vname == "__arguments") {
                    var index = index[0]

                    //debugPrint(line)
                    var out = actions.functions.readArgument(index)
                    line[wordNum - 1] = out
                    line.splice(wordNum, 3)
                    wordNum--
                    //throwE(line, wordNum)

                } else {
                    if (index.length != 1) {
                        if (index[0] == "%") {


                            var out = actions.variables.readArray(vname, index[2], index[1])
                            line[wordNum - 1] = out
                            line.splice(wordNum, 3)
                            wordNum--
                        } else {
                            throwE("Multi-dimensional arrays not implemented")
                        }
                    } else {
                        index = index[0]
                        var out = actions.variables.readArray(vname, index)
                        line[wordNum - 1] = out
                        line.splice(wordNum, 3)
                        wordNum--
                    }
                }
            }
            //else if (objectIncludes(getAllStackVariables(), vname)) { // local
            //     offset = getAllStackVariables()[vname].offset
            //     typeOfVar = 1
            // } else if (helpers.variables.checkIfParameter(vname)) {     // stack
            //     offset = helpers.functions.getParameterOffset(word) + 8
            //     typeOfVar = 0
            // } else {                                                    // global
            //     offset = vname
            //     typeOfVar = 2
            // }
        }
        // #endregion
        // #region Variables
        else if (word == "create") {        // variable creation
            /*
               0    1   2  3
            create bob <- jon;
            create u32 bob;
            create u32 bob <- jon;
            */
            if (getLastScopeType == keywordTypes.FORMAT) {
                throwE("'Create' should not be used inside of a format")
            }

            var vtype;
            if (objectIncludes(defines.types, offsetWord(1))) {
                // get type and remove
                vtype = defines.types[offsetWord(1)]
                line.splice(wordNum + 1, 1)
            } else if (offsetWord(2) == '<-') {
                vtype = helpers.types.guessType(offsetWord(3))
            } else {
                vtype = defines.types.u32
            }

            if (offsetWord(2) == '<-') {
                return actions.variables.create(offsetWord(1), vtype, offsetWord(3))
            } else {
                return actions.variables.create(offsetWord(1), vtype, 0)
            }
        } else if (word == "import") {
            //throwE(line, offsetWord(1))
            globalVariables[offsetWord(2)] = newGlobalVar(defines.types[offsetWord(1)])
            outputCode.data.push(".extern " + offsetWord(2))
            wordNum += 2
        }

        else if (offsetWord(1) == "<-") { // variable setting
            if (getLastScopeType() == keywordTypes.FORMAT) { // just creating a property
                scope[scope.length - 1].data.properties.push({
                    name: word,
                    type: popTypeStack()
                })
            } else {
                typeStack.push(defines.types.u32)
                return actions.variables.set(word, offsetWord(2))
            }
        } else if (word[0] == '"' && word[word.length - 1] == '"') { // string literal
            line[wordNum] = actions.allocations.newStringLiteral(word.substring(1, word.length - 1))
        } else if (word[0] = "'" && word[word.length - 1] == "'") {
            line[wordNum] = String(word.charCodeAt(1));
        } else if (objectIncludes(getAllStackVariables(), word)) // get stack var
        {
            line[wordNum] = actions.assembly.getStackVarAsEbp(word)
            typeStack.push(getAllStackVariables()[word].type)
        } else if (helpers.variables.checkIfParameter(word)) {   // is param
            //debugPrint("READING PARAM", word, helpers.functions.getParameterWithOffset(helpers.functions.getParameterOffset(word) + 8))
            line[wordNum] = (helpers.functions.getParameterOffset(word) + 8) + "(%ebp)"
        } else if (word == "$") {
            line[wordNum] = actions.variables.readAddress(offsetWord(1))
            line.splice(wordNum + 1, 1)
        }
        // #endregion
        // #region Brackets
        else if (word == "{") {
            if (requestBracket != 0) {
                newScope(requestBracket)
                debugPrint("ENTERTING", requestBracket)
                requestBracket = 0
            } else {
                //throwE("array init")
                newScope({
                    type: keywordTypes.ARRAY,
                    data: [],
                    begin: wordNum
                })

            }
        } else if (word == "}") {
            var oldScope = scope.pop()
            debugPrint("EXITING", oldScope)
            var oldStack = stackVariables.pop()

            if (oldScope.type == keywordTypes.FORMAT) {

                // userFormats[oldScope.data.name] = {
                //     properties: oldScope.data.properties,
                //     statics: oldScope.data.statics,
                //     methods: {},
                //     constructors: {},
                //     size: helpers.formats.getFormatSize(oldScope.data.properties)
                // }
                userFormats[oldScope.data.name] = objCopy(oldScope.data)
                userFormats[oldScope.data.name].size = helpers.formats.getFormatSize(oldScope.data.properties)

                var nobj = objCopy(defines.types.___format_template___)
                nobj.formatPtr = userFormats[oldScope.data.name]
                defines.types[oldScope.data.name] = nobj

                //throwE(nobj.formatPtr.constructors)
                outputCode.data.push(
                    helpers.formatters.formatAllocMacro(nobj.formatPtr.name) + " = " + nobj.formatPtr.size,
                    `# format "${nobj.formatPtr.name}" includes:`
                )

                nobj.formatPtr.properties.forEach(e => {
                    outputCode.data.push(`#   - PROPERTY (${e.type.pointer? "p": "u"}${e.type.size}) ${e.name}`)
                })
                Object.entries(nobj.formatPtr.constructors).forEach(e => {
                    outputCode.data.push(`#   - CNSTRCTR ${e[0]} (${e[1].parameters.length} parameters${e[1].variadic? ", variadic" : ""})`)
                })
                


                //throwE(userFormats.List.properties)
                //throwE(defines.types.Person.formatPtr.properties)
                //actions.allocations.deallocStack()
            } else if (oldScope.type == keywordTypes.FUNCTION) {
                actions.functions.closeFunction(oldScope, oldStack)
            } else if (oldScope.type == keywordTypes.WHILE) {
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
            } else if (oldScope.type == keywordTypes.ARRAY) {
                var numElements = oldScope.data.length
                var bytesPerElement = helpers.types.typeToBytes(arrayClamp)
                //arrayClamp = defines.types.u32

                var begin = oldScope.begin
                var output = actions.allocations.allocateArray(line.slice(begin), `Allocation for array`)
                lastArrayType = output.arrayType
                arrayClamp = defines.types.u32



                line[begin] = output.out
                line.splice(begin + 1, output.len + 2)
                wordNum = begin
            } else if (oldScope.type == keywordTypes.CONSTRUCTOR) {
                //throwE(oldScope.data.cons)

                actions.formats.closeConstructor(oldScope.data, oldStack)
                // throwE(oldScope)
            } else if (oldScope.type == keywordTypes.METHOD) {
                actions.formats.closeMethod(oldScope.data, oldStack)
            }
            //console.log("IJWJWWO", scope)
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
                        constructors: {},
                        methods: {},
                        size: 0
                    }
                }
            } else if (word == "persistent") {
                nextAllocIsPersistent = true;
                line.splice(wordNum--, 1)
            } else if (word == "function") {
                var fname = offsetWord(-1)
                var params = offsetWord(2)
                if (typeof (params) == "string")
                    params = [params]
                var params_obj = actions.functions.createParams(params)
                var returnType = objCopy(defines.types.u32)

                if (offsetWord(4) == "->") {

                    returnType = defines.types[offsetWord(5)]
                }

                // throwE(line, offsetWord(3), offsetWord(4))

                var data = {
                    name: fname,
                    parameters: params_obj.params,
                    returnType,
                    variadic: params_obj.didVari,
                    totalAlloc: 0,
                    saveRegs: offsetWord(-2) == "__ccalled__"
                }
                userFunctions[fname] = data

                if (offsetWord(-2) != "forward") {
                    requestBracket = {
                        type: keywordTypes.FUNCTION,
                        data
                    }

                    actions.functions.createFunction(fname)
                }
            } else if (word == "while") {
                outputCode.autoPush(
                    `cmpb $1, ${offsetWord(2)}`,
                    `jne ${requestBracket.data.exit}` // jump out if not equal
                )
            } else if (word == "return") {
                debugPrint("closer", line, scope)

                var wrd = offsetWord(1)
                if (offsetWord(1) == "(") {
                    wrd = offsetWord(2)
                } else {
                    wrd = evaluate([wrd])[0]
                }

                actions.functions.closeFunction(helpers.general.getMostRecentFunction(), oldStack, true, wrd)
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
                mostRecentIfStatement.push(objCopy(requestBracket))
                requestBracket.data.localExit = localExit // new local exit
            }
            else if (word == "else") {
                var localExit = helpers.variables.newUntypedLabel()
                requestBracket = mostRecentIfStatement.pop()
                mostRecentIfStatement.push(objCopy(requestBracket))
                requestBracket.data.localExit = localExit
            } else if (word == "__rule") {
                programRules[offsetWord(1)] = offsetWord(2) == "true"
                line.splice(wordNum--, 3)
            } else if (word == "__define") {
                macros[offsetWord(1)] = offsetWord(2)
                wordNum += 2
            }
        }
        // #endregion
        // #region Functions
        else if (offsetWord(1) == "(" && (objectIncludes(userFunctions, word) || objectIncludes(specialFunctions, word))) // function call
        {
            var fname = word
            var args = offsetWord(2)
            if (typeof (args) == "string")
                args = [args]
            //debugPrint(line)
            if (objectIncludes(specialFunctions, word)) {
                line[wordNum] = specialFunctions[fname](args)
            } else {
                line[wordNum] = actions.functions.callFunction(fname, args)
            }
            //debugPrint("1232323", line)
            line.splice(wordNum + 1, 3)
        }
        // #endregion
    }


    // EVERYTHING MUST BE ABOVE THIS

    if (!inComment) {
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
                //throwE(line)
                var lbl = mathEngine(build)
                line.splice(start, build.length + 1, lbl)
            }
            // #endregion
            // #region Conditionals
            else if (defines.conditionals.includes(offsetWord(-1))) {
                var left = offsetWord(-2)
                var right = word
                var cond = offsetWord(-1)

                var left_type = helpers.types.guessType(left)
                var right_type = helpers.types.guessType(right)


                //throwE(left, right, left_type, right_type)

                if (typeof (left) != "string" || typeof (right) != "string") {
                    throwE("Cannot compare expanded statements", left, right)
                }

                var regL = helpers.types.formatRegister("a", left_type)
                var regR = helpers.types.formatRegister("d", right_type)
                var lbl = helpers.registers.getFreeLabelOrRegister(defines.types.u8)


                // TODO: optimize to allow one reference like cmp (%ebp), $123
                if (helpers.types.isConstant(left)) {
                    left = helpers.types.formatIfConstOrLit(left)
                } else if (!helpers.types.stringIsRegister(left)) {
                    outputCode.autoPush(`mov ${left}, ${regL}`)
                    left = regL
                } else {
                    //throwE(helpers.types.getRegisterType(left, true).size)
                    if ((helpers.types.typeToBits(left_type) != 32) && helpers.types.getRegisterType(left, true).size == 32) {
                        left = helpers.types.formatRegister(helpers.registers.registerStringToLetterIfIs(left), left_type)
                    }
                }

                if (helpers.types.isConstant(right)) {
                    right = helpers.types.formatIfConstOrLit(right)
                } else if (!helpers.types.stringIsRegister(right)) {
                    outputCode.autoPush(`mov ${right}, ${regR}`)
                    right = regR
                } else {
                    if ((helpers.types.typeToBits(right_type)) != 32 && helpers.types.getRegisterType(right, true).size == 32) {
                        right = helpers.types.formatRegister(helpers.registers.registerStringToLetterIfIs(right), right_type)
                    }
                }


                outputCode.autoPush(
                    `mov${helpers.types.stringIsRegister(lbl) ? "b" : ""} \$0, ${lbl}`,
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
    }
    return line

}
module.exports = evaluate