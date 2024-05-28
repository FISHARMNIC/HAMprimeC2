var assembly = {
    setRegister: function (value, register, type, low = false) {
        var r = helpers.types.formatRegister(register, type, low)
        outputCode.autoPush(`mov ${helpers.types.formatIfConstant(value)}, ${r}`)
        return r
    },
    pushToStack: function (value) {
        if (helpers.types.isConstant(value)) {
            outputCode.autoPush(`pushl \$${value}`)
        } else {
            this.setRegister(value, 'a', defines.types.u32)
            outputCode.autoPush(`pushl %eax`)
        }
        currentStackOffset += 4
    },
    getStackOffset: function (variable) {
        return currentStackOffset - 4 - getAllStackVariables()[variable].offset
    }
}

var variables = {
    create: function (vname, type, value, onStack = scope.length != 0) {
        if (onStack) // inside of a function
        {
            value = helpers.types.formatIfConstant(value)
            if(objectIncludes(getAllStackVariables(), vname))
            {
                throwE(`Variable "${vname}" already defined`)
            }
            createStackVariableListOnly(vname, newStackVar(type))

            assembly.pushToStack(value) // store in stack
        } else { // outside of function, global variable
            if(objectIncludes(globalVariables, vname))
            {
                throwE(`Variable "${vname}" already defined`)
            }
            globalVariables[vname] = newGlobalVar(type)
            outputCode.data.push(
                `${vname}: ${helpers.types.typeToAsm(type)} ${value}`
            )
        }
        return vname
    },
    set: function(vname, value) {
        var isStack = helpers.variables.checkIfOnStack(vname) // ) // if stack var
        var type = helpers.variables.getVariableType(vname)
        var suffix = ""
        if(helpers.types.isConstant(value)){
            value = helpers.types.formatIfConstant(value)
            suffix = helpers.types.sizeToSuffix(type)
        } else {
            value = assembly.setRegister(value, 'd', type)
        }

        if(isStack)
        {
            outputCode.autoPush(`mov${suffix} ${value}, ${assembly.getStackOffset(vname)}(%esp)`)
        } else if(objectIncludes(globalVariables,vname)){       // if glob var
            outputCode.autoPush(`mov${suffix} ${value}, ${vname}`)
        } else {
            throwE(`Variable ${vname} has not been declared neither locally nor globally`)
        }
        return vname
    },
    read: function (vname) {
        var isStack = helpers.variables.checkIfOnStack(vname) // ) // if stack var
        if(isStack)
        {
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
    }
}

var allocations = {
    allocateStack: function (bytes) {
        outputCode.autoPush(
            `sub %esp, \$${bytes}`
        )
        return "%esp"
        // var lbl = helpers.variables.newTempLabel(defines.types.p32)
        // createStackVariableListOnly(lbl, newStackVar(defines.types.p32)) //not actually for use, just for knowing the offset
        // currentStackOffset += bytes
        //return lbl
    },
    allocateMmap: function (bytes) {
        outputCode.autoPush(
            `pushl \$${bytes}`,
            `call __allocate__`,
        )
        return "%eax"
    },
    allocateAuto: function (bytes) {
        if (bytes >= 4096 || currentStackOffset > 1e6 || nextAllocIsPersistent || scope.length == 0)
        {
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
    }

}

var functions = {

}

var formats = {
    parseParams: function(fname, parr)
    {
        
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
                if(value == undefined)
                {
                    throwE(`Property ${p} not given`);
                }


                console.log("eferfergegerwgerwg", value)
                value = helpers.types.conformRegisterIfIs(value, p.type)

                if(helpers.types.isConstant(value))
                {
                    outputCode.autoPush(`mov${helpers.types.sizeToSuffix(p.type)} \$${value}, ${off}(${allocLbl})`)
                } else {
                    var reg = helpers.types.formatRegister('d', p.type)
                    if(helpers.types.stringIsRegister)
                    outputCode.autoPush(`mov ${value}, ${off}(${allocLbl})`)
                    else 
                        outputCode.autoPush(`mov ${value}, ${reg}; mov ${reg}, ${off}(${allocLbl})`)
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