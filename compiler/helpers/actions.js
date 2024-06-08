var assembly = {
    setRegister: function (value, register, type, low = true) {
        debugPrint("setting", register, value, type)
        var r = helpers.types.formatRegister(register, type, low)
        outputCode.autoPush(`mov ${helpers.types.formatIfConstant(value)}, ${r}`)
        return r
    },
    optimizeMove(source, destination, sType, dType) {
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

            value = helpers.types.formatIfConstant(value)
            if (objectIncludes(getAllStackVariables(), vname)) {
                throwE(`Variable "${vname}" already defined`)
            }
            var off = allocations.allocateStack(helpers.types.typeToBytes(type)) // store in stack
            assembly.optimizeMove(value, off, type, type)
            createStackVariableListOnly(vname, newStackVar(type))

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
}

var allocations = {
    allocateStack: function (bytes) {
        scope.at(-1).data.totalAlloc += bytes
        currentStackOffset = scope.at(-1).data.totalAlloc
        debugPrint("ALLOCING", bytes, currentStackOffset)
        return `-${currentStackOffset}(%ebp)`
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
    allocateAuto: function (bytes) {
        if (bytes >= 4096 || currentStackOffset > 1e6 || nextAllocIsPersistent || scope.length == 0) {
            return this.allocateMmap(bytes)
            nextAllocIsPersistent = false;
        } else {
            return this.allocateStack(bytes)
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
                if(didVari)
                    throwE("Cannot have parameters declared after variadic ellipsis")
                if (x != ',')
                    throwE(`Expected comma at word "${x}" in ${parr}`)
            } else if(x == "...") {
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
        debugPrint("SC", scope)
        if(rVal != null)
        {
            assembly.setRegister(rVal, "a", d.returnType)
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
                    throwE(`Argument '${x}' does not match expected type ${expectedType}`)

                if (helpers.types.isConstOrLit(x)) {
                    tbuff.push(`pushl \$${x}`)
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
        var out = helpers.registers.getFreeLabelOrRegister(rt, false)

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

            // temporarily disabled stack allocations since if you do loops it will be overriting the same thing
            var allocLbl = allocations.allocateMmap(userFormats[fname].size)
            //var allocLbl = allocations.allocateAuto(userFormats[fname].size)          // what it's allocated into

            if (helpers.types.stringIsEbpOffset(allocLbl)) // local
            {
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
                outputCode.autoPush(`mov %eax, ${saveLbl} # Local allocation address for ${fname}`)

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