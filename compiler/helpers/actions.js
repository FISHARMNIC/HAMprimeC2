var assembly = {
    setRegister: function (value, register, type, low = true) {
        debugPrint("setting", register, value, type)
        var r = helpers.types.formatRegister(register, type, low)
        if (helpers.types.typeToBits(type)) {
            helpers.registers.extendedTypes[register] = type
        }
        outputCode.autoPush(`mov ${helpers.types.formatIfConstOrLit(value)}, ${r}`)
        return r
    },
    optimizeMove(source, destination, sType, dType) {
        debugPrint(" reoifjeorjferiojerf", source)
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
            //debugPrint(source,sType, dType)
            if (helpers.types.typeToBits(sType) != 32)
                outputCode.autoPush("xor %edx, %edx")
            this.setRegister(source, 'd', sType)
            outputCode.autoPush(`mov ${helpers.types.formatRegister('d', dType)}, ${destination}`)
        }
    },
    pushToStack: function (value, type) {
        debugPrint(value, helpers.types.conformRegisterIfIs(value, defines.types.u32))
        if (helpers.types.isConstant(value)) {
            outputCode.autoPush(`pushl \$${value}`)
        } else if (helpers.types.stringIsRegister(value)) {

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

        Object.entries(helpers.registers.inLineClobbers).forEach(x => {
            if (x[1] == 1) {
                //debugPrint("pushing", x)
                this.pushToStack(helpers.types.formatRegister(x[0], defines.types.u32), defines.types.u32)
                //outputCode.autoPush(`push ${helpers.types.formatRegister(x[0], defines.types.u32)}`)
            }
        })
    },
    popClobbers: function () {
        Object.entries(helpers.registers.inLineClobbers).forEach(x => {
            if (x[1] == 1) {
                outputCode.autoPush(`pop ${helpers.types.formatRegister(x[0], defines.types.u32)}`)
            }
        })
    },
}

