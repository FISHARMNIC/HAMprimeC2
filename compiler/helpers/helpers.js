var counters = {
    stringLiterals: 0,
    untypedLabels: 0,
    anonLabels: 0,
    tempLabels: {
        max: {
            "8": 0,
            "16": 0,
            "32": 0
        },
        current: {
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
    },
    constructors: 0 // make better later, one for each format
}

var types = {
    throwDynToStaticErr: function(vt, dt)
    {
        throwE(`Assigning "${helpers.types.convertTypeObjToName(vt)}" to an value expecting a static "${helpers.types.convertTypeObjToName(dt)}"`)
    },
    throwStaticToDynErr: function(vt, dt)
    {
        throwE(`Assigning "${helpers.types.convertTypeObjToName(vt)}" to an value expecting a dynamic "${helpers.types.convertTypeObjToName(dt)}"`)
    },
    areEqual: function (a, b) {
        //console.log()
        var aHas = ("formatPtr" in a)
        var bHas = ("formatPtr" in b)
        var aName = (aHas && a.formatPtr != null) ? a.formatPtr.name : null
        var bName = (bHas && b.formatPtr != null) ? b.formatPtr.name : null
        var fmteq = aName == bName
        return (
            a.size == b.size &&
            a.float == b.float &&
            a.pointer == b.pointer &&
            a.special == b.special &&
            a.dblRef == b.dblRef &&
            fmteq &&
            a.hasData == b.hasData &&
            a.advptr == b.advptr &&
            a.elementsHaveData == b.elementsHaveData
        )
    },
    convertTypeObjToName: function (type) {
        var name = null;
        Object.entries(defines.types).every(x => {
            if (this.areEqual(type, x[1])) {
                name = x[0]
                return false
            }
            return true
        })


        if (name == null) {
            if ("formatPtr" in type) {
                name = type.formatPtr.name
            } else if ("advptr" in type) {
                if (type.size == 8)
                    name = "string"
            }

        }
        if ("hasData" in type) {
            name += ":dynamic"
        } else {
            name += ":borrowed"
        }
        return name
    },
    derefType: function (type) {
        //console.log("deref", type)
        var c = objCopy(type)

        if("arrayElements" in type)
        {
            c = type.arrayElements
            //throwW("deref array experimental", c)
            return c
        }
        //if(!("advptr" in type)) // IF BROKEN UNCOMMENT HERE OCT 18 2024
            c.pointer = false
        if("hasData" in type)
        {
            if("elementsHaveData" in type)
            {
                delete c.elementsHaveData
            }
            else
            {
                delete c.hasData
            }
        }
        //console.log("-> into", c)
        return c
    },
    isLiteral: function (x) {
        return x.substring(0, 8) == "__STRING"
    },
    isDynamic: function(t)
    {
        return("hasData" in t)
    },
    isConstant: function (x) {
        return parseFloat(x) == x
    },
    formatIfConstant: function (x) {
        return this.isConstant(x) ? "$" + x : x
    },
    formatIfLiteral: function (x) {
        if (this.isLiteral(x)) {
            return "$" + x
        }
        return x
    },
    isStringOrConststrType: function(x) {
        return "advptr" in x && x.size == 8 && x.pointer
    },
    isConstOrLit: function (x) {
        return (x.substring(0, 8) == "__STRING" || this.isConstant(x) || objectIncludes(userFunctions, x))
    },
    formatIfConstOrLit: function (x) {
        if (this.isConstOrLit(x)) {
            return "$" + x
        }
        return x
    },
    typeToAsm: function (x) {
        //console.log("::::", x.size)
        if (x.float || "formatPtr" in x) {
            return `.4byte`
        }
        if (x.special) {
            // TODO: special asm parsing
            // relic of the past. Delete this
            throwE("Not finished")
        } else {
            if (x.pointer) {
                return `.4byte`
            } else {

                return `.${x.size / 8 == 1 ? "" : x.size / 8}byte`
            }
        }
    },
    typeToBits: function (x) {
        if (x.pointer || "formatPtr" in x) return 32 // HERE IF BROKEN Mar 12 2023 delete || x.templatePre != undefined
        return parseInt(x.size)
    },
    typeToBytes: function (x) {
        return this.typeToBits(x) / 8
    },
    typeToBytesWithFmts: function (type) {
        if ("formatPtr" in type) {
            return formats.getFormatSize(type.formatPtr.properties)
        } else {
            return this.typeToBytes(type)
        }
    },
    checkIfElementsHaveData: function(type)
    {
        if("arrayElements" in type)
        {
            return("hasData" in (type.arrayElements))
        }
        else
        {
            //throwW("[INTERNAL] elementsHaveData is being deprecated")
            return("elementsHaveData" in type)
        }
    },
    sizeToSuffix: function (x) {
        var t = this.typeToBits(x)
        if (t == 32) return 'l'
        if (t == 16) return 'w'
        if (t == 8) return 'b'
        throwE("Unknown type", x)
    },
    formatRegister: function (register, type, low = true) {

        //debugPrint("REG", register, type)
        var endLetter;
        if (register == 's' || register == 'i') {
            endLetter = 'i'
        } else if (register == 'p') {
            endLetter = 'p'
        } else {
            endLetter = 'x'
        }

        if (register == 'i')
            register = 'd' // edi NOT edx
        if (register == 'p')
            register = 'b'

        if (type == undefined) {
            throwE("[COMPILER ERROR] Got undefined type. Most likely syntax error")
        }

        if (type.formatPtr != undefined) { // format register for a format / struct
            return `%e${register}${endLetter}`
        } else {
            if ("formatPtr" in type || type.pointer || type.size == 32) return `%e${register}${endLetter}`
            if (type.size == 16) {
                return `%${register}${endLetter}`
            }
            if (type.size == 8) {
                if (register == "s" || register == "i")
                    throwE("[INTERNAL ERROR] Attempting to accept 8bit esi or edi")

                return low ? `%${register}l` : `%${register}h`
            }
            throwE("Unknown type [" + JSON.stringify(type) + "]")
        }
    },
    stringIsRegister: function (str) {
        return str[0] == "%" && (str.length == 3 || str.length == 4)
    },
    stringIsEsp: function (str) {
        return str == "%esp"
    },
    stringIsEbpOffset: function (str) {
        debugPrint("============", str)
        if (String(str) == "undefined")
            throwE("[INTERNAL ERROR] Got undefined")
        return str.substring(str.indexOf("(")) == "(%ebp)"
    },
    stringIsMemoryReference: function(str)
    {
        return(this.stringIsEbpOffset(str) || objectIncludes(globalVariables,str) || this.isConstOrLit(str))
    },
    getOffsetFromEbpOffsetString: function (str) {
        return str.substring(str[0] == "-" ? 1 : 0, str.indexOf("("))
    },
    getOffsetFromEbpOffsetStringNoAbs: function (str) {
        return parseInt(str.substring(0, str.indexOf("(")))
    },
    getRegisterType: function (register, raw = false) {
        if (register.includes("x") || register.includes("di") || register.includes("si") || register.includes("bp") || register.includes("sp")) {
            if (register.includes("%e")) {
                var l = registers.registerStringToLetterIfIs(register)
                if (!raw) {
                    return registers.extendedTypes[l]
                }
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
            } else if (register.includes("bp")) {
                return this.formatRegister('p', type)
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
    getVariableFromEbpOffsetString: function (word) {
        if (!word.includes("-")) {
            //throwE(functions.getParameterWithOffset(this.getOffsetFromEbpOffsetString(word)))
            return functions.getParameterWithOffset(this.getOffsetFromEbpOffsetString(word))
        }
        return variables.getStackVariableWithOffset(this.getOffsetFromEbpOffsetString(word))
    },
    convertTypeToHasData: function (type) {
        type = objCopy(type)
        type.hasData = true
        return type
    },
    guessType: function (word) {
        word = String(word)

        //console.log(":::", word, variables.variableExists(word),)
        if (variables.variableExists(word)) {
            //throwE(globalVariables[word])
            return objCopy(variables.getVariableType(word))
        } else if (this.stringIsEbpOffset(word)) {
            return objCopy(this.getVariableFromEbpOffsetString(word).type)
        } else if (this.stringIsRegister(word)) {
            return objCopy(this.getRegisterType(word))
        } else if (variables.checkIfParameter(word)) {
            return functions.getParameterType(word)
        }
        if (nextNumIsFloat) {
            nextNumIsFloat = false
            return objCopy(defines.types.f32)
        }
        return objCopy(defines.types.u32)
    },
    extractTypeFromConstructorName: function (word) {
        if (word.includes("__constructor_") && word[word.length - 1] == "_") {
            var i = 0;
            word = word.slice(14).split("").reverse()
            word = word.map(x => {
                if (i < 2) {
                    if (x == "_")
                        i++
                    return ""
                }
                return x
            }).filter(x => x).reverse().join("")

            return defines.types[word]
        }
    }
}

var formatters = {
    stringLiteral: function (number) {
        return `__STRING${number}__`
    },
    anonymousFunction: function(number) {
        return `__anonymous_${number}__`
    },
    tempLabel: function (type, number) {
        return `__TEMP${types.typeToBits(type)}_${number}__`
    },
    fnAllocMacro: function (fname) {
        return `__ALLOCFOR_${fname}__`
    },
    untypedLabel: function (number) {
        return `__LABEL${number}__`
    },
    formatAllocMacro: function (format) {
        return `__SIZEOF_${format}__`
    },
    formatConstructorName: function (formatName) {
        return `__constructor_${formatName}_${counters.constructors++}_`
    },
    formatMethodName: function (formatName, methodName) {
        return `__method_${formatName}_${methodName}_`
    },
    formatOperatorName: function (formatName, operator) {
        //operator = formats.checkOperatorIsAccepted(operator)
        return `__operator_${formatName}_${operator}_`
    }
}

var variables = {
    genTempLabels: function () {
        Object.entries(counters.tempLabels.max).forEach((e, ind) => {
            for (var i = 0; i < e[1]; i++) {
                outputCode.data.push(`__TEMP${e[0]}_${i}__: .${parseInt(e[0]) / 8}byte 0`)
            }
        })
    },
    checkIfOnStack: function (vname) {
        return scope.length != 0 && objectIncludes(getAllStackVariables(), vname) // ) // if stack var
    },
    getVariableType: function (vname) {
        if (this.checkIfOnStack(vname)) {
            return getAllStackVariables()[vname].type
        }
        else if (this.checkIfParameter(vname)) {
            throwE("WIP")
            //return 
        } else {
            //console.log("EEEEE", globalVariables)
            var r = globalVariables[vname]
            if (r == undefined) {
                throwE(`Variable "${vname}" does not exist`)
            }
            if (r.type == undefined) {
                throwW(`[INTERNAL WARN], "${vname}" seems to not have .type property. Most likely issue with __this__`)
                return r
            }
            return r.type
        }
        //return this.checkIfOnStack(vname) ? getAllStackVariables()[vname].type : globalVariables[vname].type
    },
    setVariableType(vname, newType) {
        if (this.checkIfOnStack(vname)) {
            getAllStackVariables()[vname].type = newType
        }
        else if (this.checkIfParameter(vname)) {
            throwE("WIP")
            //return 
        } else {
            return globalVariables[vname].type = newType
        }
    },
    getStackVarOffset: function (vname) {
        return getAllStackVariables()[vname].offset
    },
    variableExists(vname) {
        return this.checkIfOnStack(vname) || objectIncludes(globalVariables, vname)
    },
    newTempLabel: function (type) {
        var lbl = formatters.tempLabel(type, counters.tempLabels.current[types.typeToBits(type)]++)
        globalVariables[lbl] = newGlobalVar(type)
        return lbl
    },
    newUntypedLabel: function () {
        return formatters.untypedLabel(counters.untypedLabels++)
    },
    getStackVariableNameWithOffset: function (offset) {
        var gaf = getAllStackVariables()

        return Object.keys(gaf)[Object.values(gaf).findIndex(x => {
            return x.offset == offset
        })]
    },
    getStackVariableWithOffset: function (offset) {
        return getAllStackVariables()[this.getStackVariableNameWithOffset(offset)]
    },

    checkIfParameter: function (word) {
        return (scope.length > 0 && (general.getMostRecentFunction() != undefined) && general.getMostRecentFunction().data.parameters.findIndex(x => x.name == word) != -1)
    }
}

var registers = {
    clobberOrder: ['s', 'c', 'i'],
    inLineClobbers: {
       // 'b': 0, // ax is reserved for function returns
        'c': 0, // dx is reserved for other stuff
        's': 0, // bx is reserved for math
        'i': 0, // edi
    },
    clearClobbers: function () {
        this.inLineClobbers = {
           // 'b': 0,
            'c': 0,
            's': 0,
            'i': 0,
        }
    },
    extendedTypes: {
        'a': defines.types.u32,
        'b': defines.types.u32,
        'c': defines.types.u32,
        'd': defines.types.u32,
        's': defines.types.u32,
        'i': defines.types.u32,
        's': defines.types.u32,
        'p': defines.types.u32,
    },
    resetExtendedTypes: function () {
        this.extendedTypes = {
            'a': defines.types.u32,
            'b': defines.types.u32,
            'c': defines.types.u32,
            'd': defines.types.u32,
            's': defines.types.u32,
            'i': defines.types.u32,
            's': defines.types.u32,
            'p': defines.types.u32,
        }
    },
    setExtendedType: function (register, type) {
        this.extendedTypes[register] = objCopy(type)
    },
    getFreeRegister: function (type, clobber = true) {
        var register = -1
        var bytes = types.typeToBytes(type)
        Object.entries(this.inLineClobbers).every((x, i) => {
            //throwE("CEHCK THIS LINE IF IT RIGHT")
            if (x[1] == 0 && (bytes != 1 ? true : !(x[0] == "s" || x[0] == "i"))) {
                register = x[0]
                if (clobber) {
                    this.inLineClobbers[register] = 1
                    //debugPrint("SETTTTTINGGGGG", register, type)
                }
                this.setExtendedType(register, type)
                return false
            }
            return true
        })
        return register
    },
    getFreeLabelOrRegister: function (type, clobber = true) {
        var reg = this.getFreeRegister(type, clobber);
        if (reg != -1) {
            return types.formatRegister(reg, type)
        }
        return variables.newTempLabel(type)
    },
    clobberRegister: function (register) {
        //if(register.length == 1)
        this.inLineClobbers[register] = 1
    },
    deClobberRegister: function (register) {
        if (register.length == 1)
            this.inLineClobbers[register] = 0
    },
    registerStringToLetterIfIs(rstr) {
        if (types.stringIsRegister(rstr)) {
            if (rstr.includes("di")) {
                return 'i'
            } else if (rstr.includes("si")) {
                return 's'
            } else if (rstr.includes("bp")) {
                return 'p'
            }
            else if (rstr.length == 4) {
                return rstr[2]
            } else {
                return rstr[1]
            }
        }
        return rstr
    }
}

var formats = {
    cannotUsePrivate: function(item)
    {
        return(!item.isPublic && !general.scopeHasFormat())
    },
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
    },
    checkOperatorIsAccepted: function (operator) {
        var accepted = ["add", "sub", "div", "mul", "mod", "shl", "shr", "index_set", "index_get"]
        if(!accepted.includes(operator))
        {
            throwE("Unsupported operator " + operator)
        }
        if(operator == "index_set" || operator == "index_get")
        {
            throwE("Indexing operator not implemented")
        }
        return operator
        /*
        var nonSymbols = ["index_set", "index_get"]
        if (operator == "+") {
            operator = "math_add"
        }
        else if (operator == "-") {
            operator = "math_sub"
        }
        else if (operator == "*") {
            operator = "math_mul"
        }
        else if (operator == "/") {
            operator = "math_div"
        }
        else if (operator == "%") {
            operator = "math_mod"
        }
        
        else if (!nonSymbols.includes(operator)) {
            throwE("Unsupported operator " + operator)
        }
        return operator
        */
    },
    convertOperatorToString: function (operator) {
        var nonSymbols = ["index_set", "index_get"]
        if (operator == "+") {
            operator = "add"
        }
        else if (operator == "-") {
            operator = "sub"
        }
        else if (operator == "*") {
            operator = "mul"
        }
        else if (operator == "/") {
            operator = "div"
        }
        else if (operator == "%") {
            operator = "mod"
        }
        else if (operator == "<<") {
            operator = "shl"
        }
        else if (operator == ">>") {
            operator = "shr"
        }
        
        else if (!nonSymbols.includes(operator)) {
            throwE("Unsupported operator " + operator)
        }

        return operator
    },
    seeIfIncludesOperator: function (fmt, operator)
    {
        var formattedName = formatters.formatOperatorName(fmt.formatPtr.name, operator)
        return Object.keys(fmt.formatPtr.operators).includes(formattedName)
    }
}

var functions = {
    newAnonFunctionLabel: function()
    {
        return formatters.anonymousFunction(counters.anonLabels++)
    },
    getParameterOffset: function (param) {
        var offset = 0
        debugPrint("-----------", param)
        general.getMostRecentFunction().data.parameters.some(x => {
            if (x.name == param) {
                return true
            }
            offset += 4
        })
        return offset
    },
    getParameterWithOffset: function (offset) {
        offset -= 8
        return general.getMostRecentFunction().data.parameters.find(x => {
            debugPrint(offset)
            if (offset == 0) {
                return true
            }
            offset -= 4
            return false
        })
    },
    getParameterType: function (pname) {
        return general.getMostRecentFunction().data.parameters.find(x => {
            if (x.name == pname) {
                return true
            }
            return false
        })
    }
}


var general = {
    isReserved: function (word) {
        return (objectIncludes(defines.types, (word)) || defines.keywords.includes(word))
    },
    getMostRecentFunction: function () {
        return(scope.slice().reverse().find(x => {
            //debugPrint("3333333", x)
            return x.type == keywordTypes.FUNCTION || x.type == keywordTypes.METHOD || x.type == keywordTypes.CONSTRUCTOR || x.type == keywordTypes.OPERATOR
        }))
    },
    scopeHasIterable: function () {
        return scope.some(x => x.type == keywordTypes.WHILE || x.type == keywordTypes.FOREACH)
    },
    scopeHasFormat: function () {
        return scope.some(x => x.type == keywordTypes.FORMAT)
    },
    setModifiesThis: function () {
        var fn = this.getMostRecentFunction()
        var fnName = fn.data.name
        var e = scope.find(e => e.data.name == fnName)
        e.data.modifiesThis = true
        userFunctions[fnName].modifiesThis = true
    }
}
module.exports = {
    types, formatters, variables, registers, counters, formats, functions, general
}