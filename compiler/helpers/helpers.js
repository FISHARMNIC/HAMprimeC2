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
    formatIfLiteral: function (x) {
        if (x.substring(0, 8) == "__STRING") {
            return "$" + x
        }
        return x
    },
    isConstOrLit: function (x) {
        return (x.substring(0, 8) == "__STRING" || this.isConstant(x))
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
    typeToBytes: function (x) {
        return this.typeToBits(x) / 8
    },
    sizeToSuffix: function (x) {
        var t = this.typeToBits(x)
        if (t == 32) return 'l'
        if (t == 16) return 'w'
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
    stringIsRegister: function (str) {
        return str[0] == "%" && (str.length == 3 || str.length == 4)
    },
    stringIsEspOffset: function (str) {
        return str.substring(str.indexOf("(")) == "(%esp)"
    },
    getOffsetFromEspOffsetString: function (str) {
        return str.substring(0, str.indexOf("("))
    },
    getRegisterType: function (register) {
        if (register.includes("%x") || register.includes("di") || register.includes("si") || register.includes("bp") || register.includes("sp")) {
            if (register.includes("%e")) {
                return defines.types.u32
            }
            return defines.types.u16
        }
        return defines.types.u8
    },
    conformRegisterIfIs: function (register, type) {
        if (this.stringIsRegister(register)) {
            if (register.includes("di")) {
                return this.formatRegister('i', type)
            }
            else if (register.length == 3) // %ax, %bl, %si
            {
                return this.formatRegister(register[1], type)
            } else {                      // %eax, %ebx, %esi,
                return this.formatRegister(register[2], type)
            }
        }
        return register
    },
    getVariableFromEspOffsetString: function (word) {
        return variables.getStackVariableWithOffset(currentStackOffset - 4 - (this.getOffsetFromEspOffsetString(word)))
    },
    guessType: function (word) {
        word == String(word)
        if (variables.variableExists(word)) {
            return variables.getVariableType(word)
        } else if (this.stringIsEspOffset(word)) {
            debugPrint((currentStackOffset - 4 - (this.getOffsetFromEspOffsetString(word))), currentStackOffset, this.getOffsetFromEspOffsetString(word))
            return this.getVariableFromEspOffsetString(word).type
        } else if (this.stringIsRegister(word)) {
            return this.getRegisterType(word)
        }
        return defines.types.u32
    }
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
        return scope.length != 0 && objectIncludes(getAllStackVariables(), vname) // ) // if stack var
    },
    getVariableType(vname) {
        return this.checkIfOnStack(vname) ? getAllStackVariables()[vname].type : globalVariables[vname].type
    },
    variableExists(vname) {
        return this.checkIfOnStack(vname) || objectIncludes(globalVariables, vname)
    },
    newTempLabel: function (type) {
        var lbl = formatters.tempLabel(type, counters.tempLabels.current[types.typeToBits(type)]++)
        globalVariables[lbl] = newGlobalVar(type)
        return lbl
    },
    getStackVariableNameWithOffset(offset) {
        var gaf = getAllStackVariables()

        return Object.keys(gaf)[Object.values(gaf).findIndex(x => {
            return x.offset == offset
        })]
    },
    getStackVariableWithOffset(offset) {
        return getAllStackVariables()[this.getStackVariableNameWithOffset(offset)]
    },
}

var registers = {
    inLineClobbers: {
        'b': 0, // ax is reserved for function returns
        'c': 0, // dx is reserved for other stuff
        's': 0,
        'i': 0, // edi
    },
    clearClobbers: function () {
        this.inLineClobbers = {
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
                {
                    this.inLineClobbers[x[0]] = 1
                }        
                return false
            }
            return true
        })
        return register
    },
    getFreeLabelOrRegister: function (type, clobber = true) {
        var reg = this.getFreeRegister(clobber);
        if (reg != -1) {
            return types.formatRegister(reg, type)
        }
        return variables.newTempLabel(type)
    },
    clobberRegister: function(register) {
        this.inLineClobbers[register] = 1
    },
    registerStringToLetterIfIs(rstr) {
        if(types.stringIsRegister(rstr)) {
            if(rstr.includes("di")) {
                return 'i'
            } else if(rstr.includes("si")) {
                return 's'
            }
            else if(rstr.length == 4) {
                return rstr[2]
            } else {
                return rstr[1]
            }
        }
        return rstr
    }
}

var formats = {
    propertyOffset: function (fname, pname) {
        var offset = 0
        userFormats[fname].properties.findIndex(e => {
            if (e.name == pname)
                return true

            offset += types.typeToBits(e.type)
            return false
        })
        return offset
    },
    getFormatSize: function (props) {

        var offset = 0;
        props.forEach(e => {
            offset += types.typeToBits(e.type)
        })
        return offset / 8
    }
}

module.exports = {
    types, formatters, variables, registers, counters, formats
}