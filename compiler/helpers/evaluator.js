function evaluate(line) {
    if (typeof line == "object")
        line = line.filter(x => x)
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
        } else if (objectIncludes(defines.types, word) && line[wordNum + 1] == ":" && (/*objectIncludes(defines.types, line[wordNum + 2]) || */line[wordNum + 2] == "dynamic" || line[wordNum + 2] == "array" || line[wordNum + 2] == "borrowed" || line[wordNum + 2] == "locked" || line[wordNum + 2] == "reference")) {

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
            } else if (line[wordNum + 2] == "array") {
                // if ("hasData" in cpy) {
                //     cpy.elementsHaveData = true;
                //     defines.types[`__${word}__dynamicChildrendef__`] = cpy
                //     line[wordNum] = `__${word}__dynamicChildrendef__`
                // } else {
                //     cpy.hasData = true;
                //     defines.types[`__${word}__dynamicdef__`] = cpy
                //     line[wordNum] = `__${word}__dynamicdef__`
                // }
 
                var n = objCopy(defines.types.array)
                n.arrayElements = cpy
                var name = helpers.variables.newUntypedLabel()
                defines.types[`__TYPE_${name}__`] = n
                line[wordNum] = `__TYPE_${name}__`

            } else if (line[wordNum + 2] == "locked") {
                throwE("Locked pointers are still in development")

                if (!("formatPtr" in cpy)) {
                    throwE("Cannot create locked variant of static type")
                }
                cpy.locked = true
                defines.types[`__${word}__lockdef__`] = cpy
                line[wordNum] = `__${word}__staticdef__`
            } else if (line[wordNum + 2] == "reference") {
                cpy.isReference = true;
                defines.types[`__${word}__reference__`] = cpy
                line[wordNum] = `__${word}__reference__`
            } 
            // else if (objectIncludes(defines.types, line[wordNum + 2]))
            // {
            //     cpy.arrayElements = objCopy(defines.types[line[wordNum + 2]])
            //     var name = helpers.variables.newUntypedLabel()
            //     defines.types[`__TYPE_${name}__`] = cpy
            //     line[wordNum] = `__TYPE_${name}__`
            // }

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
            if (offsetWord(-2) == "call") {
                var returnType = defines.types.u32

                var hasRet = false
                if (offsetWord(3) == "->") // if next word is a type
                {
                    hasRet = true
                    //throwE("ya")
                    returnType = defines.types[offsetWord(4)]
                }
                //throwE(offsetWord(-1), line)

                var fnName = offsetWord(-1)
                var params = offsetWord(1)

                // call as address
                if (hasRet) {
                    line[wordNum - 2] = actions.functions.callFunction(fnName, params, false, null, returnType)
                    line.splice(wordNum - 1, 6)
                } else {
                    line[wordNum - 2] = actions.functions.callFunction(fnName, params, false, null, returnType)
                    line.splice(wordNum - 1, 4)
                }

                //throwE(line, wordNum)

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
                if (word == "auto") {
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
                        actions.assembly.pushClobbers() // todo !@# ### no need to push and pop var "out" since its not used yet
                        outputCode.autoPush(
                            `# Asked for ${num} allocations of "${word}"`,
                            `mov \$${bytes}, %edx`,
                            `mov ${num}, %eax`,
                            `mul %edx`,
                            `pushl $0`,
                            `push %eax`,
                            `call __rc_allocate__`,
                            `add $8, %esp`,
                        )
                        actions.assembly.popClobbers()
                        outputCode.autoPush(`mov %eax, ${out}`)
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
            var retType = helpers.types.derefType(baseType)
            // needs to have hasData etc. Think
            if (setting) {
                actions.assembly.setMemAddr(derefData, baseType, offsetWord(1))
            } else {

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
                } else if (offsetWord(2) == "operator") {
                    // just make this a function...
                    var nobj = objCopy(defines.types.___format_template_dynamic___)
                    nobj.formatPtr = scope[scope.length - 1].data
                    nobj = helpers.types.convertTypeToHasData(nobj)
                    globalVariables.__this__ = newGlobalVar(nobj)

                    //throwE("operator", line)
                    if (offsetWord(3) != "(" || offsetWord(5) != ")") {
                        throwE(`Improper operator syntax. Expects "operator(?)<?> -> ?"`)
                    }

                    var operator = offsetWord(4)
                    var retType = objCopy(offsetWord(9) == "->" ? defines.types[offsetWord(10)] : defines.types.u32)

                    var _scope = scope[scope.length - 1].data
                    var params = offsetWord(7)

                    actions.formats.createOperator(_scope, operator, params, retType)
                } else {
                    __addToAnyVarEverMade(offsetWord(1))
                    // IF BUG ::::: SEP 11
                    /*
                    scope[scope.length - 1].data.properties.push({
                        name: offsetWord(1),
                        type: objectIncludes(defines.types, offsetWord(2)) ? objCopy(defines.types[offsetWord(2)]) : objCopy(defines.types.u32)
                    })
                    */
                    var type = objectIncludes(defines.types, offsetWord(2)) ? defines.types[offsetWord(2)] : objCopy(defines.types.unknown)
                    if ("voided" in type) {
                        throwE("Cannot create void property")
                    }

                    scope[scope.length - 1].data.properties.push({
                        name: offsetWord(1),
                        type,
                        isPublic: inPublicMode
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
                    if (args == ")") {
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
                        //console.log(ptype.formatPtr)
                        var dest = actions.formats.readProperty(base, ptype, offsetWord(1), true)
                        var intype = helpers.types.guessType(offsetWord(3))

                        if ("unknown" in dest.type) {
                            ptype.formatPtr.properties.find(x => x.name == offsetWord(1)).type = intype
                            dest.type = intype
                        }

                        //throwE(ptype.formatPtr.properties)

                        actions.assembly.optimizeMove(offsetWord(3), dest.ptr, intype, dest.type)

                        if ("hasData" in intype && nextThingTakesOwnership) {
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
            //console.log("ya", line)
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
                        //throwW("$$$", out)
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
                vtype = defines.types.unknown
                //throwE("unknown", offsetWord(1))
            }
            //console.log(line)
            //throwW("%%%%", vtype)
            if (offsetWord(2) == '<-') {
                return actions.variables.create(offsetWord(1), vtype, offsetWord(3))
            } else {
                //console.log("yuh")
                return actions.variables.create(offsetWord(1), vtype, null)
            }
        } else if (word == "import" || word == "importTLS") {
            //throwE(line, offsetWord(1))
            globalVariables[offsetWord(2)] = newGlobalVar(defines.types[offsetWord(1)])
            if (word == "importTLS") {
                outputCode.data.push(".section .tbss;\n.extern " + offsetWord(2) + ";\n.data")
            }
            else {
                outputCode.data.push(".extern " + offsetWord(2))
            }
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
                outputCode.autoPush(`# SETTING ${line.join(" ")}`)
                return actions.variables.set(word, offsetWord(2))
            }
        } else if (word[0] == '"' && word[word.length - 1] == '"') { // string literal
            line[wordNum] = actions.allocations.newStringLiteral(word.substring(1, word.length - 1))
            //throwE("u", line[wordNum])
        } else if (word[0] = "'" && word[word.length - 1] == "'") {
            line[wordNum] = String(word.charCodeAt(1));
        } else if (word[0] == "`" && word[word.length - 1] == "`") {
            line[wordNum] = actions.strings.createTemplateString(word.slice(1, word.length - 1))
        } else if (objectIncludes(getAllStackVariables(), word) && offsetWord(1) != ":") // get stack var
        {
            //line[wordNum] = actions.assembly.getStackVarAsEbp(word)
            var temp = actions.assembly.getStackVarAsEbp(word)
            line[wordNum] = actions.assembly.convertReferenceToNormalIfIs(temp)
            outputCode.autoPush(`# note, read STACK VAR ${word} -> ${temp}`)
            // if("unknown" in getAllStackVariables()[word].type)
            // {
            //     throwE(`Unable to read variable ${word} of unknown type`)
            // }
            typeStack.push(getAllStackVariables()[word].type)
        } else if (helpers.variables.checkIfParameter(word) && offsetWord(1) != ":") {   // is param
            //debugPrint("READING PARAM", word, helpers.functions.getParameterWithOffset(helpers.functions.getParameterOffset(word) + 8))   
            //line[wordNum] = (helpers.functions.getParameterOffset(word) + 8) + "(%ebp)"
            var temp = (helpers.functions.getParameterOffset(word) + 8) + "(%ebp)"

            var rep = actions.assembly.convertReferenceToNormalIfIs(temp)
            line[wordNum] = rep

            // if("unknown" in helpers.variables.getVariableType(rep))
            // {
            //     throwE(`Unable to read variable ${word} of unknounwn type`)
            // }
            outputCode.autoPush(`# note, read PARAM ${word} -> ${temp}`)

        } else if (helpers.variables.checkIfOnCaptureStack(word) && offsetWord(1) != ":") // is lambda stack var capture
        {
            line[wordNum] = actions.assembly.getCapturedStackVarAsEcx(word)
            typeStack.push(helpers.types.guessType(word))
            //throwE("cap", line[wordNum])
        } else if (objectIncludes(helpers.general.getMostRecentFunction()?.data?.capturedParams, word) && offsetWord(1) != ":") // is lambda param capture
        {
            throwE("Lambda capture params WIP")
        }
        else if (word == "$") {
            var word = ""

            if (offsetWord(1) == "(") {
                if (offsetWord(3) != ")") {
                    throwE("\"address of\" operator missing close bracket")
                }
                word = offsetWord(2)
                line[wordNum] = actions.variables.readAddress(word)
                line.splice(wordNum + 1, 3)
            }
            else {
                word = offsetWord(1)
                line[wordNum] = actions.variables.readAddress(word)
                line.splice(wordNum + 1, 1)
            }
            //console.log("#####", word, lambdaQueue)

            var f = lambdaQueue.find(x => {
                return x.name == word
            })

            if (f != undefined) {
                f.capturedParams = objCopy(helpers.general.getMostRecentFunction().data.parameters)
                //throwE(getAllStackVariables())
                f.capturedStackVars = objCopy(getAllStackVariables())
                f.ready = true
                //throwE("found", getAllStackVariables())
                // here, make lambda ready, and copy scope
            }
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
            var oldScope = scope.popScope()
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
            } else if (oldScope.type == keywordTypes.WHILE || oldScope.type == keywordTypes.FOREACH) {
                if (oldScope.type == keywordTypes.FOREACH) {
                    outputCode.autoPush(`incw ${oldScope.data.indexer}`)
                }
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
                inPublicMode = true;


                var nobj = objCopy(defines.types.___format_template_dynamic___)
                nobj.formatPtr = d
                defines.types[kname] = nobj
                //throwE(defines.types)
            } else if (word == "print_" || word == "println_") {
                //throwE("WIP")

                actions.assembly.pushMLclobbers()

                if (offsetWord(1) != "(") {
                    throwE(`Print must be called like a function with parenthesis`)
                } else if (offsetWord(3) != ")") {
                    throwE(`Print can only take one value`)
                }

                var data = offsetWord(2)
                var dataType = helpers.types.guessType(data)

                //throwE(dataType)
                if (helpers.types.checkIfElementsHaveData(dataType)) {
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
                        }
                        else if ("isChar" in dataType) {
                            outputCode.autoPush(
                                `call putchar`,
                                `movb $'\\n', (%esp)`,
                                `call putchar`,
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

                actions.assembly.popMLclobbers()
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
            } else if (word == "forward") {
                nextIsForward = true;
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
                    //throwE(srcType,destType)
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

            } else if (word == "JS_EVAL") {
                line[wordNum] = eval(offsetWord(1).slice(1, offsetWord(1).length - 1))
                line.splice(wordNum + 1, 1)
            } else if (word == "__asm__") {
                outputCode.autoPush(offsetWord(1).slice(1, offsetWord(1).length - 1))
                break
            }
            else if (word == "function") {
                var fname = offsetWord(-1)
                var params = offsetWord(2)
                if (typeof (params) == "string")
                    params = [params]
                var params_obj = actions.functions.createParams(params)
                var returnType = objCopy(defines.types.u32)
                var noReturnType = true

                if (offsetWord(4) == "->") {
                    noReturnType = false
                    returnType = defines.types[offsetWord(5)]
                }

                // throwE(line, offsetWord(3), offsetWord(4))

                var isLambda = offsetWord(-2) == "__lambda__"

                var data = {
                    name: fname,
                    parameters: params_obj.params,
                    returnType,
                    variadic: params_obj.didVari,
                    totalAlloc: 0,
                    saveRegs: offsetWord(-2) == "__ccalled__",
                    isLambda
                }

                if (isLambda) {
                    var instance = _allLambdas.find(x => x.name == fname)
                    if (instance == undefined) {
                        throwE(`Unable to find lambda reference for "${fname}"`)
                    }
                    outputCode.data.push(`${fname}ebpCapture__: .4byte 0 # Capture ebp for anonymous function`)
                    
                    data.capturedParams = instance.capturedParams
                    data.capturedStackVars = instance.capturedStackVars
                   
                    //throwE("wefewfwf", instance)
                }


                userFunctions[fname] = data
                /*
                if(word == "lambda")
                {
                    var num = noReturnType ? 4 : 6

                    if(offsetWord(num) != "{")
                    {
                        throwE("No function statement provided in lambda")
                    }

                    var nest = 0

                    var numStart = ++num

                    // capture code in lambda
                    while(num < line.length)
                    {
                        if(offsetWord(num) == "{")
                        {
                            console.log("n", nest)
                            nest++
                        }
                        else if(offsetWord(num) == "}")
                        {
                            console.log("c", nest)
                            if(nest == 0)
                            {
                                break
                            }
                            else
                            {
                                nest--
                            }
                        }
                        num++
                    }

                    if(num >= line.length)
                    {
                        throwE("Lambda was not closed")
                    }

                    numStart += wordNum
                    num += wordNum

                    //line.slice(wordNum, num + 1) // whole thing including dec
                    // issue is that things are being evaluated inside the lmabda since they have parenthesis
                    throwE(line.slice(numStart, num))
                }
                */
                if (!nextIsForward) {
                    requestBracket = {
                        type: keywordTypes.FUNCTION,
                        data
                    }

                    actions.functions.createFunction(fname, isLambda)
                }
                nextIsForward = false

            } else if (word == "while") {
                outputCode.autoPush(
                    `# comparison for WHILE loop`,
                    `cmpb $1, ${offsetWord(2)}`,
                    `jne ${requestBracket.data.exit}` // jump out if not equal
                )
            } else if (word == "forEach") {
                var element = offsetWord(2)[0]
                var array = offsetWord(2)[2]

                var arrayType = helpers.types.guessType(array)
                var elementType = helpers.types.derefType(arrayType)

                if ("hasData" in arrayType) {
                    outputCode.autoPush(
                        `# forEach loop`,
                        `mov ${array}, %eax # load arr`,
                        `mov -4(%eax), %edx # get entry reference`,
                        `mov 8(%edx),  %edx # get size`
                    )
                }
                else {
                    throwE("forEach not implemented on static arrays yet")
                }

                var regA = helpers.types.formatRegister('a', elementType)
                var b = helpers.types.typeToBytes(elementType)

                if (b != 1) {
                    outputCode.autoPush(`shr \$${b / 2}, %edx # divide by ${b} (bytes to u32 or u16)`)
                }
                outputCode.autoPush(
                    `mov %edx, ${requestBracket.data.arrLength} # size to arr len holder`,
                    `mov (%eax), ${regA} # load first element into A`
                )

                //throwE(elementType)
                var elementVariable = actions.variables.create(element, elementType, regA)

                outputCode.autoPush( // todo, need to get len and see when done
                    `${requestBracket.data.name}:`,
                    `# comparison for forEach loop`,
                    `mov ${requestBracket.data.indexer}, %eax `,
                    `cmp ${requestBracket.data.arrLength}, %eax`,
                    `jge ${requestBracket.data.exit} # exit if finished`,
                )

                var out = actions.variables.readArray(array, requestBracket.data.indexer)
                outputCode.autoPush(
                    `mov ${out}, ${actions.assembly.getStackVarAsEbp(elementVariable)}`
                )
            } else if (word == "return" || word == "return_new") {
                debugPrint("closer", line, scope)
                var wrd = offsetWord(1)
                if (offsetWord(1) == "(") {
                    wrd = offsetWord(2)
                } else {
                    if (wrd == undefined) {
                        wrd = null
                    }
                    else {
                        wrd = evaluate([wrd])[0]
                        if (line.length != 2) {
                            throwE(`Place parenthesis around return statement [${line.join(" ")}]. like: return(stuff)`)
                        }
                    }
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
            else if (word == "publics") {
                inPublicMode = true;
            }
            else if (word == "privates") {
                inPublicMode = false;
            }
            else if (word == "root") {
                if (offsetWord(1) != "(") {
                    throwE(`root must be called like a function with parenthesis`)
                } else if (offsetWord(3) != ")") {
                    throwE(`root can only take one value`)
                }
                //throwE(offsetWord(2))

                var num = offsetWord(2)
                var type = helpers.types.guessType(num)

                if (helpers.types.isConstant(num) || helpers.types.stringIsRegister(num)) {
                    outputCode.autoPush(`movl ${(helpers.types.formatIfConstant(num))}, __xmm_sse_temp__`)
                    num = "__xmm_sse_temp__"
                }

                if (!type.float) {
                    outputCode.autoPush(`cvtsi2ss ${num}, %xmm2`)
                    num = "%xmm2"
                }

                //outputCode.autoPush(`${type.float? "movss" : "cvtsi2ss"} ${num}, %xmm2`)

                outputCode.autoPush(`sqrtss ${num}, %xmm1`)

                var lbl = helpers.variables.newTempLabel(defines.types.f32)
                outputCode.autoPush(`movss %xmm1, ${lbl}`)

                line[wordNum] = lbl
                line.splice(wordNum + 1, 3)
            }
        }
        // #endregion
        // #region Functions
        else if (offsetWord(1) == "(" && (objectIncludes(userFunctions, word) || objectIncludes(specialFunctions, word))) // function call
        {
            var fname = word
            var args = offsetWord(2)
            if (typeof (args) == "string") {
                if (args == ")")
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
                var stringMathOverride = false
                while (wordNum < line.length) {
                    word = line[wordNum]
                    if (onNum) {
                        if (defines.symbols.includes(word) || defines.operators.includes(word)) {
                            break;
                        }
                    }
                    else {
                        if (word != "+" && word != undefined) {
                            stringMathOverride = true
                        }
                    }
                    //console.log(line, word)
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

                var lbl = (stringMath && !stringMathOverride) ? stringAdder(build) : (floatMath ? floatEngine(build) : mathEngine(build))
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