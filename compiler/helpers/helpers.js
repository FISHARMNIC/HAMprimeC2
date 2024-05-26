var counters = {
    stringLiterals: 0,
    tempLabels: {
        max: {
            "0": 0,
            "8": 0,
            "16": 0,
            "32": 0
        },
        current: {
            "0": 0,
            "8": 0,
            "16": 0,
            "32": 0
        }
    },
    setMaxTempLabels: function () {
        Object.entries(this.tempLabels.current).forEach(x => {
            var key = x[0]
            var val = x[1]
            if (val > this.tempLabels.max[key]) {
                this.tempLabels.max[key] = val
            }
            this.tempLabels.current[key] = 0;
        })
    }
}

var types = {
    isConstant: function (x) {
        return parseFloat(x) == x
    },
    formatIfConstant: function (x) {
        return this.isConstant(x) ? "$" + x : x
    },
    typeToAsm: function (x) {
        if (x.float) {
            return `.4byte`
        }
        if (x.special) {
            // TODO: special asm parsing
        } else {
            if (x.pointer) {
                return `.4byte`
            } else {
                return `.${x.size / 8 == 1 ? "" : x.size / 8}byte`
            }
        }
    },
    typeToBits: function (x) {
        if (x.pointer || x.templatePtr != undefined) return 32 // HERE IF BROKEN Mar 12 2023 delete || x.templatePre != undefined
        return parseInt(x.size)
    },
    sizeToSuffix: function (x) {
        var t = this.typeToBits(x)
        if (t == 32) return 'l'
        if (t == 16) return 's'
        if (t == 8) return 'b'
        throwE("Unknown type", x)
    },
    formatRegister: function (register, type, low = true) {
        var endLetter = register == 's' || register == 'i' ? 'i' : 'x'
        if (register == 'i')
            register = 'd' // edi NOT edx

        if (type.templatePtr != undefined) { // format register for a format / struct
            return `%e${register}${endLetter}`
        } else {
            if (type.pointer || type.size == 32) return `%e${register}${endLetter}`
            if (type.size == 16) return `%${register}${endLetter}`
            if (type.size == 8) return low ? `%${register}l` : `%${register}h`
            throwE("Unknown type [" + JSON.stringify(type) + "]")
        }
    },
}

var formatters = {
    stringLiteral: function (number) {
        return `__STRING${number}__`
    },
    tempLabel: function (type, number) {
        return `__TEMP${types.typeToBits(type)}_${number}__`
    }
}


var variables = {
    checkIfOnStack(vname) {
        return scope != 0 && objectIncludes(stackVariables, vname) // ) // if stack var
    },
    getVariableType(vname) {
        return this.checkIfOnStack(vname) ? stackVariables[vname].type : globalVariables[vname].type
    },
    variableExists(vname) {
        return this.checkIfOnStack(vname) || objectIncludes(globalVariables, vname)
    },
    newTempLabel: function (type) {
        var lbl = formatters.tempLabel(type, counters.tempLabels.current[types.typeToBits(type)]++)
        globalVariables[lbl] = newGlobalVar(type)
        return lbl
    },
}

var registers = {
    inLineClobbers: {
        'a': 0,
        'b': 0,
        'c': 0, // dx is reserved for other stuff
        's': 0,
        'i': 0, // edi
    },
    clearClobbers: function () {
        this.inLineClobbers = {
            'a': 0,
            'b': 0,
            'c': 0,
            's': 0,
            'i': 0,
        }
    },
    getFreeRegister: function (clobber = true) {
        var register = -1
        Object.entries(this.inLineClobbers).every((x, i) => {
            if (x[1] == 0) {
                register = x[0]
                if (clobber)
                    this.inLineClobbers[x[0]] = 1
                return false
            }
            return true
        })
        return register
    },
    getFreeLabelOrRegister: function (type) {
        var reg = this.getFreeRegister();
        if (reg != -1) {
            return types.formatRegister(reg, type)
        }
        return variables.newTempLabel(type)
    }
}

module.exports = {
    types, formatters, variables, registers, counters
}