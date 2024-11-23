var assembly = {
    convertReferenceToNormalIfIs: function (reference) {
        var rtype = helpers.types.guessType(reference, true)
        if (!("isReference" in rtype))
            return reference

        if ("unknown" in rtype) {
            throwE(`Unable to check type of ${reference}. Did you initialize the it?`)
        }

        var lbl = helpers.registers.getFreeLabelOrRegister(helpers.types.convertReferenceToNormal(rtype))
        outputCode.autoPush(`# Converting reference ${reference} to normal`)
        if (helpers.types.stringIsRegister(lbl)) {
            outputCode.autoPush(
                `mov ${reference}, %eax`,
                `mov (%eax), ${lbl}`
            )
        }
        else {
            outputCode.autoPush(
                `mov ${reference}, %eax`,
                `mov (%eax), %edx`,
                `mov ${helpers.types.formatRegister("d", rtype)}, ${lbl}`
            )

        }
        return lbl
    },
    disableGC: function () {
        if (GCisEnabled) {
            outputCode.autoPush("pushw __disable_gc__; movw $1, __disable_gc__")
            GCisEnabled = false
        }
    },
    restoreGCActive: function () {
        if (!GCisEnabled) {
            GCisEnabled = true
            outputCode.autoPush("popw __disable_gc__")
        }
    },
    setRegister: function (value, register, type, low = true) {
        debugPrint("setting", register, value, type)
        var r = helpers.types.formatRegister(register, type, low)
        var er = helpers.types.formatRegister(register, defines.types.u32)
        if (helpers.types.typeToBits(type) == 32) {
            helpers.registers.extendedTypes[register] = type
        } else {
            outputCode.autoPush(`xor ${er}, ${er}`)
        }

        outputCode.autoPush(`mov${objectIncludes(globalVariables, value) ? helpers.types.sizeToSuffix(type) : ""} ${helpers.types.formatIfConstOrLit(value)}, ${r}`)
        return r
    },
    allocateAndSet: function (value, type, low = true) {
        var reg = helpers.registers.getFreeLabelOrRegister(type)
        if (helpers.types.stringIsRegister(reg)) {
            return this.setRegister(value, helpers.registers.registerStringToLetterIfIs(reg), type, low)
        }
        else {
            //throwE(`moving ${value} => ${reg}`)
            assembly.optimizeMove(value, reg, helpers.types.guessType(value), type)
            return reg
        }
    },
    optimizeMove: function (source, destination, sType, dType) {
        outputCode.autoPush(`# optimized move from ${source} to ${destination}`)
        debugPrint(" reoifjeorjferiojerf", source)
        debugPrint(helpers.types.stringIsRegister(destination) && objectIncludes(globalVariables, source))
        debugPrint(source)
        if (helpers.types.isConstOrLit(source)) {
            if (helpers.types.isLiteral(source)) {
                if (helpers.types.stringIsRegister(destination)) {
                    if (helpers.types.typeToBits(sType) != 32)
                        throwE(`Cannot move string into '${destination}'. Type cannot hold 32 bits`)
                    outputCode.autoPush(`mov \$${source}, ${destination}`)
                } else {
                    outputCode.autoPush(
                        `mov \$${source}, %edx`,
                        `mov %edx, ${destination}`
                    )
                }

            } else {
                outputCode.autoPush(`mov${helpers.types.sizeToSuffix(dType)} \$${source}, ${destination}`)
            }
        } else if (helpers.types.stringIsRegister(source)) {
            outputCode.autoPush(`mov ${helpers.types.conformRegisterIfIs(source, dType)}, ${destination}`)
        } else {
            if (helpers.types.stringIsRegister(destination) && objectIncludes(globalVariables, source)) {
                var s = helpers.types.sizeToSuffix(sType)
                outputCode.autoPush(`mov${s} ${source}, ${destination}`)
            } else {
                if (helpers.types.typeToBits(sType) != 32)
                    outputCode.autoPush("xor %edx, %edx")
                this.setRegister(source, 'd', sType)
                outputCode.autoPush(`mov ${helpers.types.formatRegister('d', dType)}, ${destination}`)
            }
        }
    },
    pushToStack: function (value, type) {
        debugPrint(value, helpers.types.conformRegisterIfIs(value, defines.types.u32))
        if (type == undefined) {
            throwE("Unknown type of", value)
        }
        if (helpers.types.isConstant(value) || (objectIncludes(globalVariables, value) && type.pointer)) {
            outputCode.autoPush(`pushl \$${value}`)
        } else if (helpers.types.stringIsRegister(value) || helpers.types.stringIsEbpOffset(value)) {
            outputCode.autoPush(`push ${helpers.types.conformRegisterIfIs(value, defines.types.u32)}`)
        } else {
            this.setRegister(value, 'd', type)
            outputCode.autoPush(`push %edx`)
        }
    },
    getStackOffset: function (variable) {
        if (helpers.variables.checkIfOnStack(variable))
            return getAllStackVariables()[variable].offset
        return helpers.functions.getParameterOffset(variable)
    },
    getCaptureStackOffset: function (variable) {
        if (helpers.variables.checkIfOnCaptureStack(variable))
            return helpers.general.getMostRecentFunction()?.data?.capturedStackVars[variable].offset
        return helpers.functions.getCaptureParameterOffset(variable)
    },
    getStackVarAsEbp: function (vname) {
        //console.log("READING", vname, currentStackOffset)
        return `-${assembly.getStackOffset(vname)}(%ebp)`
    },
    getCapturedStackVarAsEcx: function (vname) {
        //console.log("READING", vname, currentStackOffset)
        return `-${assembly.getCaptureStackOffset(vname)}(%ecx)`
    },
    pushClobbers: function () {

        helpers.registers.clobberOrder.forEach(x => {
            if (helpers.registers.inLineClobbers[x] == 1) {
                //debugPrint("pushing", x)
                this.pushToStack(helpers.types.formatRegister(x, defines.types.u32), defines.types.u32)
                //outputCode.autoPush(`push ${helpers.types.formatRegister(x[0], defines.types.u32)}`)
            }
        })
    },
    popClobbers: function () {
        helpers.registers.clobberOrder.slice().reverse().forEach(x => {
            if (helpers.registers.inLineClobbers[x] == 1) {
                outputCode.autoPush(`pop ${helpers.types.formatRegister(x, defines.types.u32)}`)
            }
        })
    },
    pushMLclobbers: function () {
        helpers.registers.multiLineClobbers.forEach(x => {
            outputCode.autoPush(`push ${helpers.types.formatRegister(x, defines.types.u32)}`)
        })
    },
    popMLclobbers: function () {
        helpers.registers.multiLineClobbers.slice().reverse().forEach(x => {
            outputCode.autoPush(`pop ${helpers.types.formatRegister(x, defines.types.u32)}`)
        })
    },
    copyData: function (source) {

        var stype = helpers.types.guessType(source)

        var extension = helpers.types.sizeToSuffix(stype)

        if (helpers.registers.inLineClobbers['s'] != 0)
            outputCode.autoPush(`push %esi`)
        if (helpers.registers.inLineClobbers['i'] != 0)
            outputCode.autoPush(`push %edi`)
        if (helpers.registers.inLineClobbers['c'] != 0)
            outputCode.autoPush(`push %ecx`)

        // need to get size of source. if using hasData thats in the entry reference.
        //                             otherwise, the size has to be given
        //                             if it's a format then just count the size

        //throwE(stype)
        if ("hasData" in stype) {
            outputCode.autoPush(
                `# copying buffer`,
                `pushl ${source}`,
                `call __duplicate__`,
                `add $4, %esp\n`,
            )
        } else if ("formatPtr" in stype && stype.formatPtr != null) {
            var fmtSize = helpers.formats.getFormatSize(stype.formatPtr.properties)
            outputCode.autoPush(
                `# copying format`,
                `lea ${source}, %esi`,
                `mov ${alloced}, %edi`,
                `mov \$${fmtSize}, %ecx`,
                `rep movsb`
            )
        } else if ("advptr" in stype) {
            outputCode.autoPush(
                `# copying string`,
                `mov ${source}, %esi`,
                `mov -4(%esi), %ecx`,
                `push %ecx`,
                `call __rc_allocate__`,
                `pop %ecx`,
                `mov %eax, %edi`,
                `rep movsb`,
            )
        }

        else {
            throwE("Unable to copy reference that holds no data regarding it's size")
        }

        if (helpers.registers.inLineClobbers['c'] != 0)
            outputCode.autoPush(`pop %ecx`)
        if (helpers.registers.inLineClobbers['i'] != 0)
            outputCode.autoPush(`pop %edi`)
        if (helpers.registers.inLineClobbers['s'] != 0)
            outputCode.autoPush(`pop %esi`)



        helpers.registers.extendedTypes.a == objCopy(stype)

        var oreg = helpers.registers.getFreeLabelOrRegister(stype)
        outputCode.autoPush(
            `mov %eax, ${oreg}`
        )
        return oreg


        throwE(stype)
    },
    setMemAddr: function (address, addressTypeNoDeref, data) {
        var dataType = helpers.types.guessType(data)
        var addressType = helpers.types.derefType(addressTypeNoDeref)
        var suffix = ""
        var noPar = false

        outputCode.autoPush(`# Setting pointer ${data} -> ${address}`)

        var atypeBytes = helpers.types.typeToBytes(addressType)
        if (atypeBytes != 4 && !("isReference" in addressType)) {
            throwE(`Setting address is not 32bits, got ${helpers.types.convertTypeObjToName(addressType)} (${atypeBytes * 8})`)
        }

        if (helpers.types.stringIsRegister(address)) { // reg
            // address = address;
        }
        else if (helpers.types.isConstant(address)) { // const

            throwW("Setting constant memory address")
            outputCode.autoPush(
                `mov ${helpers.types.formatIfConstant(address)}, %eax`
            )
            address = "%eax"
        }
        else {                                          // anything else (ebp/esp offsets)
            // issue, if array, its just modifying the pointer instead of first addr ahhh

            // throwE(addressTypeNoDeref, addressType)
            if (!addressTypeNoDeref.pointer) {
                outputCode.autoPush(
                    `lea ${address}, %eax`
                )
            }
            else {
                outputCode.autoPush(
                    `mov ${address}, %eax`
                )
            }
            address = "%eax"
        }


        if ("hasData" in dataType) {
            if (!("hasData" in addressType)) {
                helpers.types.throwDynToStaticErr(dataType, addressType)
            }

            if (!(helpers.types.stringIsRegister(data))) {
                outputCode.autoPush(
                    `mov ${helpers.types.formatIfConstOrLit(data)}, %edx`
                )
                data = "%edx"
            }

            outputCode.autoPush(
                `# requesting ownership for ${address} (setting address as pointer)`,
                `push ${address}`,
                `push ${data}`,
                `call __rc_requestOwnership__`,
                `add $8, %esp`
            )

        }
        else if ("hasData" in addressType) {
            helpers.types.throwStaticToDynErr(dataType, addressType)
        }
        else {
            // TODO depending on datatype, movb, movw, movl
            if (helpers.types.stringIsMemoryReference(data)) {
                var dreg = helpers.types.formatRegister('d', dataType)
                outputCode.autoPush(`mov ${helpers.types.formatIfConstOrLit(data)}, ${dreg}`)
                data = dreg
            }

            var suffix = helpers.types.sizeToSuffix(dataType)

            outputCode.autoPush(
                `mov${suffix} ${helpers.types.formatIfConstOrLit(data)}, (${address})`
            )

        }

        outputCode.autoPush("\n")


    }
}

