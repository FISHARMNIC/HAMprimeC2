var assembly = {
    setRegister: function (value, register, type, low = true) {
        var r = helpers.types.formatRegister(register, type, low)
        outputCode.autoPush(`mov ${helpers.types.formatIfConstant(value)}, ${r}`)
        return r
    },
    pushToStack: function (value, type, dummy = false) {
        if (!dummy) {
            if (helpers.types.isConstant(value)) {
                outputCode.autoPush(`pushl \$${value}`)
            } else if (helpers.types.stringIsRegister(value)) {
                //debugPrint(type)
                outputCode.autoPush(`push ${helpers.types.conformRegisterIfIs(value, defines.types.u32)}`)
            } else {
                this.setRegister(value, 'd', type)
                outputCode.autoPush(`push %edx`)
            }
        }
        debugPrint("ALLOCATING 4", value)
        currentStackOffset += 4
    },
    getStackOffset: function (variable) {
        return currentStackOffset - 4 - getAllStackVariables()[variable].offset
    },
    getStackVarAsEsp(vname) {
        debugPrint("READING", vname, assembly.getStackOffset(vname), currentStackOffset, getAllStackVariables()[vname].offset)
        return `${assembly.getStackOffset(vname)}(%esp)`
    },
    pushClobbers: function () {
        Object.entries(helpers.registers.inLineClobbers).forEach(x => {
            if (x[1] == 1) {
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
            createStackVariableListOnly(vname, newStackVar(type))
            debugPrint(type)
            assembly.pushToStack(value, type) // store in stack
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
        var suffix = ""
        if (helpers.types.isConstant(value)) {
            value = helpers.types.formatIfConstant(value)
            suffix = helpers.types.sizeToSuffix(type)
        } else {
            value = assembly.setRegister(value, 'd', type)
        }

        if (isStack) {
            outputCode.autoPush(`mov${suffix} ${value}, ${assembly.getStackOffset(vname)}(%esp)`)
        } else if (objectIncludes(globalVariables, vname)) {       // if glob var
            outputCode.autoPush(`mov${suffix} ${value}, ${vname}`)
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
            
            assembly.setRegister(`${assembly.getStackOffset(vname)}(%esp)`, 'd', type)
            outputCode.autoPush(`mov ${dReg}, ${output}`)
            return output
        }
        return vname
    },
}

var allocations = {
    allocateStack: function (bytes) {
        outputCode.autoPush(
            `sub \$${bytes}, %esp`
        )
        return "%esp"
        // var lbl = helpers.variables.newTempLabel(defines.types.p32)
        // createStackVariableListOnly(lbl, newStackVar(defines.types.p32)) //not actually for use, just for knowing the offset
        // currentStackOffset += bytes
        //return lbl
    },
    allocateMmap: function (bytes) {
        assembly.pushToStack(bytes, defines.types.u32)
        outputCode.autoPush(
            `call __allocate__`,
        )
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
    deallocStack: function () {
        outputCode.autoPush(`add \$${Object.entries(stackVariables[stackVariables.length - 1]).length}, %esp`)
    }
}

var functions = {
    createParams: function (parr) {
        var onCom = false
        var robj = []
        var oBytes = 0;
        parr.forEach(x => {
            if (onCom) {
                if (x != ',')
                    throwE(`Expected comma at word "${x}" in ${parr}`)
            } else {
                var type = popTypeStack(true)
                robj.push({ name: x, type })
                oBytes += helpers.types.typeToBytes(type)
            }
            onCom = !onCom
        })
        return { params: robj, oBytes }
    },
    createFunction: function (fname) {
        assembly.pushToStack("%ebp", defines.types.u32, true)
        outputCode.text.push(
            fname + ":",
            `push %ebp`,
            `mov %esp, %ebp`,
        )
    },
    closeFunction: function (sc) {
        var d = sc.data
        outputCode.text.push(
            `mov %ebp, %esp`,
            `pop %ebp`,
            `ret`
        )
    },
    callFunction: function (fname, args) {
        var onCom = false
        var variadic = userFunctions[fname].variadic
        //throwE(fname, args)
        var bytes = 0
        var tbuff = []

        assembly.pushClobbers()

        outputCode.comment(`Calling function ${fname}`)

        args.forEach((x, ind) => {
            if (onCom) {
                if (x != ',')
                    throwE("Expected comma")
            } else {
                var expectedType = userFunctions[fname].parameters[ind]?.type
                debugPrint(x)
                var givenType = helpers.types.guessType(x)
                if (expectedType == undefined && !variadic) {
                    throwE(`Function '${fname}' given too many arguments`)
                }

                if ((variadic && (expectedType != undefined && !objectCompare(expectedType, givenType))) || (!variadic && !objectCompare(expectedType, givenType)))
                    throwE(`Argument '${x}' does not match expected type ${expectedType}`)

                if (helpers.types.isConstOrLit(x)) {
                    assembly.pushToStack(x, defines.types.u32, true)
                    tbuff.push(`pushl \$${x}`)
                }
                else {
                    //throwE(expectedType, givenType)
                    var r = helpers.types.formatRegister('d', givenType)

                    var bbuff = []
                    if (r != "%edx")
                        bbuff.push("xor %edx, %edx")

                    actions.assembly.pushToStack("%edx", defines.types.u32, true)
                    bbuff.push(
                        `mov ${x}, ${r}`,
                        `push %edx`
                    )
                    tbuff.push(bbuff)
                }
                bytes += 4
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
            var allocLbl = allocations.allocateAuto(userFormats[fname].size)          // what it's allocated into
            var saveLbl = helpers.registers.getFreeLabelOrRegister(defines.types.u32) // whar it's saved in
            outputCode.autoPush(`mov ${allocLbl}, ${saveLbl}`)
            //throwE(outputCode)

            var off = 0
            userFormats[fname].properties.forEach(p => {
                var value = passed[p.name]
                if (value == undefined) {
                    throwE(`Property ${p} not given`);
                }


                //console.log("eferfergegerwgerwg", value)
                value = helpers.types.conformRegisterIfIs(value, p.type)

                if (helpers.types.isConstant(value)) {
                    outputCode.autoPush(`mov${helpers.types.sizeToSuffix(p.type)} \$${value}, ${off}(${allocLbl})`)
                } else {
                    var reg = helpers.types.formatRegister('d', p.type)
                    if (helpers.types.stringIsRegister(value)) {
                        outputCode.autoPush(`mov ${value}, ${off}(${allocLbl})`)
                    }
                    else {
                        outputCode.autoPush(
                            `mov ${helpers.types.formatIfLiteral(value)}, ${reg}`,
                            `mov ${reg}, ${off}(${allocLbl})`)
                    }
                }

                off += helpers.types.typeToBytes(p.type)
            })
            return saveLbl
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