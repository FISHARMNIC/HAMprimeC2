function evaluate(line) {
    if(typeof line == "object")
        line = line.filter(x=>x)
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
        // HERE is where forced dynamic should be like "Linked:dynamic"
        var word = line[wordNum]
        if (objectIncludes(macros, word)) {
            line[wordNum] = macros[word]
        } else if (objectIncludes(defines.types, word) && line[wordNum + 1] == ":" && (line[wordNum + 2] == "dynamic" || line[wordNum + 2] == "array" || line[wordNum + 2] == "borrowed")) {

            var ogtype = defines.types[word]
            var cpy = objCopy(ogtype)
            if ("formatPtr" in ogtype) {
                cpy.formatPtr = ogtype.formatPtr
            }
            if (line[wordNum + 2] == "dynamic") {
                cpy.hasData = true;
                defines.types[`__${word}__dynamicdef__`] = cpy
                line[wordNum] = `__${word}__dynamicdef__`

            } else if (line[wordNum + 2] == "borrowed") {
                delete cpy.hasData
                defines.types[`__${word}__staticdef__`] = cpy
                line[wordNum] = `__${word}__staticdef__`
            } else if (line[wordNum + 2] == "array"){
                if ("hasData" in cpy) {
                    cpy.elementsHaveData = true;
                    defines.types[`__${word}__dynamicChildrendef__`] = cpy
                    line[wordNum] = `__${word}__dynamicChildrendef__`
                } else {
                    cpy.hasData = true;
                    defines.types[`__${word}__dynamicdef__`] = cpy
                    line[wordNum] = `__${word}__dynamicdef__`
                }
            }

            line.splice(wordNum + 1, 2)
            /*
            should work like creates a second type called __Linked__dynamicdef__ which is a clone of the original one but has hasData enabled
            And then replaces the three words "Linked:dynamic" with __Linked__dynamicdef__
            */
            //throwE("WIP dynamic buffering")
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
            if (offsetWord(-2) == "call" || (offsetWord(-3) == "call" && (offsetWord(-2) in defines.types))) {
                var returnType = defines.types.u32
                var offset = -2
                if (offsetWord(-2) in defines.types) // if next word is a type
                {
                    returnType = defines.types[offsetWord(-2)]
                    offset += 1
                }

                var fnName = offsetWord(1 + offset)
                var params = offsetWord(3 + offset)

                // call as address
                if ((offsetWord(-2) in defines.types)) {
                    line[wordNum - 3] = actions.functions.callFunction(fnName, params, false, null, returnType)
                    line.splice(wordNum - 2, 5)
                } else {
                    line[wordNum - 2] = actions.functions.callFunction(fnName, params, false, null, returnType)
                    line.splice(wordNum - 1, 4)
                }

            }
            else {
                line.splice(wordNum, 1)
                wordNum--;
            }
        } else if (objectIncludes(defines.types, word)) { // types. Lazy code,  fix later
            if (offsetWord(1) == "(") {
                if (defines.types[word]?.formatPtr != null)
                    //throwE("EEEEEEE", userFormats)
                    // not in userFormats yet!
                    if (objectIncludes(userFormats, word)) // format constructor
                    {
                        line[wordNum] = actions.formats.callConstructor(word, offsetWord(2))
                        line.splice(wordNum + 1, 3)

                    }
            } else if (offsetWord(1) == ":") { // cast
                if (offsetWord(2) != "(") {
                    throwE("Must cast with parenthesis after colon. Like 'type:(data)'")
                }
                if(word == "auto")
                {
                    throwE("autocast not implemented")
                } else {
                var type = defines.types[word]
                line[wordNum] = actions.assembly.allocateAndSet(offsetWord(3), type)
                line.splice(wordNum + 1, 4)
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
            } else if (offsetWord(1) == "[") { // array allocation
                var num = offsetWord(2)
                var bytes = helpers.types.typeToBytes(defines.types[word])//helpers.types.typeToBytesWithFmts(defines.types[word])

                if (offsetWord(3) == "]") {
                    var elementsHaveData = false
                    if (defines.types[word].hasData || "formatPtr" in defines.types[word])
                        elementsHaveData = true
                    var newType = helpers.types.convertTypeToHasData(defines.types[word])
                    newType.pointer = true // if broken delete
                    if (elementsHaveData) {
                        newType.elementsHaveData = true
                    }

                    var out = helpers.registers.getFreeLabelOrRegister(newType)

                    //throwE(helpers.types.guessType(out))
                    if (num == parseInt(num)) { // literal
                        num = parseInt(num)

                        actions.allocations.allocateMmap(bytes * num, `Asked for ${num} allocations of "${word}"`)
                        outputCode.autoPush(
                            `mov %eax, ${out}`
                        )
                    } else {
                        outputCode.autoPush(
                            `# Asked for ${num} allocations of "${word}"`,
                            `mov \$${bytes}, %edx`,
                            `mov ${num}, %eax`,
                            `mul %edx`,
                            `pushl $0`,
                            `push %eax`,
                            `call __rc_allocate__`,
                            `add $8, %esp`,
                            `mov %eax, ${out}`
                        )
                    }
                    line[wordNum] = out
                    line.splice(wordNum + 1, 3)
                } else {
                    throwE("To create a typed allocation, do TPYE[SIZE]")
                }
            }
            else if (offsetWord(1) != ".") { // NEEDS TO GO LASTTTTTT. IF BROKEN REMOVE IF, keep else
                //throwE("~~~", word)
                typeStack.push(objCopy(defines.types[word]))
                line.splice(wordNum, 1)
                wordNum--;
            }
        } else if (objectIncludes(userFormats, word)) {
            //throwE("~~~", word)
        } else if (word == "@") {
            var numberOfDeref = 1
            while (offsetWord(numberOfDeref) == "@")
                numberOfDeref++
            line.splice(wordNum, numberOfDeref)

            var derefData
            var setting = false
            if (line[wordNum] == "(") {
                derefData = offsetWord(1)
                if (offsetWord(3) == "<-")
                    setting = true
                line.splice(wordNum, 3)
            } else {
                derefData = line[wordNum]
                if (offsetWord(1) == "<-")
                    setting = true
                line.splice(wordNum, 1)
            }

            var baseType = helpers.types.guessType(derefData)
            // needs to have hasData etc. Think
            if (setting) {
                throwE("Setting pointer WIP", baseType)

            } else {
                var retType = objCopy(baseType)
                retType.pointer = false

                outputCode.autoPush(
                    `# dereferencing ${derefData}`
                )
                if (numberOfDeref > 1) {
                    throwE("Multiple dereferences not included yet")
                } else {
                    var reg = helpers.registers.getFreeLabelOrRegister(retType)
                    line[wordNum] = reg
                    if (helpers.types.stringIsRegister(derefData) || objectIncludes(globalVariables, derefData)) {
                        outputCode.autoPush(
                            `mov${helpers.types.sizeToSuffix(retType)} (${derefData}), ${reg}`
                        )
                    }
                    else {
                        outputCode.autoPush(
                            `mov ${reg}, %eax`,
                            `mov${helpers.types.sizeToSuffix(retType)} (%eax), ${reg}`
                        )
                    }
                }
            }
        }

        //else if(word == ',' && scope[scope.length - 1].type == keywordTypes.ARRAY) {
        //     scope[scope.length - 1].data.push(offsetWord(-1))
        // }
        // #endregion
        // #region Formats and Numbers
        else if (word == ".") { // child property
            // creating a new property
            //console.log("Prop", line)
            if ((getLastScopeType() == keywordTypes.FORMAT) && (offsetWord(-1) == null)) { // just creating a property
                if (offsetWord(2) == "constructor") {
                    var nobj = objCopy(defines.types.___format_template_dynamic___)
                    nobj.formatPtr = scope[scope.length - 1].data
                    nobj = helpers.types.convertTypeToHasData(nobj)
                    globalVariables.__this__ = newGlobalVar(nobj)

                    actions.formats.createMethodOrConstructor(scope[scope.length - 1].data, helpers.formatters.formatConstructorName(scope[scope.length - 1].data.name), offsetWord(4))
                    // HERE AUGUST 5 2024
                } else if (offsetWord(2) == "method") {
                    // yes this is repeated.
                    var nobj = objCopy(defines.types.___format_template_dynamic___)
                    nobj.formatPtr = scope[scope.length - 1].data
                    nobj = helpers.types.convertTypeToHasData(nobj)
                    globalVariables.__this__ = newGlobalVar(nobj)


                    __addToAnyVarEverMade(offsetWord(1))
                    var retType = objCopy(offsetWord(6) == "->" ? defines.types[offsetWord(7)] : defines.types.u32) // default return if none given. Note: prob don't need objcopy for this
                    //throwE(retType)
                    actions.formats.createMethodOrConstructor(scope[scope.length - 1].data, helpers.formatters.formatMethodName(scope[scope.length - 1].data.name, offsetWord(1)), offsetWord(4), retType)

                    //throwE(line)
                } else if (offsetWord(2) == "operator")
                {
                    // just make this a function...
                    var nobj = objCopy(defines.types.___format_template_dynamic___)
                    nobj.formatPtr = scope[scope.length - 1].data
                    nobj = helpers.types.convertTypeToHasData(nobj)
                    globalVariables.__this__ = newGlobalVar(nobj)

                    //throwE("operator", line)
                    if(offsetWord(3) != "(" || offsetWord(5) != ")")
                    {
                        throwE(`Improper operator syntax. Expects "operator(?)<?> -> ?"`)
                    }

                    var operator = offsetWord(4)
                    var retType = objCopy(offsetWord(9) == "->" ? defines.types[offsetWord(10)] : defines.types.u32)
                    
                    var _scope = scope[scope.length - 1].data
                    var formattedName = helpers.formatters.formatOperatorName(_scope.name, operator)
                    var params = offsetWord(7)
                    
                    actions.formats.createOperator(_scope, formattedName, params, retType)
                } else {
                    __addToAnyVarEverMade(offsetWord(1))
                    // IF BUG ::::: SEP 11
                    /*
                    scope[scope.length - 1].data.properties.push({
                        name: offsetWord(1),
                        type: objectIncludes(defines.types, offsetWord(2)) ? objCopy(defines.types[offsetWord(2)]) : objCopy(defines.types.u32)
                    })
                    */
                    scope[scope.length - 1].data.properties.push({
                        name: offsetWord(1),
                        type: objectIncludes(defines.types, offsetWord(2)) ? defines.types[offsetWord(2)] : objCopy(defines.types.u32)
                    })

                    var nobj = objCopy(defines.types.___format_template_dynamic___)
                    nobj.formatPtr = scope[scope.length - 1].data
                    //nobj.hasData = true
                    defines.types[scope[scope.length - 1].data.name] = nobj

                    userFormats[scope[scope.length - 1].data.name].properties = scope[scope.length - 1].data.properties
                    //console.log("ADDED", userFormats[scope[scope.length - 1].data.name].properties)

                    //throwE(defines.types)
                }
            }
            else {
                if (offsetWord(2) == "(") {
                    var args = offsetWord(3)
                    if(args  == ")")
                    {
                        args = []
                    }
                    //console.log("Going to call", offsetWord(-1), offsetWord(1), args)
                    line[wordNum - 1] = actions.formats.callMethod(offsetWord(-1), offsetWord(1), args)
                    line.splice(wordNum, 5)
                    wordNum--;
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
                        //console.log("SEEEEE", base, ptype, offsetWord(1), line)
                        //console.log("EEEEE", base, ptype, offsetWord(1), true)
                        var dest = actions.formats.readProperty(base, ptype, offsetWord(1), true)

                        actions.assembly.optimizeMove(offsetWord(3), dest.ptr, helpers.types.guessType(offsetWord(3)), dest.type)

                        if ("hasData" in helpers.types.guessType(offsetWord(3)) && nextThingTakesOwnership) {
                            outputCode.autoPush(
                                `# requesting ownership for ${base} (property)`,
                                `lea ${dest.ptr}, %eax`,
                                `push %eax`,
                                `push ${offsetWord(3)}`,
                                `call __rc_requestOwnership__`,
                                `add $8, %esp`
                            )
                        }
                        nextThingTakesOwnership = defaultAutomaticOwnership


                        return [""]
                    } else {

                        var out = actions.formats.readProperty(base, ptype, offsetWord(1), false)
                        line[wordNum - 1] = out
                        line.splice(wordNum, 2)
                        wordNum--

                        //throwE(line)

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
            var outreg = actions.assembly.allocateAndSet(asflt, defines.types.f32)
            line.splice(wordNum + 1, 2)
            line[wordNum] = outreg
            nextNumIsFloat = true; // faze this out
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
                        //console.log(":::::", line.join(" "))
                        var out = actions.variables.readArray(vname, index)
                        line[wordNum - 1] = out
                        line.splice(wordNum, 3)
                        wordNum--
                        // throwE(line, wordNum, helpers.types.guessType(line[wordNum]))
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
                //console.log("______", line)
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
            if (getLastScopeType() == keywordTypes.FORMAT) { // just creating a property // THIS IS OLD... SHOULD BE REMOVED TODO HERE
                throwE('Please use ".property type" as "property <- type" is deprecated')
                // scope[scope.length - 1].data.properties.push({
                //     name: word,
                //     type: popTypeStack()
                // })
            } else {
                //typeStack.push(defines.types.u32)
                return actions.variables.set(word, offsetWord(2))
            }
        } else if (word[0] == '"' && word[word.length - 1] == '"') { // string literal
            line[wordNum] = actions.allocations.newStringLiteral(word.substring(1, word.length - 1))
        } else if (word[0] = "'" && word[word.length - 1] == "'") {
            line[wordNum] = String(word.charCodeAt(1));
        } else if (objectIncludes(getAllStackVariables(), word) && offsetWord(1) != ":") // get stack var
        {
            line[wordNum] = actions.assembly.getStackVarAsEbp(word)
            typeStack.push(getAllStackVariables()[word].type)
        } else if (helpers.variables.checkIfParameter(word) && offsetWord(1) != ":") {   // is param
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

                var nobj = objCopy(defines.types.___format_template_dynamic___)
                nobj.formatPtr = userFormats[oldScope.data.name]
                defines.types[oldScope.data.name] = nobj

                outputCode.data.push(
                    helpers.formatters.formatAllocMacro(nobj.formatPtr.name) + " = " + nobj.formatPtr.size,
                    `# format "${nobj.formatPtr.name}" includes:`
                )

                nobj.formatPtr.properties.forEach(e => {
                    outputCode.data.push(`#   - PROPERTY (${e.type.pointer ? "p" : "u"}${e.type.size}) ${e.name}`)
                })
                Object.entries(nobj.formatPtr.constructors).forEach(e => {
                    outputCode.data.push(`#   - CNSTRCTR ${e[0]} (${e[1].parameters.length} parameters${e[1].variadic ? ", variadic" : ""})`)
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
                line.splice(begin + 1, output.len + 1) //HERE IF BUG MAKE output.len + 2
                //throwE(line)
                wordNum = begin
            } else if (oldScope.type == keywordTypes.CONSTRUCTOR) {
                //throwE(oldScope.data.cons)

                actions.formats.closeConstructor(oldScope.data, oldStack)
                // throwE(oldScope)
            } else if (oldScope.type == keywordTypes.METHOD) {
                actions.formats.closeMethod(oldScope.data, oldStack)
            } else if (oldScope.type == keywordTypes.OPERATOR) {
                actions.functions.closeFunction(oldScope.data, oldStack)
            }
            //console.log("IJWJWWO", scope)
        }
        // #endregion
        // #region Keywords
        else if (defines.keywords.includes(word) && (!(offsetWord(-1) == "."))) // keyword   
        {
            var kname = offsetWord(-1)
            if (word == "format") {
                // IF BROKEN FIX HERE TODO BUG CRASH SEP 11
                var d = {
                    name: kname,
                    properties: [],
                    statics: [],
                    constructors: {},
                    methods: {},
                    operators: {},
                    size: 0
                }
                requestBracket = {
                    type: keywordTypes.FORMAT,
                    data: d
                }
                userFormats[kname] = d


                var nobj = objCopy(defines.types.___format_template_dynamic___)
                nobj.formatPtr = d
                defines.types[kname] = nobj
                //throwE(defines.types)
            } else if (word == "print_" || word == "println_") {
                //throwE("WIP")

                if (offsetWord(1) != "(") {
                    throwE(`Print must be called like a function with parenthesis`)
                } else if (offsetWord(3) != ")") {
                    throwE(`Print can only take one value`)
                }

                var data = offsetWord(2)
                var dataType = helpers.types.guessType(data)

                //throwE(dataType)
                if ("elementsHaveData" in dataType) {
                    throwE("Printing format arrays are still WIP")

                    // IMPORTANT need to save and restore "this" before and after
                    var toStringMethod = helpers.formatters.formatMethodName(dataType.formatPtr.name, "toString")
                    actions.assembly.optimizeMove(data, "__this__", dataType, dataType)
                    outputCode.autoPush(
                        `# printing format array`,
                        `mov ${data}, %eax`,
                        `push %eax     # load buffer`,
                        `mov -4(%eax), %edx`,
                        `pushl 8(%edx) # load size`,
                        `pushl \$${toStringMethod} # load toString method`,
                        `call print_formatArr`,
                        `add $8, %esp`
                    )
                }
                else if ("formatPtr" in dataType) {
                    var out = actions.formats.callMethod(data, "toString", "")
                    helpers.registers.deClobberRegister(helpers.registers.registerStringToLetterIfIs(out))

                    actions.assembly.pushToStack(out, defines.types.string)
                    outputCode.autoPush(
                        `call puts`,
                        `add $4, %esp`
                    )
                    // should just call print method of class
                } else if ("advptr" in dataType) {
                    //actions.assembly.pushClobbers();
                    actions.assembly.pushToStack(data, dataType)
                    outputCode.autoPush(
                        `call puts`,
                        `add $4, %esp`
                    )
                    //actions.assembly.popClobbers();
                }

                else if ("hasData" in dataType) {
                    var arr_type = dataType.size;
                    outputCode.autoPush(
                        `# printing array`,
                        `mov ${data}, %eax`,
                        `push %eax     # load buffer`,
                        `mov -4(%eax), %edx`,
                        `pushl 8(%edx) # load size`,
                        `call print_arr${arr_type}`,
                        `add $8, %esp`
                    )
                    //throwE("Printing buffers not finished")
                    // todo: get length from entryReference and print all items correspondingly
                } else {
                    if (dataType.pointer) {

                        if (dataType.size == 8) {
                            throwE("Print cannot display 8bit buffers yet")
                        } else if (dataType.size == 16) {
                            throwE("Print cannot display 16bit buffers yet")
                        } else if (dataType.size == 32) {

                        }
                    } else {
                        //throwE("The print function is still in development ")

                        actions.assembly.pushToStack(data, dataType)
                        if (dataType.float) {
                            outputCode.autoPush(
                                `call print_float_noPromo`,
                                `add $4, %esp`
                            )
                        } else {
                            outputCode.autoPush(
                                `pushl $__PRINT_TYPE_INT__`,
                                `call printf`,
                                `add $8, %esp`
                            )
                        }
                    }
                }
                //throwE("WIP")
            }

            else if (word == "transient") {
                nextAllocIsTransient = true;
                line.splice(wordNum--, 1)
            } else if (word == "persistent") {
                nextAllocIsPersistent = true;
                line.splice(wordNum--, 1)
            } else if (word == "own") {
                nextThingTakesOwnership = true;
                line.splice(wordNum--, 1)
            } else if (word == "borrow") {
                nextThingTakesOwnership = false;
                line.splice(wordNum--, 1)
            } else if (word == "duplicate") {
                if (offsetWord(1) != "(") {
                    throwE(`Duplicate must be called like a function with parenthesis`)
                } else if (offsetWord(3) != ")") {
                    throwE(`Duplicate can only take one value`)
                }
                line[wordNum] = actions.assembly.copyData(offsetWord(2))
                line.splice(wordNum + 1, 3)
            } else if (word == "copy") {
                if (offsetWord(1) != "(") {
                    throwE(`Copy must be called like a function with parenthesis`)
                } else if (offsetWord(3) != ")") {
                    throwE(`Copy doens't have the right parameters`)
                } else if (offsetWord(2)[1] != ",") {
                    throwE("Copy needs two arguments: copy(dest, src)")
                }

                var dest = offsetWord(2)[0]
                var src = offsetWord(2)[2]
                var srcType = helpers.types.guessType(src)
                var destType = helpers.types.guessType(dest)

                if (!("hasData" in srcType) || !("hasData" in destType)) {
                    //throwE(`Cannot copy non-dynamically allocated data. Use memcpy instead`, srcType)
                }
                if (!helpers.types.areEqual(srcType, destType)) {
                    throwW(`Attempting to copy data type "${helpers.types.convertTypeObjToName(srcType)}" into "${helpers.types.convertTypeObjToName(destType)}"`)
                }

                // throwE(dest)

                outputCode.autoPush(
                    `# realloc buffer`,
                    //`pushl \$${helpers.types.typeToBytes(srcType)}`
                )

                actions.assembly.pushToStack(src, srcType)
                actions.assembly.pushToStack(dest, destType)

                //throwE(dest)
                var oreg = helpers.registers.getFreeLabelOrRegister(destType)

                outputCode.autoPush(
                    "call __copydata__",
                    "add $8, %esp", // 12
                    `mov %eax, ${oreg}`
                )

                line[wordNum] = oreg
                line.splice(wordNum + 1, 3)

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
                    `# comparison for WHILE loop`,
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
                    if (line.length != 2) {
                        throwE(`Place parenthesis around return statement [${line.join(" ")}]. like: return(stuff)`)
                    }
                }

                actions.functions.closeFunction(helpers.general.getMostRecentFunction(), oldStack, true, wrd)
            } else if (word == "return_new") {
                debugPrint("closer", line, scope)

                var wrd = offsetWord(1)
                if (offsetWord(1) == "(") {
                    wrd = offsetWord(2)
                } else {
                    wrd = evaluate([wrd])[0]
                    if (line.length != 2) {
                        throwE(`Place parenthesis around return statement [${line.join(" ")}]. like: return(stuff)`)
                    }
                }

                outputCode.autoPush("# taking ownership AND returning")
                actions.functions.closeFunction(helpers.general.getMostRecentFunction(), oldStack, true, wrd, true)
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
            {
                if(args == ")")
                    args = []
                else
                    args = [args]
            }
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
                var floatMath = false;
                var stringMath = false;
                while (wordNum < line.length) {
                    word = line[wordNum]
                    if (onNum) {
                        if (defines.symbols.includes(word) || defines.operators.includes(word)) {
                            break;
                        }
                    }
                    var vtype = helpers.types.guessType(word)
                    if (vtype.float) {
                        floatMath = true;
                    } else if (vtype.advptr) {
                        stringMath = true
                    }
                    build.push(word)
                    onNum = !onNum;
                    wordNum++;
                }
                // throwE(build, stringMath)

                var lbl = stringMath ? stringAdder(build) : (floatMath ? floatEngine(build) : mathEngine(build))
                //throwE(outputCode.text)
                line.splice(start, build.length + 1, lbl)
                //throwE("spliced", line, build, build.length)
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
                //console.log("CLOBBBDED", lbl, line)

                if (defines.conditionalCombinators.includes(cond)) {
                    // throwE(left, right, cond)

                    var skipLbl = helpers.variables.newUntypedLabel();

                    if (cond == "||") {
                        outputCode.autoPush(
                            `# OR comparison`,
                            `mov${helpers.types.stringIsRegister(lbl) ? "" : "b"} \$0, ${lbl}`,
                            `cmpb $1, ${left}`,
                            `sete ${lbl}`,
                            `je ${skipLbl}`,
                            `cmpb $1, ${right}`,
                            `sete ${lbl}`,
                            `${skipLbl}:`
                        )
                    } else if (cond == "&&") {
                        outputCode.autoPush(
                            `# AND comparison`,
                            `mov${helpers.types.stringIsRegister(lbl) ? "" : "b"} \$0, ${lbl}`,
                            `cmpb $1, ${left}`,
                            `jne ${skipLbl}`,
                            `cmpb $1, ${right}`,
                            `sete ${lbl}`,
                            `${skipLbl}:`
                        )
                    } else {
                        throwE(`[COMPILER-ERROR] Unknown conditional operator "${cond}"`)
                    }
                } else {
                    if ("advptr" in left_type && "advptr" in right_type) // string
                    {
                        actions.assembly.pushClobbers();
                        actions.assembly.pushToStack(left, defines.types.string)
                        actions.assembly.pushToStack(right, defines.types.string)

                        outputCode.autoPush(
                            `call strcmp`,
                            `add $8, %esp`,
                        )

                        actions.assembly.popClobbers();

                        if (helpers.types.stringIsRegister(lbl)) {
                            var l = helpers.registers.registerStringToLetterIfIs(lbl)
                            var fmtted = helpers.types.formatRegister(l, defines.types.u32)
                            outputCode.autoPush(
                                `xor ${fmtted}, ${fmtted}`
                            )
                        } else {
                            outputCode.autoPush(
                                `movb $0, ${lbl}`
                            )
                            //throwW("[INTERNAL] unable to zero-out label. Might have weird data from before later")
                        }

                        outputCode.autoPush(
                            `cmp $0, %eax`,
                            `${defines.inverseConditionalMap[cond]} ${lbl}`, // TODO: need to use setz for ==
                        )
                    } else {
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
                            `mov${helpers.types.stringIsRegister(lbl) ? "" : "b"} \$0, ${lbl}`,
                            `cmp ${right}, ${left}`,
                            `${defines.conditionalMap[cond]} ${lbl}`,
                        )
                    }

                    //throwE(line)
                }
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