var variables = {
    create: function (vname, type, value, onStack = scope.length != 0) {
        if ("voided" in type) {
            throwE(`Cannot create void variable`)
        }
        var doNotInit = false
        if (value == null) {
            doNotInit = true
            value = "0"
        }

        __addToAnyVarEverMade(vname)
        if (helpers.types.isLiteral(value)) {
            outputCode.autoPush(
                `pushl \$${value}`,
                `call cptos`,
                `add $4, %esp`
            )
            value = "%eax"
            type = objCopy(defines.types.string)
        }

        if (value == "%eax") {
            value = helpers.registers.getFreeLabelOrRegister(type)
            outputCode.autoPush(`mov %eax, ${value}`)
        } else if (value == "%ax" || value == "%al" || value == "%ah") {
            var ov = value
            value = helpers.registers.getFreeLabelOrRegister(type)
            outputCode.autoPush(`mov ${ov}, ${value}`)
            //throwE("[INTERNAL ERROR] Cannot be taking eax. Add line here to clobber other reg and set")
        }

        if (helpers.general.isReserved(vname)) {
            throwE(`Cannot create variable named "${vname}" as it is a reserved word`)
        }
        if (onStack) // inside of a function
        {
            //console.log(vname, type, nextThingTakesOwnership)
            value = helpers.types.formatIfConstant(value)
            if (objectIncludes(getAllStackVariables(), vname)) {
                throwE(`Variable "${vname}" already defined`)
            }
            var off = allocations.allocateStack(helpers.types.typeToBytes(type), true, true) // store in stack
            //throwE(value, off)
            outputCode.autoPush(`# Loading local variable "${vname}" @${off}`)

            //console.log(value,defines.types)
            assembly.optimizeMove(value, off, type, type)

            //console.log("::", doNotInit)
            //console.log(scope, vname)
            if ("hasData" in type && !doNotInit) {

                if (nextThingTakesOwnership) {
                    outputCode.autoPush(
                        `# requesting ownership for ${vname} (create)`,
                        `lea ${off}, %eax`,
                        `push %eax`,
                        `push ${value}`,
                        `call __rc_requestOwnership__`,
                        `add $8, %esp`
                    )
                } else {
                    type = objCopy(type)
                    delete type.hasData
                    //throwE(type)
                }
            }
            nextThingTakesOwnership = defaultAutomaticOwnership
            createStackVariableListOnly(vname, newStackVar(vname, type))
            //throwE(stackVariables)
        } else { // outside of function, global variable

            //throwE("No ownership for globs yet")
            if (objectIncludes(globalVariables, vname)) {
                throwE(`Variable "${vname}" already defined`)
            }
            globalVariables[vname] = newGlobalVar(type)

            if (helpers.types.isConstant(value)) {
                outputCode.data.push(
                    `${vname}: ${helpers.types.typeToAsm(type)} ${value}`
                )
            } else {
                outputCode.data.push(
                    `${vname}: ${helpers.types.typeToAsm(type)} 0`
                )
                if (helpers.types.stringIsRegister(value)) {
                    outputCode.autoPush(`mov ${helpers.types.conformRegisterIfIs(value, type)}, ${vname}`)
                } else {
                    assembly.setRegister(value, 'd', type)
                    outputCode.autoPush(`mov ${helpers.types.formatRegister('d', type)}, ${vname}`)
                }

            }

            // if ("hasData" in type && nextThingTakesOwnership && !doNotInit) {
            //     outputCode.autoPush(
            //         `# requesting ownership for ${vname} (create)`,
            //         `push \$${vname}`,
            //         `push ${value}`,
            //         `call __rc_requestOwnership__`,
            //         `add $8, %esp`
            //     )

            // }
            nextThingTakesOwnership = defaultAutomaticOwnership

        }

        //throwW("@@@", vname, type)
        return vname
    },
    set: function (vname, value) {

        if (vname == "__this__") {
            helpers.general.setModifiesThis()
        }
        var isStack = helpers.variables.checkIfOnStack(vname) || helpers.variables.checkIfParameter(vname) || helpers.variables.checkIfOnCaptureStack(vname)// ) // if stack var

        var type = helpers.variables.getVariableType(vname, true)

        // throwW("::", vname, getAllStackVariables())
        var valueType = helpers.types.guessType(value);

        if ("unknown" in type) {
            type = valueType
        }

        if (!helpers.types.areEqual(valueType, type) && vname != "___TEMPORARY_OWNER___" && vname != "__this__") {

            // make sure its not just that value is dynamic and variable is not
            var checkT = helpers.types.convertTypeToHasData(type)
            //var checkT = helpers.types.convertTypeToHasData(type)
            //console.log("\n-----",checkT,valueType,"------\n", ":::::", nextThingTakesOwnership, ":::::")
            if (!((helpers.types.areEqual(checkT, valueType)) && !nextThingTakesOwnership)) {

                if (helpers.types.isStringOrConststrType(valueType) && helpers.types.isStringOrConststrType(type)) // if conststr
                {
                    var lbl = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
                    outputCode.autoPush(
                        `# converting conststr to string (variable assignation)`,
                        `pushl ${helpers.types.formatIfConstOrLit(value)}`,
                        `call cptos`,
                        `mov %eax, ${lbl}`,
                        `add $4, %esp`
                    )
                    value = lbl
                    valueType = objCopy(defines.types.string)
                }
                else {

                    if (helpers.types.areEqual(checkT, valueType)) {
                        throwE(`Assigning a dynamic "${helpers.types.convertTypeObjToName(type)}" to a static.\n\t[FIX] Use "borrow"`)
                    }

                    throwW(`Retyping variable ${vname} from "${helpers.types.convertTypeObjToName(type)}" to "${helpers.types.convertTypeObjToName(valueType)}"`)
                    //throwW(type.pointer, valueType.pointer)
                    var bn = helpers.types.typeToBytes(valueType)
                    var bo = helpers.types.typeToBytes(type)
                    if (bn < bo) {
                        //throwE(valueType, type)
                        throwW(`-- New type is smaller than original type: ${bn}-byte < ${bo}-byte`)
                    }
                    type = valueType
                    helpers.variables.setVariableType(vname, type)
                    //throwE(defines.types.u32)
                }
            }

        }

        // if (isStack) {
        //     assembly.optimizeMove(value, assembly.getStackVarAsEbp(vname), type, type)
        // } else if (objectIncludes(globalVariables, vname)) {       // if glob var
        //     assembly.optimizeMove(value, vname, type, type)
        //     //outputCode.autoPush(`mov${suffix} ${value}, ${vname}`)
        // } else {
        //     throwE(`Variable ${vname} has not been declared neither locally nor globally`)
        // }

        var correctAddressing = vname
        if (isStack) {
            if (helpers.variables.checkIfOnCaptureStack(vname)) {
                correctAddressing = assembly.getCapturedStackVarAsEcx(vname)
            }
            else {
                correctAddressing = assembly.getStackVarAsEbp(vname)
            }
        }

        if (helpers.variables.checkIfParameter(vname))
            correctAddressing = (helpers.functions.getParameterOffset(vname) + 8) + "(%ebp)"

        if (("hasData" in type) || (vname == "___TEMPORARY_OWNER___")) {
            if (nextThingTakesOwnership || (vname == "___TEMPORARY_OWNER___")) {
                outputCode.autoPush(
                    `# requesting ownership for ${vname} (set). ${("isReference" in type) ? "Note, using MOV since reference" : ""}`,
                    `${("isReference" in type) ? "mov" : "lea"} ${correctAddressing}, %eax`,
                    `push %eax`,
                    `push ${value}`,
                    `call __rc_requestOwnership__`,
                    `add $8, %esp`
                )
            } else {
                type = objCopy(type)
                delete type.hasData

                if (isStack) {
                    assembly.optimizeMove(value, correctAddressing, type, type)
                } else if (objectIncludes(globalVariables, vname)) {       // if glob var
                    assembly.optimizeMove(value, vname, type, type)
                    //outputCode.autoPush(`mov${suffix} ${value}, ${vname}`)
                } else {
                    throwE(`Variable ${vname} has not been declared neither locally nor globally`)
                }
                //throwE(type)
            }
        } else {
            if ("isReference" in type) {
                var tdupe = objCopy(type)
                tdupe.pointer = true
                actions.assembly.setMemAddr(correctAddressing, tdupe, value)
            }
            else {
                if (isStack) {
                    assembly.optimizeMove(value, correctAddressing, type, type)
                } else if (objectIncludes(globalVariables, vname)) {       // if glob var
                    assembly.optimizeMove(value, vname, type, type)
                    //outputCode.autoPush(`mov${suffix} ${value}, ${vname}`)
                } else {
                    throwE(`Variable ${vname} has not been declared neither locally nor globally`)
                }
            }
        }
        nextThingTakesOwnership = defaultAutomaticOwnership
        return vname
    },
    attemptStackCreateIfNotSet: function (vname, type, value) {
        if (objectIncludes(getAllStackVariables(), vname)) {
            this.set(vname, value)
        } else {
            this.create(vname, type, value)
        }
    },
    read: function (vname) {
        var isStack = helpers.variables.checkIfOnStack(vname) // ) // if stack var
        debugPrint("READING", vname)
        if (isStack) {
            var type = getAllStackVariables()[vname].type
            var dReg = helpers.types.formatRegister('d', type)
            var output = helpers.registers.getFreeLabelOrRegister(type)


            // mov stack var into edx, then into allocated label or register
            //edx cannot be used to store things since it is used for other stuff in the compiler

            assembly.setRegister(`-${assembly.getStackOffset(vname)}(%ebp)`, 'd', type)
            outputCode.autoPush(`mov ${dReg}, ${output}`)
            return output
        }
        return vname
    },
    readArray: function (aname, index, forceSize = false) {

        var aType = helpers.types.guessType(aname)

        var indexTypeGuess = helpers.types.guessType(index)

        //console.log("----- EEEEEEE", helpers.formats.seeIfIncludesOperator(aType, "index_get", indexTypeGuess))

        if ("formatPtr" in aType && helpers.formats.seeIfIncludesOperator(aType, "index_get", indexTypeGuess)) {
            return formats.callOperator(aname, "index_get", index)
        }

        var baseRegister = "%eax"
        var baseType = -1;

        // yes bad code that I was doing something else with but changed it

        debugPrint(index)

        outputCode.autoPush(`#indexing array`)

        if (helpers.types.isLiteral(aname)) {
            baseType = objCopy(defines.types.u8)
            outputCode.autoPush(
                `mov \$${aname}, %eax`,
            )
        }
        else if (helpers.variables.variableExists(aname)) {
            baseType = objCopy(helpers.variables.getVariableType(aname))
            //baseType.pointer = false

            baseRegister = helpers.types.formatRegister("a", baseType)
            debugPrint("EXISTSSS", aname, baseType)
            outputCode.autoPush(
                `mov ${aname}, %eax`,
            )
            // if (helpers.types.stringIsEbpOffset(aname)) {
            //     status = stypes.LOC
            // } else {
            //     status = stypes.GLOB
            // }
        } else if (helpers.variables.checkIfParameter(aname)) {
            // status = stypes.PAR
            // baseType = helpers.functions.getParameterType(aname)
            // outputCode.autoPush(
            //     `mov %ebp, %eax`,
            //     `mov ${(helpers.functions.getParameterOffset(aname) + 8) + "(%ebp)"}, %eax`
            // )
            throwE("shouldn't get here....")
        } else if (helpers.types.stringIsEbpOffset(aname)) {
            baseType = objCopy(helpers.types.getVariableFromEbpOffsetString(aname).type)
            //baseType.pointer = false

            baseRegister = helpers.types.formatRegister("a", baseType)
            outputCode.autoPush(
                `mov ${aname}, %eax`,
            )
        } else if (helpers.types.stringIsEsp(aname)) {
            outputCode.autoPush(
                `mov %esp, %eax`,
            )
        }
        else if (helpers.types.stringIsRegister(aname)) {
            baseType = objCopy(helpers.types.getRegisterType(aname))
            //baseType.pointer = false

            baseRegister = helpers.types.formatRegister("a", baseType)
            outputCode.autoPush(
                `mov ${aname}, ${baseRegister}`,
            )
        }
        else {
            throwE(`Cannot access array "${aname}"`)
        }
        if (baseType == -1) {
            throwE("Compiler error, never set 'baseType' variable")
        }

        var itemType = helpers.types.derefType(baseType)

        var indexMultiplier;
        if ("formatPtr" in itemType) {
            indexMultiplier = 4
        } else if (forceSize === false) {
            indexMultiplier = helpers.types.typeToBytes(itemType)
        } else {
            indexMultiplier = forceSize
        }

        //throwE("formatPtr" in itemType)

        // TODO SHOULDNT THIS BE REMOVED???? - idk just leave it
        // if (!(helpers.types.checkIfElementsHaveData(baseType))) {
        //     throwE("rbus")
        //     delete baseType.hasData
        // } else {
        //     throwE("bru", baseType)
        //     delete baseType.elementsHaveData // HERE if broken September Sep 26 2024 delete
        //     //throwE("yay, this should have been thrown if the array type has data itself. you can delete this line")
        // }

        //console.log(aname, index, baseType)


        var out = helpers.registers.getFreeLabelOrRegister(itemType)

        //console.log(itemType)
        //throwE(helpers.types.guessType(out))

        var fullReg = helpers.types.conformRegisterIfIs(out, defines.types.u32)

        if (baseType.size != 32) {
            if (helpers.types.stringIsRegister(out))
                outputCode.autoPush(`xor ${fullReg}, ${fullReg}`)
            else
                outputCode.autoPush(`movw $0, ${fullReg}`)
        }
        var ogout = out
        var edxReserved = false
        if (!helpers.types.stringIsRegister(out)) {
            var edxReserved = true
            out = helpers.types.formatRegister('d', itemType)
        }

        debugPrint("$$$", index)
        if (helpers.types.isConstant(index)) {
            outputCode.autoPush(
                `mov ${parseInt(index) * indexMultiplier}(%eax), ${out}`
            )
        } else if (helpers.types.stringIsRegister(index)) {
            index = helpers.types.conformRegisterIfIs(index, defines.types.u32)
            outputCode.autoPush(
                `mov (%eax, ${index}, ${indexMultiplier}), ${out}`
            )
        } else if (helpers.types.stringIsEbpOffset(index)) {
            if (edxReserved) {
                //throwE("unimplemented", aname, index)
                //var t = helpers.variables.newTempLabel(baseType)
                //throwE(index, indexMultiplier, baseType, aname, helpers.types.guessType(aname))
                outputCode.autoPush(
                    `# TEST DOES THIS WORK??? (1)`,
                    `mov ${index}, %edx`,
                    `mov (%eax, %edx, ${indexMultiplier}), %edx`,
                    `# END TEST`
                )
                // have to use normal math since edx and eax are occupied and cannot be modified
            } else {
                actions.assembly.optimizeMove(index, "%edx", helpers.types.getVariableFromEbpOffsetString(index).type, defines.types.u32)
                outputCode.autoPush(
                    `mov (%eax, %edx, ${indexMultiplier}), ${out}`
                )
                //throwE(baseType)
            }
        } else {
            if (edxReserved) {
                //throwE("unimplemented")
                outputCode.autoPush(
                    `# TEST DOES THIS WORK??? (2)`,
                    `mov ${index}, %edx`,
                    `mov (%eax, %edx, ${indexMultiplier}), %edx`,
                    `# END TEST`
                )
                // have to use normal math since edx and eax are occupied and cannot be modified
            } else {
                actions.assembly.optimizeMove(index, "%edx", helpers.variables.getVariableType(index), defines.types.u32)
                outputCode.autoPush(
                    `mov (%eax, %edx, ${indexMultiplier}), ${out}`
                )
                //throwE(baseType)
            }
        }

        // type = deref
        helpers.registers.extendedTypes[helpers.registers.registerStringToLetterIfIs(out)] = itemType

        if (edxReserved) {
            outputCode.autoPush(
                `mov %edx, ${ogout}`
            )
            return ogout
        }

        return out
    },
    readAddress: function (name) {
        var reg = helpers.registers.getFreeLabelOrRegister(defines.types.p32)
        outputCode.autoPush(
            `lea ${name}, ${reg}`
        )
        // if (helpers.variables.checkIfOnStack(name)) { // if local
        //     var addr = helpers.variables.getStackVarOffset(name)
        //     outputCode.text.push(
        //         `mov %esp, ${reg}`,
        //         `sub \$${addr}, ${reg}`
        //     )
        // } else if (helpers.types.stringIsEbpOffset(name)) {
        //     var off = helpers.types.getOffsetFromEbpOffsetString(name)
        //     throwE("unfinished")
        // } else if (helpers.variables.checkIfParameter(name)) {
        //     throwE("unfinished")
        // } else {
        //     outputCode.text.push(
        //         `mov \$${name}, ${reg}`
        //     )
        // }
        return reg
    },
    loadArrayIndex: function (address, index, value) {
        // var indexAsReg = "%edx"
        // if(!helpers.types.stringIsRegister(index)) {
        // actions.assembly.setRegister(index, "d", helpers.types.guessType(index))
        // }


        //for now
        var index = index[0]

        var arrType = helpers.types.guessType(address)
        //console.log("----", address, arrType)
        var elementType = helpers.types.derefType(arrType)
        var elementBytes = helpers.types.typeToBytes(elementType)
        var indexType = helpers.types.guessType(index)
        var valueType = helpers.types.guessType(value)

        //console.log(arrType.formatPtr?.operators)
        if ("formatPtr" in arrType && helpers.formats.seeIfIncludesOperator(arrType, "index_set", indexType)) {
            //throwE(address, index, value, globalLineConts)
            return actions.formats.callOperator(address, "index_set", [index, ",", value])
            //throwE(arrType.formatPtr.operators)
        }

        if (("hasData" in valueType || helpers.types.checkIfElementsHaveData(arrType)) && nextThingTakesOwnership) {
            if (!helpers.types.checkIfElementsHaveData(arrType)) {
                throwE(valueType, arrType, elementType)
                throwE(`Assigning "${helpers.types.convertTypeObjToName(valueType)}" to an array expecting static "${helpers.types.convertTypeObjToName(arrType)}"`)
            } else if (!("hasData" in valueType)) {
                if (helpers.types.isStringOrConststrType(valueType) && helpers.types.isStringOrConststrType(arrType)) // if conststr
                {
                    throwW(`Autocasting conststr "${value}" to string`)
                    var lbl = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
                    outputCode.autoPush(
                        `# converting conststr to string`,
                        `pushl ${helpers.types.formatIfConstOrLit(value)}`,
                        `call cptos`,
                        `mov %eax, ${lbl}`,
                        `add $4, %esp`
                    )
                    value = lbl
                    valueType = objCopy(defines.types.string)
                } else {
                    throwE(`Assigning static "${helpers.types.convertTypeObjToName(valueType)}" to array expecting a "${helpers.types.convertTypeObjToName(arrType)}"`)
                }
            }
        }

        var indexIsVar = objectIncludes(globalVariables, index)

        var suffix = "";

        outputCode.autoPush("#Array set begin")
        //throwE(address, index, value)

        if (!helpers.types.stringIsRegister(address)) {
            outputCode.autoPush(`mov ${helpers.types.formatIfConstant(address)}, %eax`)
            address = "%eax"
        }

        // two step

        //console.log(address, index, value)
        var finalSettingAddr = null

        if (!(helpers.types.isConstant(value) || helpers.types.stringIsRegister(value))) {
            outputCode.autoPush(`mov ${value}, %edx`)
            value = "%edx"
        } else if (helpers.types.isConstant(value)) {
            value = "$" + value
            suffix = helpers.types.sizeToSuffix(elementType);
        }

        if (helpers.types.isConstant(index)) {
            var ti = parseInt(index) * elementBytes
            finalSettingAddr = `${ti}(${address})`
            outputCode.autoPush(
                `mov${suffix} ${value}, ${ti}(${address})`
            )
        } else if (helpers.types.stringIsRegister(index)) {
            finalSettingAddr = `(${address}, ${index}, ${elementBytes})`
            //console.log("~~~~~~~~~", address, index, value)
            outputCode.autoPush(
                `mov${suffix} ${value}, (${address}, ${index}, ${elementBytes}) # mhm`
            )
        } else if (objectIncludes(globalVariables, index) || helpers.types.stringIsEbpOffset(index)) { // if index is glob or index is ebp
            // FIX THIS poorly optimized
            // throwE("Not sure. fix the code below this")
            if (helpers.types.typeToBits(helpers.types.guessType(index)) != 32) {
                // just use size to suffix. FIX later
                throwE("Attempting to index array with non-32bit variable")
            }

            // outputCode.autoPush(
            //     `# array load trash awful. Fix this bad optimize`,
            //     `lea (%eax, ${index}, ${helpers.types.typeToBytes(elementType)}), %eax`,
            //     `mov${suffix} ${value}, (%eax)`
            // )
            outputCode.autoPush(
                `# array load trash awful. Fix this bad optimize`,
                `push ${address}`,
                `mov ${index}, %eax`,
                `${(elementBytes != 1) ? `shl \$${helpers.types.typeToBytes(elementType) / 2}, %eax` : ""}`,
                `add (%esp), %eax`,
                `add $4, %esp`,
                `mov${suffix} ${value}, (%eax)`
            )
            finalSettingAddr = "%eax"
        }

        // console.log(helpers.types.guessType(type.address))
        if (("hasData" in valueType || helpers.types.checkIfElementsHaveData(arrType)) && nextThingTakesOwnership) {

            if (finalSettingAddr == null) {
                throwE(`Undecipherable index "${index}". Is it defined?`)
            }

            outputCode.autoPush("# requesting ownership for array index")
            if (finalSettingAddr != "%eax") {
                outputCode.autoPush(`lea ${finalSettingAddr}, %eax`)
            }
            outputCode.autoPush(
                `push %eax`,
                `push ${value}`,
                `call __rc_requestOwnership__`,
                `add $8, %esp`
            )
        }
        nextThingTakesOwnership = defaultAutomaticOwnership


        outputCode.autoPush("#Set end")

        // if (helpers.types.stringIsEbpOffset(address)) {
        //     var baseEbpOffset = helpers.types.getOffsetFromEbpOffsetStringNoAbs(address)
        //     if (helpers.types.isConstant(index)) {
        //         var newIndex = baseEbpOffset + parseInt(index)
        //         assembly.optimizeMove(value, `${newIndex}(%ebp)`, valueType, elementType)
        //     } else {
        //         outputCode.autoPush(
        //             `mov${indexIsVar? helpers.types.sizeToSuffix(indexType) : ""} ${index}, ${helpers.types.formatRegister("a", indexType)}`,
        //             `${(helpers.types.typeToBytes(elementType) != 1) ? `shl \$${helpers.types.typeToBytes(elementType) / 2}, %eax` : ""}`,
        //             `add %ebp, %eax`,
        //             `add \$${baseEbpOffset}, %eax`,
        //         )
        //         assembly.optimizeMove(value, "(%eax)", valueType, elementType)
        //     }
        // }// else if ()


        //throwE("wip unfinished", outputCode)
        return [address]

    }
}