var variables = {
    create: function (vname, type, value, onStack = scope.length != 0) {
        if (onStack) // inside of a function
        {
            //throwE(vname, type, value)
            value = helpers.types.formatIfConstant(value)
            if (objectIncludes(getAllStackVariables(), vname)) {
                throwE(`Variable "${vname}" already defined`)
            }
            var off = allocations.allocateStack(helpers.types.typeToBytes(type), true) // store in stack
            //throwE(value, off)
            assembly.optimizeMove(value, off, type, type)
            createStackVariableListOnly(vname, newStackVar(type))
            //throwE(stackVariables)
        } else { // outside of function, global variable
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
        }
        return vname
    },
    set: function (vname, value) {
        var isStack = helpers.variables.checkIfOnStack(vname) // ) // if stack var
        var type = helpers.variables.getVariableType(vname)

        if (isStack) {
            assembly.optimizeMove(value, assembly.getStackVarAsEbp(vname), type, type)
        } else if (objectIncludes(globalVariables, vname)) {       // if glob var
            assembly.optimizeMove(value, assembly.getStackVarAsEbp(vname), type, type)
            //outputCode.autoPush(`mov${suffix} ${value}, ${vname}`)
        } else {
            throwE(`Variable ${vname} has not been declared neither locally nor globally`)
        }
        return vname
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
    readArray: function (aname, index) {
        var stypes = {
            GLOB: 0,
            LOC: 1,
            PAR: 2,
            EBP: 3,
            ESP: 4
        }

        var baseType = -1;
        var status = stypes.GLOB

        // yes bad code that I was doing something else with but changed it
        if (helpers.types.isLiteral(aname)) {
            baseType = defines.types.u8
            outputCode.autoPush(
                `mov \$${aname}, %eax`,
            )
        }
        else if (helpers.variables.variableExists(aname)) {
            baseType = helpers.variables.getVariableType(aname)
            debugPrint("EXISTSSS", aname, baseType)
            outputCode.autoPush(
                `mov ${aname}, %eax`,
            )
            if (helpers.types.stringIsEbpOffset(aname)) {
                status = stypes.LOC
            } else {
                status = stypes.GLOB
            }
        } else if (helpers.variables.checkIfParameter(aname)) {
            // status = stypes.PAR
            // baseType = helpers.functions.getParameterType(aname)
            // outputCode.autoPush(
            //     `mov %ebp, %eax`,
            //     `mov ${(helpers.functions.getParameterOffset(aname) + 8) + "(%ebp)"}, %eax`
            // )
            throwE("shouldn't get here....")
        } else if (helpers.types.stringIsEbpOffset(aname)) {
            baseType = helpers.types.getVariableFromEbpOffsetString(aname).type
            outputCode.autoPush(
                `mov ${aname}, %eax`,
            )
        } else if (helpers.types.stringIsEsp(aname)) {
            outputCode.autoPush(
                `mov %esp, %eax`,
            )
        }
        else if (helpers.types.stringIsRegister(aname)) {
            baseType = helpers.types.getRegisterType(aname)
            outputCode.autoPush(
                `mov ${aname}, %eax`,
            )
        }
        else {
            throwE(`Cannot access array "${aname}"`)
        }
        if (baseType == -1) {
            throwE("Compiler error, never set 'baseType' variable")
        }

        var indexMultiplier = baseType.size / 8
        var out = helpers.registers.getFreeLabelOrRegister(baseType)
        var ogout = out
        var edxReserved = false
        if (!helpers.types.stringIsRegister(out)) {
            var edxReserved = true
            out = helpers.types.formatRegister('d', baseType)
        }

        debugPrint(index)
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
        if (helpers.variables.checkIfOnStack(name)) { // if local
            var addr = helpers.variables.getStackVarOffset(name)
            outputCode.text.push(
                `mov %esp, ${reg}`,
                `sub \$${addr}, ${reg}`
            )
        } else if (helpers.types.stringIsEbpOffset(name)) {
            var off = helpers.types.getOffsetFromEbpOffsetString(name)
            throwE("unfinished")
        } else if (helpers.variables.checkIfParameter(name)) {
            throwE("unfinished")
        } else {
            outputCode.text.push(
                `mov \$${name}, ${reg}`
            )
        }
        return reg
    }
}

var allocations = {
    allocateStack: function (bytes, forceEbp = false) {
        if (helpers.general.scopeHasIterable() && !forceEbp) {

            debugPrint("ALLOCING - DR", bytes, currentStackOffset)
            outputCode.autoPush(
                `sub \$${bytes}, %esp`,
            )
            return `%esp`
        } else {
            //throwE(bytes)
            currentStackOffset = (helpers.general.getMostRecentFunction().data.totalAlloc += bytes)
            debugPrint("ALLOCING", bytes, currentStackOffset)
            return `-${currentStackOffset}(%ebp)`
        }
        // var lbl = helpers.variables.newTempLabel(defines.types.p32)
        // createStackVariableListOnly(lbl, newStackVar(defines.types.p32)) //not actually for use, just for knowing the offset
        // currentStackOffset += bytes
        //return lbl
    },
    hasUsedMmap: false,
    allocateMmap: function (bytes) {
        //debugPrint("PUSHING")
        assembly.pushClobbers()
        assembly.pushToStack(bytes, defines.types.u32)
        outputCode.autoPush(
            `call __allocate__`,
            `add $4, %esp`
        )
        assembly.popClobbers()
        if (!this.hasUsedMmap) {
            autoIncludes.push(mainDir + "/libs/alloc.s")
            this.hasUsedMmap = true
        }
        return "%eax"
    },
    allocateData: function (bytes) {
        var lbl = helpers.variables.newUntypedLabel()
        outputCode.data.push(`.comm ${lbl}, ${bytes}, 4`);
        outputCode.autoPush(`mov \$${lbl}, %eax`)
        return "%eax"
    },
    allocateAuto: function (bytes, forceEbpIfStack = false) {
        if (bytes >= 4096 || currentStackOffset > 1e6 || nextAllocIsPersistent || scope.length == 0) {
            if (scope.length == 0) {
                return this.allocateData(bytes)
            } else {
                nextAllocIsPersistent = false;
                return this.allocateMmap(bytes)
            }
        } else {
            return this.allocateStack(bytes, forceEbpIfStack)
        }
    },
    newStringLiteral: function (value) {
        var label = helpers.formatters.stringLiteral(helpers.counters.stringLiterals++)
        outputCode.data.push(
            `${label}: .asciz "${value}"`
        )
        globalVariables[label] = newGlobalVar(defines.types.p8)
        return label
    },
    allocateArray: function (arr) {
        arr = arr.slice(1, arr.length - 1)
        var allocLbl = allocations.allocateAuto(arr.filter(x => x != ",").length * 4)
        var globalAlloc = true
        var ebpOff;
        if (helpers.types.stringIsEbpOffset(allocLbl)) {
            globalAlloc = false
            ebpOff = parseInt(helpers.types.getOffsetFromEbpOffsetString(allocLbl))
        }

        //throwE(allocLbl)

        var onComma = false
        arr.forEach((x, i) => {
            if (onComma) {
                if (x != ",") {
                    throwE(`Expected comma in array allocation: [${arr.join(",")}]`)
                }
            } else {
                if (x == ",") {
                    throwE(`Did not expect comma in array allocation: [${arr.join(",")}]`)
                }
                if (globalAlloc) {
                    assembly.optimizeMove(x, `${i * 2}(${allocLbl})`, helpers.types.guessType(x), defines.types.u32)
                } else {
                    //throwE(ebpOff)
                    assembly.optimizeMove(x, `-${ebpOff - (i * 2)}(%ebp)`, helpers.types.guessType(x), defines.types.u32)
                }

            }
            onComma = !onComma
        })

        var out = helpers.registers.getFreeLabelOrRegister(defines.types.p32)
        if (globalAlloc) {
            outputCode.autoPush(
                `mov ${allocLbl}, ${out}`
            )
        } else {
            outputCode.autoPush(
                `mov %ebp, %eax`,
                `sub \$${ebpOff}, %eax`,
                `mov %eax, ${out}`
            )
        }
        return { out, len: arr.length }
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
        parr.forEach(x => {
            if (onCom) {
                if (didVari)
                    throwE("Cannot have parameters declared after variadic ellipsis")
                if (x != ',')
                    throwE(`Expected comma at word "${x}" in ${parr}`)
            } else if (x == "...") {
                didVari = true
            } else {
                var type = popTypeStack(true)
                robj.push({ name: x, type })
                oBytes += helpers.types.typeToBytes(type)
            }
            onCom = !onCom
        })
        return { params: robj, oBytes, didVari }
    },
    createFunction: function (fname) {
        outputCode.text.push(
            fname + ":",
            `push %ebp`,
            `mov %esp, %ebp`,
            `sub \$${helpers.formatters.fnAllocMacro(fname)}, %esp`
        )

    },
    closeFunction: function (sc, st, asRet = false, rVal = null) {
        var d = sc.data
        debugPrint("SC", scope, rVal)
        if (rVal != null) {
            assembly.setRegister(rVal, "a", defines.types.u32)
        }

        outputCode.text.push(
            `mov %ebp, %esp`,
            `pop %ebp`,
            `ret`
        )

        if (!asRet) {
            outputCode.data.push(
                `${helpers.formatters.fnAllocMacro(d.name)} = ${d.totalAlloc}`
            )


            Object.entries(st).forEach(sv => {
                outputCode.text.push(
                    `# ${sv[0]}: ${sv[1].offset}`
                )
            })
        }
        //throwE(st)
    },
    callFunction: function (fname, args) {
        var onCom = false
        var variadic = userFunctions[fname].variadic
        //throwE(fname, args)
        var bytes = 0
        var tbuff = []

        assembly.pushClobbers()

        outputCode.comment(`Calling function ${fname}`)
 
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
                    throwE(`Function '${fname}' given too many arguments`)
                }

                if (!helpers.types.isConstant(x) && ((variadic && (expectedType != undefined && !objectCompare(expectedType, givenType))) || (!variadic && !objectCompare(expectedType, givenType))))
                    throwE(`Argument '${x}' does not match expected type ${JSON.stringify(expectedType)}`)

                if (helpers.types.isConstOrLit(x)) {
                    tbuff.push(`pushl \$${x}`)
                } else if (helpers.types.stringIsRegister(x)) {
                    tbuff.push(`push ${helpers.types.conformRegisterIfIs(x, defines.types.u32)}`)
                }
                else {

                    //debugPrint("FMTING", givenType, x)
                    var r = helpers.types.formatRegister('d', givenType)
                    //debugPrint("erijgoewije", r)

                    var bbuff = []
                    if (r != "%edx")
                        bbuff.push("xor %edx, %edx")

                    // if(helpers.types.stringIsRegister(x))
                    // {
                    //     throwE(x, r, fname, args, givenType)
                    // }
                    bbuff.push(
                        `mov ${x}, ${r}`,
                        `push %edx`
                    )
                    tbuff.push(bbuff)
                }
                bytes += 4
                ind++
            }
            onCom = !onCom
        })

        outputCode.autoPush(...tbuff.reverse().flat())
        var rt = userFunctions[fname].returnType
        // TODO HERE BROKEN : writing "true" instead breaks it. No idea
        var out = helpers.registers.getFreeLabelOrRegister(rt, false)
        //throwE(out, helpers.types.guessType("%ebx"))

        outputCode.autoPush(
            `call ${fname}`,
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
                `mov ${index + 8}(%ebp), ${out}`
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
            //throwE(userFormats[fname].size)

            // FIXED? // old: temporarily disabled stack allocations since if you do loops it will be overriting the same thing
            var allocLbl = allocations.allocateAuto(userFormats[fname].size)
            //var allocLbl = allocations.allocateAuto(userFormats[fname].size)          // what it's allocated into

            if (helpers.types.stringIsEbpOffset(allocLbl)) // local. Intheory this will never happen?
            {
                throwE("Compiler shouldn't be here")
                //throwE(allocLbl, parr)
                var allocOffset = parseInt(helpers.types.getOffsetFromEbpOffsetString(allocLbl))
                var saveLbl = helpers.registers.getFreeLabelOrRegister(defines.types.u32) // what it's saved in

                outputCode.autoPush(`mov \$${allocOffset}, ${saveLbl} # Local allocation address for ${fname}`)
                //throwE(outputCode)

                var off = 0
                userFormats[fname].properties.forEach(p => {
                    var value = passed[p.name]
                    if (value == undefined) {
                        throwE(`Property ${p} not given`);
                    }
                    debugPrint("LOCFFSET", off, helpers.types.typeToBytes(p.type))
                    assembly.optimizeMove(value, `-${off + allocOffset + helpers.types.typeToBytes(p.type)}(%ebp)`, helpers.types.guessType(value), p.type)

                    off += helpers.types.typeToBytes(p.type)
                })
                return saveLbl
            } else { // global
                var saveLbl = helpers.registers.getFreeLabelOrRegister(defines.types.u32)
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

                    off += helpers.types.typeToBytes(p.type)
                })
                return saveLbl
            }


        }
    }
}

module.exports = {
    assembly,
    variables,
    allocations,
    functions,
    formats,
}