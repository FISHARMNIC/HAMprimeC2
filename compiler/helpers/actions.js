var assembly = {
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
        return this.setRegister(value, helpers.registers.registerStringToLetterIfIs(reg), type, low)
    },
    optimizeMove: function (source, destination, sType, dType) {


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
        if (helpers.types.isConstant(value) || objectIncludes(globalVariables, value)) {
            outputCode.autoPush(`pushl \$${value}`)
        } else if (helpers.types.stringIsRegister(value) || helpers.types.stringIsEbpOffset(value)) {
            outputCode.autoPush(`push ${helpers.types.conformRegisterIfIs(value, defines.types.u32)}`)
        } else {
            this.setRegister(value, 'd', type)
            outputCode.autoPush(`push %edx`)
        }
    },
    getStackOffset: function (variable) {
        return getAllStackVariables()[variable].offset
    },
    getStackVarAsEbp(vname) {
        //throwE("READING", vname, assembly.getStackOffset(vname), currentStackOffset)
        return `-${assembly.getStackOffset(vname)}(%ebp)`
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

        if ("formatPtr" in stype && stype.formatPtr != null) {
            var fmtSize = helpers.formats.getFormatSize(stype.formatPtr.properties)
            outputCode.autoPush(
                `# copying format`,
                `lea ${source}, %esi`,
                `mov ${alloced}, %edi`,
                `mov \$${fmtSize}, %ecx`,
                `rep movsb`
            )
        } else if ("hasData" in stype) {
            outputCode.autoPush(
                `# copying buffer`,
                `lea ${source}, %esi`,
                `mov (%esi), %ecx`,
                `mov -4(%ecx), %ecx`,
                `pushl 8(%ecx)`,
                `call __rc_allocate__`,
                `pop %ecx`,
                `mov %eax, %edi`,
                `rep movsb`,
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
    }
}

var variables = {
    create: function (vname, type, value, onStack = scope.length != 0) {
        __addToAnyVarEverMade(vname)


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

            //throwE(type)
            if ("hasData" in type) {

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
            createStackVariableListOnly(vname, newStackVar(type))
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

            if ("hasData" in type && nextThingTakesOwnership) {
                outputCode.autoPush(
                    `# requesting ownership for ${vname} (create)`,
                    `push \$${vname}`,
                    `push ${value}`,
                    `call __rc_requestOwnership__`,
                    `add $8, %esp`
                )

            }
            nextThingTakesOwnership = defaultAutomaticOwnership

        }

        return vname
    },
    set: function (vname, value) {

        if (vname == "__this__") {
            helpers.general.setModifiesThis()
        }
        var isStack = helpers.variables.checkIfOnStack(vname) // ) // if stack var
        var type = helpers.variables.getVariableType(vname)

        //throwE(helpers.types.guessType(value))

        var valueType = helpers.types.guessType(value);

        if (!helpers.types.areEqual(valueType, type) && vname != "___TEMPORARY_OWNER___" && vname != "__this__") {
            
            // make sure its not just that value is dynamic and variable is not
            var checkT = helpers.types.convertTypeToHasData(type)
            //var checkT = helpers.types.convertTypeToHasData(type)
            //console.log("\n-----",checkT,valueType,"------\n", ":::::", nextThingTakesOwnership, ":::::")
            if(!((helpers.types.areEqual(checkT, valueType)) && !nextThingTakesOwnership))
            {
            
            if(helpers.types.areEqual(checkT, valueType))
            {
                throwE(`Assigning a dynamic "${helpers.types.convertTypeObjToName(type)}" to a static.\n\t[FIX] Use "borrow"`)
            }
            throwW(`Retyping variable ${vname} from "${helpers.types.convertTypeObjToName(type)}" to "${helpers.types.convertTypeObjToName(valueType)}"`)
            if (helpers.types.typeToBytes(valueType) < helpers.types.typeToBytes(type)) {
                throwW(`-- New type is smaller than original type`)
            }
            type = valueType
            helpers.variables.setVariableType(vname, type)
            //throwE(defines.types.u32)
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

        if (("hasData" in type)) {
            if (nextThingTakesOwnership || (vname == "___TEMPORARY_OWNER___")) {
                outputCode.autoPush(
                    `# requesting ownership for ${vname} (set)`,
                    `lea ${isStack ? assembly.getStackVarAsEbp(vname) : vname}, %eax`,
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
        } else {
            if (isStack) {
                assembly.optimizeMove(value, assembly.getStackVarAsEbp(vname), type, type)
            } else if (objectIncludes(globalVariables, vname)) {       // if glob var
                assembly.optimizeMove(value, vname, type, type)
                //outputCode.autoPush(`mov${suffix} ${value}, ${vname}`)
            } else {
                throwE(`Variable ${vname} has not been declared neither locally nor globally`)
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


        var baseRegister = "%eax"
        var baseType = -1;

        // yes bad code that I was doing something else with but changed it

        debugPrint(index)

        if (helpers.types.isLiteral(aname)) {
            baseType = objCopy(defines.types.u8)
            outputCode.autoPush(
                `mov \$${aname}, %eax`,
            )
        }
        else if (helpers.variables.variableExists(aname)) {
            baseType = objCopy(helpers.variables.getVariableType(aname))
            baseType.pointer = false

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
            baseType.pointer = false

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
            baseType.pointer = false

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

        var indexMultiplier;
        if ("formatPtr" in baseType) {
            indexMultiplier = 4
        } else if (forceSize === false) {
            indexMultiplier = baseType.size / 8
        } else {
            indexMultiplier = forceSize
        }

        if (!("elementsHaveData" in baseType)) {
            delete baseType.hasData
        } else {
            //throwE("yay, this should have been thrown if the array type has data itself. you can delete this line")
        }

        var out = helpers.registers.getFreeLabelOrRegister(baseType)

        //throwE(helpers.types.guessType(out))

        var fullReg = helpers.types.conformRegisterIfIs(out, defines.types.u32)

        if (baseType.size != 32) {
            outputCode.autoPush(`xor ${fullReg}, ${fullReg}`)
        }
        var ogout = out
        var edxReserved = false
        if (!helpers.types.stringIsRegister(out)) {
            var edxReserved = true
            out = helpers.types.formatRegister('d', baseType)
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
                throwE("unimplemented")
                // have to use normal math since edx and eax are occupied and cannot be modified
            } else {
                actions.assembly.optimizeMove(index, "%edx", helpers.types.getVariableFromEbpOffsetString(index).type, defines.types.u32)
                outputCode.autoPush(
                    `mov (%eax, %edx, ${indexMultiplier}), ${out}`
                )
            }
        } else {
            if (edxReserved) {
                throwE("unimplemented")
                // have to use normal math since edx and eax are occupied and cannot be modified
            } else {
                actions.assembly.optimizeMove(index, "%edx", helpers.variables.getVariableType(index), defines.types.u32)
                outputCode.autoPush(
                    `mov (%eax, %edx, ${indexMultiplier}), ${out}`
                )
            }
        }

        var nopointer = objCopy(baseType)
        nopointer.pointer = false

        // type = deref
        helpers.registers.extendedTypes[helpers.registers.registerStringToLetterIfIs(out)] = nopointer

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
        var elementType = helpers.types.derefType(arrType)
        var elementBytes = helpers.types.typeToBytes(elementType)
        var indexType = helpers.types.guessType(index)
        var valueType = helpers.types.guessType(value)

        var indexIsVar = objectIncludes(globalVariables, index)

        var suffix = "";

        outputCode.autoPush("#Array set begin")
        //throwE(address, index, value)

        if (!helpers.types.stringIsRegister(address)) {
            outputCode.autoPush(`mov ${helpers.types.formatIfConstant(address)}, %eax`)
            address = "%eax"
        }

        // two step

        //console.log(address)
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
            outputCode.autoPush(
                `mov${suffix} ${value}, (${address}, ${index}, ${elementBytes})`
            )
        } else if (objectIncludes(globalVariables, index) || helpers.types.stringIsEbpOffset(index)) { // if index is glob or index is ebp
            // FIX THIS poorly optimized
            // throwE("Not sure. fix the code below this")
            if (helpers.types.guessType(index).size != 32) {
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
            finalSettingAddr = "eax"

            /* 
            index -> eax
            mutliply eax by "bytes"
            add value in base pointer to eax
            mov value to address

            */
            // outputCode.autoPush(
            //     `push %eax`,
            //     `mov ${index}, %eax`,
            //     `${(elementBytes != 1) ? `shl \$${helpers.types.typeToBytes(elementType) / 2}, %eax` : ""}`,
            //     `add (%esp), %eax`,
            //     `add $1, %esp`,
            //     `mov${suffix} ${value}, (%eax)`
            // )

        }

        // console.log(helpers.types.guessType(type.address))
        if (("hasData" in valueType || "elementsHaveData" in arrType) && nextThingTakesOwnership) {
            if (!("elementsHaveData" in arrType)) {
                throwE(`Assigning "${helpers.types.convertTypeObjToName(valueType)}" to an array expecting static "${helpers.types.convertTypeObjToName(valueType)}"`)
            } else if (!("hasData" in valueType)) {
                throwE(`Assigning static "${helpers.types.convertTypeObjToName(valueType)}" to array expecting a "${helpers.types.convertTypeObjToName(arrType)}"`)
            }

            if (finalSettingAddr == null) {
                throwE("Error, no setting address for ownership. Shouldn't get here...")
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

            debugPrint("ALLOCING", bytes, currentStackOffset)
            if (programRules.DynamicArraysAllocateSize && !forceNoSize) {
                currentStackOffset = (helpers.general.getMostRecentFunction().data.totalAlloc += (bytes + 4))
                outputCode.autoPush(
                    `${note.length != 0 ? "#" + note + "\n" : ""}movl \$${bytes}, -${currentStackOffset}(%ebp) # Allocated in __ALLOC_FOR__, setting extra byte for size`
                )
                return `-${currentStackOffset - 4}(%ebp)`
            } else {
                //console.log(helpers.general.getMostRecentFunction())
                currentStackOffset = (helpers.general.getMostRecentFunction().data.totalAlloc += bytes)
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
        if(objectIncludes(allStringLiterals, value)) // "string" : "__STRING123__"
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
        //throwE(arr)
        arrayClamp = objCopy(arrayClamp)
        var elementSize = helpers.types.typeToBytes(arrayClamp)
        var allocLbl = allocations.allocateAuto(arr.filter(x => x != ",").length * elementSize, false, note)
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

        arr.forEach((x) => {
            if (onComma) {
                if (x != ",") {
                    throwE(`Expected comma in array allocation: [${arr.join(",")}]`)
                }
            } else {
                //debugPrint("reregwegereerwrege", elementSize, index)
                if (x == ",") {
                    throwE(`Did not expect comma in array allocation: [${arr.join(",")}]`)
                }
                if (globalAlloc) {
                    assembly.optimizeMove(x, `${index * elementSize}(${allocLbl})`, helpers.types.guessType(x), arrayClamp)
                } else {

                    assembly.optimizeMove(x, `-${ebpOff - (index * elementSize)}(%ebp)`, helpers.types.guessType(x), arrayClamp)
                }
                index++
            }
            onComma = !onComma
        })

        var ref = objCopy(arrayClamp)
        ref.pointer = true;

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
                robj.push({ name: x, type })
                oBytes += helpers.types.typeToBytes(type)
            }
            onCom = !onCom
        })
        return { params: robj.reverse(), oBytes, didVari }
    },
    createFunction: function (fname) {
        if (helpers.general.isReserved(fname)) {
            throwE(`Cannot create function "${fname}" as it is a reserved word`)
        }
        outputCode.text.push(
            fname + ":",
            `push %ebp`,
            `mov %esp, %ebp`,
            //`pusha`,
            //`${userFunctions[fname].saveRegs ? "pusha" : ""}`,
            `sub \$${helpers.formatters.fnAllocMacro(fname)}, %esp`,

        )

    },
    closeFunction: function (scope, stack, asRet = false, rVal = null, forceOwnNew = false) {
        var d = scope
        debugPrint(scope)
        if ("data" in d)
            d = d.data
        debugPrint("SC", scope, rVal)

        if (forceOwnNew) {
            if (("returnType" in d) && (rVal != null) && (helpers.types.guessType(rVal).hasData == true) && forceOwnNew) {
                variables.set("___TEMPORARY_OWNER___", rVal)
            } else {
                throwE(`"return_new ${rVal}" doesn't return any allocated data. Use "return"`)
            }
        }

        if (rVal != null) {

            if (!("name" in scope && scope.name.includes("__constructor_"))) {
                // TODO HERE
                var givenRetType = helpers.types.guessType(rVal)
                var scopeRetType = scope.data.returnType
                // console.log("::", givenRetType, scopeRetType)
                if (!helpers.types.areEqual(givenRetType, scopeRetType)) {
                    var gtname = helpers.types.convertTypeObjToName(givenRetType)
                    throwW(`Return type "${gtname}" does not match expected return type "${helpers.types.convertTypeObjToName(scopeRetType)}"\n ^^^^^^^ [FIXED BY] Retyping function to return "${gtname}"`)
                    scope.data.returnType = givenRetType
                }
            }
            assembly.setRegister(rVal, "a", defines.types.u32)
        }

        if (programRules.optimizeMemory) {
            outputCode.text.push(
                `pusha # C trashes registers. Make this move optimized later by using push clobbers`,
                `call __rc_collect__`,
                `popa`,
            )
        } else {
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
            outputCode.data.push(
                `${helpers.formatters.fnAllocMacro(d.name)} = ${d.totalAlloc}`
            )


            Object.entries(stack).forEach(sv => {
                outputCode.text.push(
                    `# ${sv[0]}: ${sv[1].offset}`
                )
            })
        }
        //throwE(st)
    },
    callFunction: function (fname, args, isConstructor = false, constructorType = null, typeIfFromAddress = null) {
        var onCom = false
        var callAddress = fname
        if (typeIfFromAddress != null) {
            if ("__not_a_function__" in userFunctions) {
                throwE("Do not declare a function named __not_a_function__")
            }
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
                    //debugPrint(fname, userFunctions[fname].parameters)
                    var expectedType = userFunctions[fname].parameters[ind]?.type
                    //debugPrint(x)
                    var givenType = helpers.types.guessType(x)

                    //debugPrint("fwfwfwfww",givenType)

                    if (expectedType == undefined && !variadic) {
                        throwE(`Function '${fname}' given too many arguments: [${userFunctions[fname].parameters}]`)
                    }

                    var et_s = expectedType == undefined ? "" : helpers.types.convertTypeObjToName(expectedType)
                    var gt_s = helpers.types.convertTypeObjToName(givenType)

                    if (!(expectedType == undefined ? false : "acceptsAny" in expectedType) && !helpers.types.isConstant(x) && ((variadic && (expectedType != undefined && (et_s != gt_s))) || (!variadic && (et_s != gt_s))))
                        throwW(`Argument '${x}' does not match expected type "${et_s}", got "${gt_s}"`)

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
                            bbuff.push(
                                `# TODO optimize if variable just do movl`,
                                `mov ${x}, ${r}`,
                                `push %edx`
                            )
                            tbuff.push(bbuff)
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
        var offset = 0
        var i = 0

        //throwE(helpers.general.getMostRecentFunction().data.parameters)

        // should NOT be a normal type!!! TODO HERE SEP 11
        while (baseType.formatPtr.properties[i].name != propertyName) {
            //console.log(baseType.formatPtr.properties[i], i)
            offset += helpers.types.typeToBytes(baseType.formatPtr.properties[i].type)
            i++
        }
        var propertyType = baseType.formatPtr.properties[i].type
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
                saveRegs: false
            }

            //throwE(_scope)
            _scope.constructors[fname] = _data
            userFunctions[fname] = _data

            requestBracket = {
                type: keywordTypes.CONSTRUCTOR,
                data: _data
            }

            functions.createFunction(fname)
            var save = allocations.allocateMmap("$" + helpers.formatters.formatAllocMacro(_scope.name), "Allocate for THIS")
            outputCode.autoPush(`mov %eax, __this__`)

            nextThingTakesOwnership = true
            variables.set("___TEMPORARY_OWNER___", `__this__`)
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
                saveRegs: false
            }

            //throwE("not done", _data)

            _scope.methods[fname] = _data

            //throwE(userFormats)
            userFormats[_scope.name] = _scope


            userFunctions[fname] = _data

            requestBracket = {
                type: keywordTypes.METHOD,
                data: _data
            }

            functions.createFunction(fname)

            //throwE(userFunctions)
        }

    },
    callConstructor: function (className, params) {
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

        //globalVariables.__this__ = defines.types[className]
        globalVariables.__this__ = helpers.types.convertTypeToHasData(defines.types[className])
        return functions.callFunction(bestFit, params, true, globalVariables.__this__)
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
        var parentType;
        var formattedName;
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
            formattedName = helpers.formatters.formatMethodName(parentType.formatPtr.name, method)
            if (!objectIncludes(parentType.formatPtr.methods, formattedName)) {
                //throwE(parentType.formatPtr.methods, method)
                throwE(`Method "${method}" does not include in format "${parentType.formatPtr.name}"`)
            }
            actions.assembly.optimizeMove(parent, "__this__", parentType, parentType)
        }

        var r = functions.callFunction(formattedName, params)
        //console.log(formattedName)
        if ("modifiesThis" in userFunctions[formattedName]) {
            outputCode.autoPush("# Loading into __this__ because function modified it ")
            actions.assembly.optimizeMove("__this__", parent, parentType, parentType)
        }

        return r;
    }
}

module.exports = {
    assembly,
    variables,
    allocations,
    functions,
    formats,
}