var allocations = {
    allocateStack: function (bytes, forceEbp = false, forceNoSize = false, note = "") {
        if (helpers.general.scopeHasIterable() && !forceEbp) {
            debugPrint("ALLOCING - DR", bytes, currentStackOffset)
            if (programRules.DynamicArraysAllocateSize && !forceNoSize) {
                outputCode.autoPush(
                    `# Allocating ${bytes} bytes + 1 extra for size ${note.length != 0 ? "\n#" + note : ""}`,
                    `sub \$${bytes + 4}, %esp`,
                    `movl \$${bytes}, (%esp)`,
                    `add \$4, %esp`
                )
            } else {
                outputCode.autoPush(
                    `sub \$${bytes}, %esp`,
                )
            }
            return `%esp`
        } else {
            //throwE(bytes)

            var mrf = helpers.general.getMostRecentFunction()
            if (mrf == undefined) {
                throwE("Requesting operation that can only be completed inside of a function")
            }

            debugPrint("ALLOCING", bytes, currentStackOffset)
            if (programRules.DynamicArraysAllocateSize && !forceNoSize) {
                currentStackOffset = (mrf.data.totalAlloc += (bytes + 4))
                outputCode.autoPush(
                    `${note.length != 0 ? "#" + note + "\n" : ""}movl \$${bytes}, -${currentStackOffset}(%ebp) # Allocated in __ALLOC_FOR__, setting extra byte for size`
                )
                return `-${currentStackOffset - 4}(%ebp)`
            } else {
                //console.log(helpers.general.getMostRecentFunction())
                currentStackOffset = (mrf.data.totalAlloc += bytes)
                return `-${currentStackOffset}(%ebp)`
            }
        }
        // var lbl = helpers.variables.newTempLabel(defines.types.p32)
        // createStackVariableListOnly(lbl, newStackVar(defines.types.p32)) //not actually for use, just for knowing the offset
        // currentStackOffset += bytes
        //return lbl
    },
    allocateMmapNoRC: function (bytes, note = "") {
        assembly.pushClobbers()

        assembly.pushToStack(bytes, defines.types.u32)
        outputCode.autoPush(
            `call ${programRules.DynamicArraysAllocateSize ? "__allocate_wsize__" : "__allocate__"} ${note.length != 0 ? "#" + note : ""}`,
            `add $4, %esp`
        )
        assembly.popClobbers()

        programRules.hasUsedMmap = true

        return "%eax"
    },
    allocateMmap: function (bytes, note = "", restricted = 0) {
        //debugPrint("PUSHING")
        assembly.pushClobbers()
        //allocationOnLine = true
        outputCode.autoPush(`# ${note}`)
        outputCode.autoPush(`pushl \$${restricted}`)
        assembly.pushToStack(bytes, defines.types.u32)
        outputCode.autoPush(
            `call __rc_allocate__`,
            `add $8, %esp`
        )
        // outputCode.autoPush(
        //     `call ${programRules.DynamicArraysAllocateSize ? "__allocate_wsize__" : "__allocate__"} ${note.length != 0 ? "#" + note : ""}`,
        //     `add $4, %esp`
        // )
        assembly.popClobbers()

        programRules.hasUsedMmap = true
        helpers.registers.extendedTypes.a = objCopy(defines.types.u32)
        helpers.registers.extendedTypes.a.hasData = true

        return "%eax"
    },
    allocateData: function (bytes, note = "") {
        var lbl = helpers.variables.newUntypedLabel()
        if (programRules.StaticArraysAllocateSize) {
            outputCode.data.push(`.4byte ${bytes} # Extra size allocation, manually enabled by StaticArraysAllocateSize = true`)
        }
        outputCode.data.push(`.comm ${lbl}, ${bytes} ${note.length != 0 ? "#" + note : ""}`);
        outputCode.autoPush(`mov \$${lbl}, %eax`)
        return "%eax"
    },
    allocateAuto: function (bytes, forceEbpIfStack = false, note = "") {
        bytes = parseInt(bytes) // just in case
        //throwE(nextAllocIsPersistent)
        //if (bytes >= 4096 || currentStackOffset > 1e6 || scope.length == 0 || nextAllocIsPersistent) {
        if ((nextAllocIsTransient || programRules.defaultTransience) && !nextAllocIsPersistent) {
            nextAllocIsTransient = false;
            return this.allocateStack(bytes, forceEbpIfStack, false, note)
        } else {
            if (scope.length == 0) {
                return this.allocateData(bytes, note)
            } else {
                //throwE("mmap")
                nextAllocIsPersistent = false;
                return this.allocateMmap(bytes, note)
            }
        }
    },
    newStringLiteral: function (value) {

        //if string already exists
        if (objectIncludes(allStringLiterals, value)) // "string" : "__STRING123__"
        {
            return allStringLiterals[value]
        }

        var label = helpers.formatters.stringLiteral(helpers.counters.stringLiterals++)
        outputCode.data.push(
            `.4byte ${value.length + 1}`,
            `${label}: .asciz "${value}"`
        )
        allStringLiterals[value] = label
        globalVariables[label] = newGlobalVar(defines.types.conststr)
        return label
    },
    allocateArray: function (arr, note = "") {
        // IF ERROR HERE BUG ISSUE CRASH REMOVE REMOVE NEXT UNCOMMENTED LINE AND UNCOMMENT NEXT LINE
        //arr = arr.slice(1, arr.length - 1)
        arr = arr.slice(1, arr.indexOf("}"))

        arrayClamp = objCopy(arrayClamp)
        var elementSize = helpers.types.typeToBytes(arrayClamp)
        var oldAllocLabel = allocations.allocateAuto(arr.filter(x => x != ",").length * elementSize, false, note)
        var allocLbl = helpers.registers.getFreeLabelOrRegister(defines.types.dyna)
        outputCode.autoPush(`mov ${oldAllocLabel}, ${allocLbl}`)

        //throwE(helpers.types.guessType(allocLbl))
        if ("hasData" in arrayClamp) {
            arrayClamp.elementsHaveData = true
        }
        if ("hasData" in helpers.types.guessType(allocLbl)) {
            arrayClamp.hasData = true
        }

        var ebpOff;

        var globalAlloc = true
        if (helpers.types.stringIsEbpOffset(allocLbl)) {
            globalAlloc = false
            ebpOff = parseInt(helpers.types.getOffsetFromEbpOffsetString(allocLbl))
        }

        //throwE(allocLbl)

        var onComma = false
        var index = 0

        var allElementTypes = []
        arr.every((x) => {
            if (onComma) {
                if (x != ",") {
                    throwE(`Expected comma in array allocation: [${arr.join(",")}]`)
                }
            } else {
                var elementType = helpers.types.guessType(x)
                if(helpers.types.isConststrType(elementType))
                {
                    // outputCode.autoPush(
                    //     `# cptos string array`,
                    //     `pushl ${helpers.types.formatIfConstOrLit(x)}`,
                    //     `call cptos`,
                    //     `add $4, %esp`
                    // )
                    // x = "%eax"
                    // elementType = defines.types.string
                    allElementTypes.push(defines.types.string)
                    var a = arr.filter(x => x != ",")
                    a.forEach(x => {
                        outputCode.autoPush(`pushl \$${x}`)
                        if(!helpers.types.isConststrType(helpers.types.guessType(x)))
                        {
                            throwE("String arrays can only contain strings")
                        }
                    })

                    outputCode.autoPush(
                        `pushl \$${a.length}`,
                        `pushl ${allocLbl}`,
                        `call __sinc_loadStringArray`,
                        `add \$${a.length * 4 + 8}, %esp`
                    )
                    return false
                    

                }
                allElementTypes.push(elementType)

                //console.log(x, " :: ", helpers.types.convertTypeObjToName(elementType))
                //debugPrint("reregwegereerwrege", elementSize, index)
                if (x == ",") {
                    throwE(`Did not expect comma in array allocation: [${arr.join(",")}]`)
                }

                var dest;

                if (globalAlloc) {
                    dest = `${index * elementSize}(${allocLbl})`
                } else {
                    dest = `-${ebpOff - (index * elementSize)}(%ebp)`
                }

                if ("hasData" in elementType && nextThingTakesOwnership) {
                    outputCode.autoPush(
                        `# requesting ownership (setting array index on init)`,
                        `lea ${dest}, %edx`,
                        `push %edx`,
                        `pushl ${x}`,
                        `call __rc_requestOwnership__`,
                        `add $8, %esp`)
                }
                else {
                    assembly.optimizeMove(x, dest, elementType, arrayClamp)
                }
                index++
            }
            onComma = !onComma
            return true
        })

        var allSame = true
        //console.log(allElementTypes.map(x => "#### " + helpers.types.convertTypeObjToName(x)))
        allElementTypes.forEach((x, i) => {
            var next = allElementTypes[i + 1]
            if (next == undefined || !allSame)
                return
            if (!(helpers.types.areEqual(x, next))) {

                throwE(`Multiple types in an array is undefined behavior (for now).\nExpected "${helpers.types.convertTypeObjToName(x)}" but got "${helpers.types.convertTypeObjToName(next)}" when creating {${arr.join("")}}`)
                allSame = false
            }
        })


        var ref = objCopy(arrayClamp)
        ref.pointer = true;
        ref.arrayElements = allElementTypes[0]

        var out = helpers.registers.getFreeLabelOrRegister(ref)
        if (globalAlloc) {
            outputCode.autoPush(
                `mov ${allocLbl}, ${out}`
            )
        } else {
            outputCode.autoPush(
                `lea -${ebpOff}(%ebp), ${out} # load array base into variable`
            )
            // outputCode.autoPush(
            //     `mov %ebp, %eax`,
            //     `sub \$${ebpOff}, %eax`,
            //     `mov %eax, ${out}`
            // )
        }

        //console.log(ref)
        return { out, len: arr.length, arrayType: ref }
    }
    // deallocStack: function () {
    //     outputCode.autoPush(`add \$${Object.entries(stackVariables[stackVariables.length - 1]).length}, %esp`)
    // }
}

