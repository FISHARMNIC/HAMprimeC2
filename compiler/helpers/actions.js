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
        return currentStackOffset - 4 - stackVariables[variable].offset
    }
}

var variables = {
    create: function (vname, type, value, onStack = scope != 0) {
        if (onStack) // inside of a function
        {
            value = helpers.types.formatIfConstant(value)
            if(objectIncludes(stackVariables, vname))
            {
                throwE(`Variable "${vname}" already defined`)
            }
            stackVariables[vname] = newStackVar(type)
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
            var type = stackVariables[vname].type
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
            `sub %esp, ${bytes}`
        )
        var lbl = helpers.variables.newTempLabel(defines.type.p32)
        stackVariables[lbl] = newStackVar(defines.type.p32)
        currentStackOffset += bytes
        return lbl
    },
    allocateMmap: function (bytes) {
        throwE("unfinished")
    },
    allocateAuto: function (value, bytes) {
        if (bytes >= 4096 || currentStackOffset > 1e6) // stack threshold
        {
            return allocateMmap(bytes)
        } else {
            return allocateStack(bytes)
        }
    },
    newStringLiteral: function (value) {
        var label = helpers.formatters.stringLiteral(counters.stringLiterals++)
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

}

module.exports = {
    assembly,
    variables,
    allocations,
    functions,
    formats,
}