var functions = {
    createParams: function (parr) {
        var onCom = false
        var robj = []
        var oBytes = 0;
        var didVari = false

        //console.log("\n---------\n", parr, "\n---------\n")
        parr.reverse().forEach(x => {
            if (onCom) {
                // if (didVari)
                //     throwE("Cannot have parameters declared after variadic ellipsis")
                if (x != ',')
                    throwE(`Expected comma at word "${x}" in ${parr}`)
            } else if (x == "...") {
                didVari = true
            } else {
                var type = popTypeStack(true)
                __addToAnyVarEverMade(x)
                //console.log(x)
                robj.push({ name: x, type })
                oBytes += helpers.types.typeToBytes(type)
            }
            onCom = !onCom
        })
        return { params: robj.reverse(), oBytes, didVari }
    },
    createFunction: function (fname, isLambda = false) {

        nextIsForward = false
        if (helpers.general.isReserved(fname)) {
            throwE(`Cannot create function "${fname}" as it is a reserved word`)
        }
        outputCode.data.push(
            `.type	${fname}, @function`,
            `.global ${fname}`
        )
        outputCode.text.push(
            fname + ":",
        )

        if (isLambda) {
            helpers.registers.multiLineClobberRegister('c')
            outputCode.text.push(
                `mov ${fname}ebpCapture__, %ecx`
            )
        }

        outputCode.text.push(
            `push %ebp`,
            `mov %esp, %ebp`,
            `sub \$${helpers.formatters.fnAllocMacro(fname)}, %esp # total stack allocation`,
            `${userFunctions[fname].saveRegs ? "pusha" : ""}`,

        )

    },
    closeFunction: function (scope, stack, asRet = false, rVal = null, forceOwnNew = false) {
        var d = scope
        debugPrint(scope)
        if ("data" in d)
            d = d.data
        debugPrint("SC", scope, rVal)

        // if (forceOwnNew) {
        //     outputCode.autoPush("# Returning new allocation")
        //     if (("returnType" in d) && (rVal != null) && (helpers.types.guessType(rVal).hasData == true) && forceOwnNew) {
        //         variables.set("___TEMPORARY_OWNER___", rVal)
        //     } else {
        //         throwE(`"return_new ${rVal}" doesn't return any allocated data. Use "return"`)
        //     }
        // }

        if (rVal != null) {

            if (!("name" in scope && scope.name.includes("__constructor_"))) {
                // TODO HERE
                var givenRetType = helpers.types.guessType(rVal)
                var scopeRetType = scope.data.returnType

                if ("unknown" in scopeRetType) {
                    if (helpers.types.isStringOrConststrType(givenRetType) && !("hasData" in givenRetType)) {
                        outputCode.autoPush(
                            `# char lit to string (return)`,
                            `pushl ${helpers.types.formatIfConstOrLit(rVal)}`,
                            `call cptos`,
                            `add $4, %esp`,
                        )
                    }
                    rVal = "%eax"
                    helpers.registers.extendedTypes["a"] = defines.types.string
                    scopeRetType = givenRetType
                    userFunctions[scope.data.name].returnType = givenRetType
                }

                if ((helpers.types.guessType(rVal).hasData == true)) {
                    actions.assembly.optimizeMove(rVal, "__gc_dontClear__", givenRetType, defines.types.p32)
                }

                if (scopeRetType == undefined) {
                    throwE(`No given return type in function "${scope.data.name}"`)
                }

                if ("voided" in scopeRetType) {
                    throwE(`Cannot return data in function that returns nothing`)
                }

                if (rVal == "null") {
                    rVal = "0"
                }
                else if (!helpers.types.areEqual(givenRetType, scopeRetType)) {
                    var gtname = helpers.types.convertTypeObjToName(givenRetType)
                    //console.log(givenRetType)
                    if (!("unknown" in scopeRetType)) {
                        throwW(`Return type "${gtname}" does not match expected return type "${helpers.types.convertTypeObjToName(scopeRetType)}"\n ^^^^^^^ [FIXED BY] Retyping function to return "${gtname}"`)
                    }
                    scope.data.returnType = givenRetType
                }
            }

            if (rVal != "%eax")
                assembly.setRegister(rVal, "a", defines.types.u32)
        }

        if (scope.data?.name == "entry") {
            hasEntryFunction = true
            if (!asRet) // just fn exit, not explicit return
            {
                outputCode.text.push(
                    `call __rc_free_all__`,
                    `mov  $0, %eax`
                )
            }
            else {
                outputCode.text.push(
                    `push %eax`,
                    `call __rc_free_all__`,
                    `pop %eax`
                )
            }
        }
        // else if (programRules.optimizeMemory) {
        //     outputCode.text.push(
        //         `pusha # C trashes registers. Make this move optimized later by using push clobbers`,
        //         `call __rc_collect__`,
        //         `popa`,
        //     )
        // } 
        else {
            outputCode.text.push(
                `call __rc_quick_check__`
            )
        }
        outputCode.text.push(

            `${d.saveRegs ? "popa" : ""}`,
            //`popa`,
            `mov %ebp, %esp`,
            `pop %ebp`,
            `ret`
        )

        if (!asRet) {
            //throwE("yuh")
            outputCode.data.push(
                `${helpers.formatters.fnAllocMacro(d.name)} = ${d.totalAlloc}`
            )


            Object.entries(stack).forEach(sv => {
                outputCode.text.push(
                    `# ${sv[0]}: ${sv[1].offset}`
                )
            })

            if (scope.data?.isLambda) {
                helpers.registers.deClobberMultiLineRegister("c")
            }
        }
        //throwE(st)
    },
    callFunction: function (fname, args, isConstructor = false, constructorType = null, typeIfFromAddress = null) {

        // var lst = helpers.general.getMostRecentFunction().type
        // var sr_this = false;

        // if (lst == keywordTypes.FORMAT || lst == keywordTypes.CONSTRUCTOR || lst == keywordTypes.METHOD || lst == keywordTypes.OPERATOR) {
        //     sr_this = true
        //     outputCode.autoPush(`pushl __this__`)
        // }

        if (fname == "exit") {
            throwW("\"exit(status)\" may cause leaks. Use \"quit(status)\" instead.")
        }

        var onCom = false
        var callAddress = fname

        //console.log(`Calling ${fname} with ${args.join(" ")}, ${typeIfFromAddress}`)
        //console.log(args.filter(x => x != ","))
        if (typeof args != "string") {
            var filtered = args.filter(x => x != ",")
            if (typeIfFromAddress == null && !userFunctions[fname].variadic && (filtered.length != userFunctions[fname].parameters.length)) {
                throwE(`Function ${fname} expects ${userFunctions[fname].parameters.length} parameter(s), given ${filtered.length}`)
            }
        }

        if (typeIfFromAddress != null) {
            // if ("__not_a_function__" in userFunctions) {
            //     throwE("Do not declare a function named __not_a_function__")
            // }
            fname = "__not_a_function__"
            userFunctions.__not_a_function__ = {
                name: fname,
                parameters: [],
                returnType: typeIfFromAddress,
                variadic: true,
                totalAlloc: 0,
                saveRegs: false
            }
        }
        var variadic = userFunctions[fname].variadic
        //throwE(fname, args)
        var bytes = 0
        var tbuff = []



        assembly.pushClobbers()

        outputCode.comment(`Calling function ${fname}`)

        if (typeof args == "string" && args.length != 0) {
            args = [args]
        }

        if (args.length != 0) {
            var ind = 0;
            args.forEach((x) => {
                if (onCom) {
                    if (x != ',')
                        throwE("Expected comma")
                } else {
                    var skip = false
                    //debugPrint(fname, userFunctions[fname].parameters)
                    //console.log(args)
                    var expectedType = userFunctions[fname].parameters[ind]?.type
                    //debugPrint(x)
                    var givenType = helpers.types.guessType(x)

                    //console.log("fwfwfwfww",givenType)

                    if (expectedType == undefined && !variadic) {
                        throwE(`Function '${fname}' given too many arguments: [${userFunctions[fname].parameters}]`)
                    }

                    var et_s = expectedType == undefined ? "" : helpers.types.convertTypeObjToName(expectedType)
                    var gt_s = helpers.types.convertTypeObjToName(givenType)

                    if(fname != "__not_a_function__")
                    //console.log(">>>>", helpers.types.areSimilarArrayTypes(expectedType, givenType))
                    var as = expectedType == undefined? true : helpers.types.areSimilarArrayTypes(expectedType, givenType)

                    // if broken, before all "as" was (et_s != gt_s)
                    if (
                        !(expectedType == undefined ? false : "acceptsAny" in expectedType) && 
                        !helpers.types.isConstant(x) && 
                        ((variadic && ((expectedType != undefined) && (!as))) || (!variadic && (!as)))) 
                        {
                        if ("hasData" in expectedType && helpers.types.isStringOrConststrType(expectedType) && helpers.types.isStringOrConststrType(givenType)) {
                            tbuff.push([
                                `# converting conststr to string (function call)`,
                                `pushl ${helpers.types.formatIfConstOrLit(x)}`,
                                `call cptos`,
                                `mov %eax, (%esp) # str is alr in stack just overwrite`,
                            ])
                            skip = true
                        }
                        else {
                            throwW(`Argument '${x}' does not match expected type "${et_s}", got "${gt_s}". If those types seem identical, one of the parameter's may be an array holding dynamic data and the other not`)
                        }
                    }

                    if (expectedType != undefined && "isReference" in expectedType && helpers.types.stringIsRegister(x)) {
                        throwE("Unable to get reference of register, most likely a static value")
                    }

                    if (!skip) {
                        if (helpers.types.isConstOrLit(x)) {

                            if (givenType.float && fname == "printf") {
                                throwE("No printf float literal for now... Needs optimization")
                                tbuff.push([
                                    "",
                                    "cvtss2sd %xmm0, %xmm2",
                                    "sub $8, %esp",
                                    "movq %xmm2, (%esp)"
                                ])
                                bytes += 4
                            } else {
                                tbuff.push(`pushl \$${x}`)
                            }
                        } else if (helpers.types.stringIsRegister(x)) {
                            if (givenType.float && fname == "printf") {
                                tbuff.push([
                                    "# awful optimization. do later. sorry",
                                    `mov ${x}, __xmm_sse_temp__`,
                                    `movss __xmm_sse_temp__, %xmm0`,
                                    "cvtss2sd %xmm0, %xmm2",
                                    "sub $8, %esp",
                                    "movq %xmm2, (%esp)"
                                ])
                                bytes += 4
                            } else {
                                tbuff.push(`push ${helpers.types.conformRegisterIfIs(x, defines.types.u32)}`)
                            }
                        }
                        else {
                            if (givenType.float && fname == "printf") {
                                tbuff.push([
                                    `movss ${x}, %xmm0`,
                                    "cvtss2sd %xmm0, %xmm2",
                                    "sub $8, %esp",
                                    "movq %xmm2, (%esp)"
                                ])
                                bytes += 4
                            } else {
                                var r = helpers.types.formatRegister('d', givenType)
                                var bbuff = []
                                if (r != "%edx")
                                    bbuff.push("xor %edx, %edx")

                                // if(helpers.types.stringIsRegister(x))
                                // {
                                //     throwE(x, r, fname, args, givenType)
                                // }
                                if (expectedType != undefined && ("isReference" in expectedType)) {
                                    bbuff.push(
                                        `# TODO optimize if variable just do movl`,
                                        `lea ${x}, %edx # PASS AS REFERENCE`,
                                        `push %edx`
                                    )
                                }
                                else {
                                    bbuff.push(
                                        `# TODO optimize if variable just do movl`,
                                        `mov ${x}, ${r}`,
                                        `push %edx`
                                    )
                                }
                                tbuff.push(bbuff)
                            }
                        }
                    }
                    bytes += 4
                    ind++
                }
                onCom = !onCom
            })
        }

        // if (fname == "printf") {
        //     throwE(args)
        // }

        outputCode.autoPush(...tbuff.reverse().flat())
        var rt = isConstructor ? constructorType : userFunctions[fname].returnType
        // TODO HERE BROKEN : writing "true" instead breaks it. No idea
        debugPrint("RRRR", userFunctions[fname])
        var out = helpers.registers.getFreeLabelOrRegister(rt, false)
        //throwE(out, helpers.types.guessType("%ebx"))

        outputCode.autoPush(
            `call ${typeIfFromAddress == null ? "" : "*"}${callAddress}`,
            `mov ${helpers.types.formatRegister('a', rt)}, ${out}`
        )

        if (bytes != 0) {
            outputCode.autoPush(`add \$${bytes}, %esp`)
        }

        assembly.popClobbers()

        helpers.registers.clobberRegister(helpers.registers.registerStringToLetterIfIs(out))

        // if (sr_this) {
        //     outputCode.autoPush(`popl __this__`)
        // }

        return out
    },
    readArgument: function (index) {
        var out = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
        var ogout = out
        if (!helpers.types.stringIsRegister(out))
            out = "%edx"

        if (helpers.types.isConstant(index)) {
            outputCode.autoPush(
                `mov ${parseInt(index) + 8}(%ebp), ${out}`
            )
        } else if (helpers.types.stringIsRegister(index)) {
            actions.assembly.optimizeMove(index, "%eax", helpers.types.getRegisterType(index), defines.types.u32)
            outputCode.autoPush(
                `add $2, %eax`,
                `mov (%ebp, %eax, 4), ${out}`
            )
        } else if (helpers.types.stringIsEbpOffset(index)) {
            // workin on here
            actions.assembly.optimizeMove(index, "%eax", helpers.types.getVariableFromEbpOffsetString(index).type, defines.types.u32)
            outputCode.autoPush(
                `add $2, %eax`,
                `mov (%ebp, %eax, 4), ${out}`
            )
        } else {
            //throwE(index)
            actions.assembly.optimizeMove(index, "%eax", helpers.variables.getVariableType(index), defines.types.u32)
            outputCode.autoPush(
                `add $2, %eax`,
                `mov (%ebp, %eax, 4), ${out}`
            )
        }

        if (out == "%edx") {
            outputCode.autoPush(
                `mov %edx, ${ogout}`
            )
            return ogout
        }
        return out
    }
}

var formats = {
    parseParams: function (fname, parr) {

        var passed = {}
        if (parr.includes(":")) {
            parr.forEach((x, i) => {
                if (x == ":") {
                    passed[parr[i - 1]] = parr[i + 1];
                }
            })
            // console.log(passed)

            // FIXED? // old: temporarily disabled stack allocations since if you do loops it will be overriting the same thing
            var allocLbl = allocations.allocateAuto(userFormats[fname].size)
            //var allocLbl = allocations.allocateAuto(userFormats[fname].size)          // what it's allocated into

            //throwE(saveLbl, helpers.registers.extendedTypes.c)
            if (helpers.types.stringIsEbpOffset(allocLbl)) {
                //throwE("Compiler shouldn't be here", parr, allocLbl)
                //throwE(allocLbl, parr)
                var saveLbl = helpers.registers.getFreeLabelOrRegister(defines.types[fname])
                var allocOffset = parseInt(helpers.types.getOffsetFromEbpOffsetString(allocLbl))

                outputCode.autoPush(`lea ${allocLbl}, ${saveLbl} # Local allocation address for ${fname}`)
                //throwE(outputCode)

                var off = 0
                //console.log(userFormats[fname].properties)
                userFormats[fname].properties.forEach(p => {
                    var value = passed[p.name]
                    if (value == undefined) {
                        throwE(`Property ${p} not given`);
                    }

                    assembly.optimizeMove(value, `-${allocOffset - off}(%ebp)`, helpers.types.guessType(value), p.type)

                    if ("hasData" in helpers.types.guessType(value) && nextThingTakesOwnership) {
                        outputCode.autoPush(
                            `# requesting ownership (setting sub property)`,
                            `lea -${allocOffset - off}(%ebp), %edx`,
                            `push %edx`,
                            `push ${value}`,
                            `call __rc_requestOwnership__`,
                            `add $8, %esp`)
                    }
                    nextThingTakesOwnership = defaultAutomaticOwnership

                    off += helpers.types.typeToBytes(p.type)
                })
                return saveLbl
            } else { // global
                var hasDataType = helpers.types.convertTypeToHasData(defines.types[fname])
                var saveLbl = helpers.registers.getFreeLabelOrRegister(hasDataType) // what it's saved in

                if (helpers.types.stringIsEsp(allocLbl)) {
                    outputCode.autoPush(`mov %esp, ${saveLbl} # Local allocation address for ${fname}`)
                } else {
                    outputCode.autoPush(`mov %eax, ${saveLbl} # Local allocation address for ${fname}`)
                }

                var off = 0
                //throwE(passed)
                userFormats[fname].properties.forEach(p => {
                    var value = passed[p.name]
                    if (value == undefined) {
                        throwE(`Property ${p} not given`);
                    }
                    assembly.optimizeMove(value, `${off}(%eax)`, helpers.types.guessType(value), p.type)

                    if ("hasData" in helpers.types.guessType(value) && nextThingTakesOwnership) {
                        outputCode.autoPush(
                            `# requesting ownership (setting sub property)`,
                            `lea ${off}(%eax), %edx`,
                            `push %edx`,
                            `push ${value}`,
                            `call __rc_requestOwnership__`,
                            `add $8, %esp`)
                    }
                    nextThingTakesOwnership = defaultAutomaticOwnership

                    off += helpers.types.typeToBytes(p.type)

                    //throwE("here and isebp offset if statement above")
                    //console.log()
                })
                return saveLbl
            }


        }
    },
    readProperty: function (base, baseType, propertyName, readAddress = false) {
        //throwE(baseType.formatPtr.properties[1])
        outputCode.autoPush(`# Reading property "${propertyName}" in "${base}"`)
        var offset = 0
        var i = 0

        //throwE(helpers.general.getMostRecentFunction().data.parameters)
        //console.log("-------------------")
        // should NOT be a normal type!!! TODO HERE SEP 11
        var baseTypeName = helpers.types.convertTypeObjToName(baseType)

        //console.log(":::", base)
        while (baseType.formatPtr.properties[i].name != propertyName) {
            //console.log(baseType.formatPtr.properties[i], i, propertyName)
            offset += helpers.types.typeToBytes(baseType.formatPtr.properties[i].type)
            if (baseType.formatPtr.properties[i + 1] == undefined) {
                //throwE(globalVariables.__this__)
                throwE(`Couldn't find property "${propertyName}" in ${base}`)
            }
            i++
        }
        var propertyType = baseType.formatPtr.properties[i].type
        if (helpers.formats.cannotUsePrivate(baseType.formatPtr.properties[i])) {
            throwE(`"${propertyName}" is a private property in ${baseTypeName}`)
        }
        //throwE(propertyType, offset)

        var out = helpers.registers.getFreeLabelOrRegister(propertyType)
        oldFormatAllocs.push(out)
        if (!helpers.types.stringIsRegister(base)) {
            outputCode.autoPush(`movl ${base}, %eax`)
            base = "%eax"
        }

        if (readAddress)
            return { ptr: `${offset}(${base})`, type: propertyType }
        assembly.optimizeMove(`${offset}(${base})`, out, propertyType, propertyType)

        if ("unknown" in propertyType) {
            throwE(`Property "${propertyName}" in "${base}" cannot be read since its type is unknown. Did you initialize it?`)
        }
        return out
    },
    createMethodOrConstructor: function (_scope, fname, params, ret = null) {
        if (typeof (params) == "string")
            params = [params]
        var params_obj = actions.functions.createParams(params)
        var returnType = objCopy(defines.types.u32)


        if (ret == null) // constructor
        {
            var _data = {
                name: fname,
                parameters: params_obj.params,
                variadic: params_obj.didVari,
                totalAlloc: 0,
                saveRegs: false,
                isPublic: inPublicMode
            }

            //throwE(_scope)
            _scope.constructors[fname] = _data
            userFunctions[fname] = _data

            if (!nextIsForward) {

                requestBracket = {
                    type: keywordTypes.CONSTRUCTOR,
                    data: _data
                }

                functions.createFunction(fname)
                var save = allocations.allocateMmap("$" + helpers.formatters.formatAllocMacro(_scope.name), "Allocate for THIS")
                outputCode.autoPush(`mov %eax, __this__`)

                nextThingTakesOwnership = true
                variables.set("___TEMPORARY_OWNER___", `__this__`)
            }
            nextIsForward = false
            //throwE(defines.types)
        }
        else {
            //console.log("RETTTTT", ret)
            var _data = {
                name: fname,
                parameters: params_obj.params,
                variadic: params_obj.didVari,
                returnType: ret,
                totalAlloc: 0,
                saveRegs: false,
                isPublic: inPublicMode
            }

            //throwE("not done", _data)

            _scope.methods[fname] = _data

            //throwE(userFormats)
            userFormats[_scope.name] = _scope


            userFunctions[fname] = _data

            if (!nextIsForward) {
                requestBracket = {
                    type: keywordTypes.METHOD,
                    data: _data
                }

                functions.createFunction(fname)
            }
            nextIsForward = false

            //throwE(userFunctions)
        }

    },
    createOperator: function (_scope, operator, params, ret, isForward = false) {
        if (isForward) {
            throwE("ya")
        }
        if (typeof (params) == "string")
            params = [params]
        var params_obj = actions.functions.createParams(params)
        //console.log(params_obj)
        var fname = helpers.formatters.formatNewOperatorName(_scope.name, operator)

        var _data = {
            name: fname,
            parameters: params_obj.params,
            variadic: params_obj.didVari,
            returnType: ret,
            totalAlloc: 0,
            saveRegs: false,
            isPublic: inPublicMode
        }

        if (_scope.operators[operator] == undefined)
            _scope.operators[operator] = [_data]
        else
            _scope.operators[operator].push(_data)

        userFormats[_scope.name] = _scope
        userFunctions[fname] = _data

        if (!nextIsForward) {
            requestBracket = {
                type: keywordTypes.OPERATOR,
                data: _data
            }

            functions.createFunction(fname)
        }
        nextIsForward = false
        //throwE("created " + fname)
    },
    callConstructor: function (className, params) {

        // var lst = getLastScopeType()
        // var sr_this = false;

        thisStack.save();

        // if (lst == keywordTypes.FORMAT || lst == keywordTypes.CONSTRUCTOR || lst == keywordTypes.METHOD) {
        //     sr_this = true
        //     outputCode.autoPush(`pushl __this__ # hi`)
        // }

        if (Object.keys(userFormats[className].constructors).length == 0) {
            throwE("No constructors declared for class:", className)
        }

        var variadicConstructor = null
        var bestFit = null
        if (typeof params == "string")
            params = [params]
        var numberOfParams = params.filter(x => x != ",").length

        // overloading
        // awful code. so many ideas going through my head. fix later
        Object.entries(userFormats[className].constructors).forEach(e => {
            if (e[1].variadic) {
                variadicConstructor = e[0]
            } else {
                if (numberOfParams == e[1].parameters.length) {
                    bestFit = e[0]
                }
            }
        })

        if (bestFit == null) {
            if (variadicConstructor == null) {
                throwE(`No constructor exists for "${className}" that takes "${numberOfParams}" parameters. Either make a variadic constructor, or add one that takes this number of parameters.`)
            }
            bestFit = variadicConstructor
        }

        if (helpers.formats.cannotUsePrivate(userFormats[className].constructors[bestFit])) {
            throwE(`The corresponding constructor for "${className}" is private`)
        }

        //globalVariables.__this__ = defines.types[className]

        var lst = helpers.general.getMostRecentFunction().type
        var sr_this = false;
        if (lst == keywordTypes.FORMAT || lst == keywordTypes.CONSTRUCTOR || lst == keywordTypes.METHOD || lst == keywordTypes.OPERATOR) {
            sr_this = true
            outputCode.autoPush(`pushl __this__`)
        }

        globalVariables.__this__ = helpers.types.convertTypeToHasData(defines.types[className])
        var rval = functions.callFunction(bestFit, params, true, globalVariables.__this__)

        if (sr_this) {
            outputCode.autoPush(`popl __this__`)
        }

        thisStack.restore();

        return rval
    },
    closeConstructor: function (scope, stack) {
        // outputCode.autoPush(
        //     `mov __this__, %eax`
        // )
        functions.closeFunction(scope, stack, false, "__this__")
        //throwE(scope, stack)
    },
    closeMethod: function (scope, stack) {
        functions.closeFunction(scope, stack)
    },
    callMethod: function (parent, method, params) {

        thisStack.save();

        var parentType;
        var formattedName;

        var lst = helpers.general.getMostRecentFunction().type
        var sr_this = false;
        if (lst == keywordTypes.FORMAT || lst == keywordTypes.CONSTRUCTOR || lst == keywordTypes.METHOD || lst == keywordTypes.OPERATOR) {
            sr_this = true
            outputCode.autoPush(`pushl __this__`)
        }

        if (objectIncludes(defines.types, parent)) { // formatName.method()
            if (method == "call") {
                //throwE(parentType)

                if (typeof params == "string") {
                    throwE("Need at least two parameters, the instance and the method")
                }
                var parentType = defines.types[parent]
                actions.assembly.optimizeMove(params[0], "__this__", parentType, parentType)
                formattedName = helpers.formatters.formatMethodName(parent, params[2])
                params.splice(0, 4)
            } else {
                throwE("Static methods not implemented yet")
            }
        } else { // instance.method()
            parentType = helpers.types.guessType(parent)
            //console.log(globalVariables)
            if (parentType.formatPtr == undefined) {
                throwE(`"${parent}" is not a format instance or does not exist`)
            }
            formattedName = helpers.formatters.formatMethodName(parentType.formatPtr.name, method)
            if (!objectIncludes(parentType.formatPtr.methods, formattedName)) {
                //throwE(parentType == userFormats[parentType.formatPtr.name])
                throwE(`Method "${method}" does not exist in format "${parentType.formatPtr.name}"`)
            }
            if (helpers.formats.cannotUsePrivate(parentType.formatPtr.methods[formattedName])) {
                throwE(`Method "${method}" is private in format "${parentType.formatPtr.name}"`)
            }

            actions.assembly.optimizeMove(parent, "__this__", parentType, parentType)
        }

        var r = functions.callFunction(formattedName, params)

        if (sr_this) {
            outputCode.autoPush(`popl __this__`)
        }


        //console.log(formattedName)
        if ("modifiesThis" in userFunctions[formattedName]) {
            outputCode.autoPush("# Loading into __this__ because function modified it ")
            actions.assembly.optimizeMove("__this__", parent, parentType, parentType)
        }

        thisStack.restore();

        return r;
    },
    callOperator: function (parent, operator, params) {

        //console.log("CALLING", parent, operator, params)
        if (typeof params == "string") {
            params = [params]
            //throwE("[INTERNAL] Operators cannot be called with multiple parameters")
        }

        thisStack.save();

        var parentType = helpers.types.guessType(parent)

        if (parentType.formatPtr == undefined) {
            throwE(`"${parent}" is not a format instance or does not exist`)
        }

        var paramType = helpers.types.guessType(params[0])
        var operator = helpers.formats.convertOperatorToString(operator)


        var foundOperatorFn = parentType.formatPtr.operators[operator].find(e => {
            return e.parameters.every((p, i) => {
                return helpers.types.areEqualNonStrict(p.type, helpers.types.guessType(params[i]))
            })
        })

        if (foundOperatorFn == undefined) {
            throwE(`Unable to find an overload for "${operator}" in type "${parentType.formatPtr.name}" that accepts type "${helpers.types.convertTypeObjToName(paramType)}"`)
        }

        var formattedName = foundOperatorFn.name
        //throwE(foundOperatorFn)
        // var formattedName = helpers.formatters.formatOperatorName(parentType.formatPtr.name, operator)
        // //throwE(parentType.formatPtr.operators)
        // if (!objectIncludes(parentType.formatPtr.operators, formattedName)) {
        //     throwE(`Operator "${operator}" does not exist in format "${parentType.formatPtr.name}"`)
        // }

        if (helpers.formats.cannotUsePrivate(foundOperatorFn)) {
            throwE(`The "${operator}" operator overload for the type "${helpers.types.convertTypeObjToName(parentType)}" is private`)
        }

        var sr_this = false
        var lst = helpers.general.getMostRecentFunction().type
        if (lst == keywordTypes.FORMAT || lst == keywordTypes.CONSTRUCTOR || lst == keywordTypes.METHOD || lst == keywordTypes.OPERATOR) {
            sr_this = true
            outputCode.autoPush(`pushl __this__`)
        }

        // ****HERE**** TODO: this is overwriting __this__ before callFunction which saves this.
        actions.assembly.optimizeMove(parent, "__this__", parentType, parentType)

        // throwE("calling", formattedName, params)
        var r = functions.callFunction(formattedName, params)
        //console.log(formattedName)

        if ("modifiesThis" in userFunctions[formattedName]) {
            outputCode.autoPush("# Loading into __this__ because function modified it ")
            actions.assembly.optimizeMove("__this__", parent, parentType, parentType)
        }

        thisStack.restore();

        return r;
    }
}

var strings = {
    createTemplateString: function (str) {
        var finalArr = []
        var stringBuild = ""
        var override = false
        assembly.disableGC()
        for (var letterNum = 0; letterNum < str.length; letterNum++) {
            var letter = str[letterNum]
            if (letter == "\\") {
                var override = true
            }
            else if (!override && letter == "$") {
                if (str[letterNum + 1] != "{") {
                    throwE("Expected open bracket in template literal")
                }

                var innerStartString = str.slice(letterNum + 1)

                var index = 1;
                var splitted;
                do {
                    splitted = parser.split(innerStartString.slice(0, index))
                    //console.log(letterNum + index)
                    index++
                }
                while (letterNum + index <= str.length && (
                    splitted.filter(x => x == "}").length != splitted.filter(x => x == "{").length
                ))

                if (letterNum + index > str.length) {
                    throwE("Unclosed bracket in template literal")
                }

                var splittedLen = index
                splitted = splitted.slice(1, splitted.length - 1)

                finalArr.push(stringBuild)
                finalArr.push(evaluator(splitted))
                stringBuild = ""

                letterNum += splittedLen - 1

            }
            else {
                stringBuild += letter
                override = false
            }
        }
        finalArr.push(stringBuild)
        finalArr = finalArr.map(x => {
            if (typeof (x) == "string") {
                //console.log("EVALING", `"${x}"`)
                var evaled = evaluator([`"${x}"`])
                if (evaled.length != 1) {
                    throwE(`[INTERNAL] ${evaled} should only be of length 1 (template strings, inner eval)`)
                }
                else {
                    return evaled[0]
                }
            }
            else {
                if (x.length != 1) {
                    throwE(`[INTERNAL] ${x} should only be of length 1 (template strings)`)
                }
                else {
                    return x[0]
                }
            }
        })

        finalArr = finalArr.map(x => x = [x, "+"]).flat()
        finalArr = finalArr.slice(0, finalArr.length - 1)

        var evaluatedOut = stringAdder(finalArr)

        //throwE("template str WIP", finalArr, evaluatedOut)

        assembly.restoreGCActive()

        return evaluatedOut
    }
}

var arrays = {
    getLength: function (array) {

        //console.log("$$$$", array)
        var arrayType = helpers.types.guessType(array)
        var elementType = helpers.types.derefType(arrayType)

        var ret = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
        var using = helpers.types.stringIsRegister(ret) ? ret : "%edx"

        if ("hasData" in arrayType) {
            outputCode.autoPush(
                `# Get array size`,
                `mov ${array}, %eax # load arr`,
                `mov -4(%eax), %edx # get entry reference`,
                `mov 8(%edx),  ${using} # get size`
            )
        }
        else {
            throwE("array length not implemented on static arrays yet")
        }

        var b = helpers.types.typeToBytes(elementType)
        if (b != 1) {
            outputCode.autoPush(`shr \$${b / 2}, ${using} # divide by ${b} (bytes to u32 or u16)`)
        }

        if (using == "%edx") {
            outputCode.autoPush(
                `mov %edx, ${ret} # size to arr len holder`,
            )
        }

        return ret
    }
}

module.exports = {
    assembly,
    variables,
    allocations,
    functions,
    formats,
    strings,
    arrays,
}