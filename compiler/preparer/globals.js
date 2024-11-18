// yes, it uses globals

// global.objCopy = function (x) {
//     return JSON.parse(JSON.stringify(x))
// }

global.objCopy = function (x) {
    var new_ = structuredClone(x)

    if ("formatPtr" in x) {
        new_.formatPtr = x.formatPtr
    }

    return new_
}

global.newGlobalVar = function (type, info = {}) {
    return {
        type: objCopy(type),
        info
    }
}

// ONLY FOR HIGHLIGHTING IN IDE
global.__anyVarEverMade = []
global.__addToAnyVarEverMade = function (x) {
    if (!__anyVarEverMade.includes(x))
        __anyVarEverMade.push(x)
}

global.thisStack = []

thisStack.save = function () {
    thisStack.push(objCopy(globalVariables.__this__))
}

thisStack.restore = function () {
    globalVariables.__this__ = thisStack.pop()
}

global.MODE_DEBUG = false;
global.scope = [];
global.currentStackOffset = 0;
global.requestBracket = 0;
global.oldFormatAllocs = [] // for freeing registers in property chains like a.b.c.d
global.nextIsForward = false
global.macros = {
    TRUE: "1",
    FALSE: "0",
    NULL: "0",
    "this": "__this__"
}
global.allStringLiterals = {}
global.globalVariables = {           // Object : {variable name: type}
    "__this__": newGlobalVar(defines.types.u32),
    "___TEMPORARY_OWNER___": newGlobalVar(defines.types.u32),
    "__rc_triggerSegfaultOnNullOwnership__": newGlobalVar(defines.types.u8)
}
global.userFunctions = {           // Object : {function name: {func name, parameters[{param name , type},...]}, return type}
    "printf": {
        name: 'printf',
        parameters: [
            { name: "format", type: defines.types.conststr }
        ],
        variadic: true,
        returnType: defines.types.u32
    },
    "strcmp": {
        name: 'strcmp',
        parameters: [
            { name: "strA", type: defines.types.string },
            { name: "strB", type: defines.types.string }
        ],
        variadic: true,
        returnType: defines.types.u32
    },
    "sprintf": {
        name: 'sprintf',
        parameters: [
            { name: "destination", type: defines.types.p8 },
            { name: "format", type: defines.types.p8 }
        ],
        variadic: true,
        returnType: defines.types.u32
    },
    "dispose": {
        name: "dispose",
        parameters: [
            { name: "pointer", type: defines.types.p32 }
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "__allocate__": {
        name: "__allocate__",
        parameters: [
            { name: "size", type: defines.types.u32 }
        ],
        variadic: false,
        returnType: defines.types.p32
    },
    "__rc_collect__": {
        name: "__rc_collect__",
        parameters: [],
        variadic: false,
        returnType: defines.types.u32
    },
    "__rc_free_all__": {
        name: "__rc_free_all__",
        parameters: [],
        variadic: false,
        returnType: defines.types.u32
    },
    "__rc_quick_check__": {
        name: "__rc_quick_check__",
        parameters: [],
        variadic: false,
        returnType: defines.types.none
    },
    "malloc": {
        name: "malloc",
        parameters: [
            { name: "size", type: defines.types.u32 }
        ],
        variadic: false,
        returnType: defines.types.p32
    },
    "realloc": {
        name: "realloc",
        parameters: [
            { name: "pointer", type: defines.types.p32 },
            { name: "size", type: defines.types.u32 }
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "itos": {
        name: "itos",
        parameters: [
            { name: "number", type: defines.types.u32 },
        ],
        variadic: false,
        returnType: defines.types.string
    },
    "ftos": {
        name: "ftos",
        parameters: [
            { name: "number", type: defines.types.f32 },
        ],
        variadic: false,
        returnType: defines.types.string
    },
    "cptos": {
        name: "cptos",
        parameters: [
            { name: "constr", type: defines.types.conststr },
        ],
        variadic: false,
        returnType: defines.types.string
    },
    "strjoinmany": {
        name: "strjoinmany",
        parameters: [
            { name: "number", type: defines.types.u32 },
        ],
        variadic: true,
        returnType: defines.types.string
    },
    "strlen": {
        name: "strlen",
        parameters: [
            { name: "string", type: defines.types.string },
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "putch": {
        name: "putch",
        parameters: [
            { name: "char", type: defines.types.u8 },
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "sleep": {
        name: "sleep",
        parameters: [
            { name: "time", type: defines.types.u32 },
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "usleep": {
        name: "usleep",
        parameters: [
            { name: "time", type: defines.types.u32 },
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "rand": {
        name: "rand",
        parameters: [],
        variadic: false,
        returnType: defines.types.u32
    },
    "exit": {
        name: "exit",
        parameters: [
            { name: "code", type: defines.types.u32 }
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "quit": {
        name: "quit",
        parameters: [
            { name: "code", type: defines.types.u32 }
        ],
        variadic: false,
        returnType: defines.types.u32
    },
    "substr": {
        name: "substr",
        parameters: [
            { name: "src", type: defines.types.string },
            { name: "start", type: defines.types.u32 },
            { name: "end", type: defines.types.u32 }
        ],
        variadic: false,
        returnType: defines.types.string
    }
}
global.specialFunctions = {
    size: function (params) {
        throwE("todo")
    }
}
global.includeFileOff = 0
global.lineOwners = {}
global.userFormats = {}
global.stackVariables = [{}]
global.nextAllocIsTransient = false
global.nextAllocIsPersistent = false
global.defaultAutomaticOwnership = true
global.nextThingTakesOwnership = defaultAutomaticOwnership
global.inPublicMode = true
global.autoIncludes = []
global.outputCode = { // object with out data
    data: [],
    init: [],
    text: [],
    autoPush: function () {
        if (scope.length == 0)
            this.init.push(...arguments)
        else
            this.text.push(...arguments)

        var outGoing = { line: globalLine, caller: (new Error()).stack } //caller: arguments.callee.caller.name || "*unkown caller*"}
        if (lineOwners[this.text.length] == undefined) {
            lineOwners[this.text.length] = [outGoing]
        } else {
            lineOwners[this.text.length].push(outGoing)
        }

        debugPrint(outputCode.autoPush.caller.name, ...arguments)
    },
    comment: function () {
        this.autoPush("# " + [...arguments].join(" "))
    }
}
global.GCisEnabled = true
global.typeStack = [] // depricated
global.mostRecentIfStatement = []
global.arrayClamp = defines.types.u32
global.globalLine = 0;
global.inComment = false;
global.programRules = {
    DynamicArraysAllocateSize: true,
    StaticArraysAllocateSize: false,
    hasUsedMmap: false,
    defaultTransience: false,
    optimizeMemory: false,
    segfaultOnNullOwnership: false
}
global.nextNumIsFloat = false;
global.areaHasFloat = false;
global.keywordTypes = {
    FORMAT: 0,
    FUNCTION: 1,
    CONSTRUCTOR: 2,
    METHOD: 3,
    WHILE: 4,
    IF: 5,
    ARRAY: 6,
    OPERATOR: 7,
    FOREACH: 8
}

function _quickSplitLookahead(inputCode, line, build, n2, nest = []) {

    //console.log("STARTING WITH:", nest)
    if(line >= inputCode.length)
    {
        throwE(`[PARSER] Bracket was never closed`)
        // todo, trace back, maybe hold var that stores intial
    }

    var qline = parser.split(inputCode[line])

    build.push(inputCode[line])

    qline.forEach(x => {
        if (objectIncludes(n2, x)) {
            nest.push(n2[x]) // open brack
        }
        else if (objectValuesIncludes(n2, x)) { // close brack
            //console.log("-->", nest, x)
            if (nest[nest.length - 1] == x) {
                nest.pop()
            }
            else {
               // console.log(inputCode[line], x)
                throwE(`[PARSER] Unopened bracket on:`)
            }
        }
    })
    if (nest.length != 0) {
        throwW(`[PARSER] Unclosed bracket on:`)
        //console.log("CALLING WITH", nest)
        _quickSplitLookahead(inputCode, line + 1, build, n2, nest)
    }
    //console.log("---END FOUND---")
    // else
    // {
    //     return build
    // }
}

global.quickSplit = function (inputCode) {
    var q = inputCode.replace(/\n/g, ";").split(";").filter(x => x).map(x => x.trim())

    var n2 = objCopy(parser.nesters)
    delete n2["{"]

    for (var qlineNo = 0; qlineNo < q.length; qlineNo++) {
        // var qline = parser.split(q[qlineNo])
        global.globalLineConts = q[qlineNo]

        var build = []

        //console.log("### START", q[qlineNo])
        _quickSplitLookahead(q, qlineNo, build, n2)
        //console.log("### BUILD", build)
        if(build.length == 0)
        {
            throwE("[PARSER] Critical error")
        }
        q[qlineNo] = build.join("")
        q.splice(qlineNo + 1, build.length - 1)
        //console.log(q)
        /*
        qline.forEach(x => {
            if (objectIncludes(n2, x)) {
                nest.push(n2[x])
            }
            else if (objectValuesIncludes(n2, x)) {
                console.log("-->", nest, x)
                if (nest[nest.length - 1] == x) {
                    nest.pop()
                }
                else {
                    console.log(q[qlineNo], x)
                    throwE(`[PARSER] Unopened bracket on:`)
                }
            }
        })
        if (nest.length != 0) {
            throwW(`[PARSER] Unclosed bracket on:`)

        }
        */
    }
    //console.log(q)
    return q
}

global.getLastScopeType = function () {
    if (scope.length == 0)
        return -1
    return scope[scope.length - 1].type
}

global._saveRegs = function () {
    var pushed = []
    Object.entries(helpers.registers.inLineClobbers).forEach(pair => {
        if (pair[1] == 1) {
            var type = helpers.types.formatRegister(pair[0], defines.types.u32)
            pushed.push(type)
            outputCode.autoPush(`push ${type}`)
        }
    })
    return pushed
}

global._restoreRegs = function (pushed) {
    if (pushed == undefined) {
        throwE("[INTERNAL] Didn't push")
    }

    pushed.reverse().forEach(x => {
        outputCode.autoPush(`pop ${x}`)
    })
}

global.evalMath = function (arr, treater) {
    var old;

    do { // just keep nesting
        old = JSON.stringify(arr)
        if (arr.find(x => typeof (x) == "object") == undefined) { // only when the line has nothing left to nest is it evaluated
            if (arr.length == 1) {
                //console.log("SKIPPING single ", arr, " -> ", arr[0])
                return arr[0]
            }
            else {
                var out = treater(arr)
                //console.log("evaluated", arr, "->", out)
                return out
            }
        }
        else {
            for (var i = 0; i < arr.length; i++) {
                if (typeof (arr[i]) == "object") {
                    arr[i] = evalMath(arr[i], treater)
                }
            }
        }
    } while (old != JSON.stringify(arr))

}


global._deClob = function (tempClobs) {
    tempClobs.pop() // last one is the one to keep
    tempClobs.forEach(x => {
        if (helpers.types.stringIsRegister(x)) {
            var rLetter = helpers.registers.registerStringToLetterIfIs(x)
            //console.log("freeing", rLetter)
            helpers.registers.deClobberRegister(rLetter)
        }
    })
}

global.formatMath_helper = function (oldArr) {
    // todo, add shift, bitwise OR and AND, and rotate
    var trumpOps = ["*", "/", "%"]
    var lowerOps = ["+", "-", "<<", ">>"]
    var allOps = [...trumpOps, ...lowerOps]

    var onOperator = false;

    var arr = objCopy(oldArr)

    var last = arr[arr.length - 1]
    if (allOps.includes(last)) {
        throwE(`Math statement ends on operator "${last}"`)
    }

    var i = 0
    for (; i < arr.length; i++) {
        var e = arr[i]
        if (onOperator) {
            var previous = arr[i - 1]
            var next = arr[i + 1]
            if (!(allOps.includes(e))) {
                throwE(`Expected an operator, but got "${e}"`)
            }

            if (trumpOps.includes(e)) {
                var subArr = [previous, e, next]
                arr.splice(i - 1, 3, subArr)
            }
        }
        else {
            if (allOps.includes(e)) {
                throwE(`Did not expect an operator, but got "${e}"`)
            }
        }
        onOperator = !onOperator;
    }

    // throwE(arr)

    //console.log("TREATING", arr)
    return arr
    //var o = evalMath(arr, true)
    //console.log("ret", o)
    //return o

}

global.formatMath = function (arr) {
    var looper = formatMath_helper(arr)
    while (JSON.stringify(looper) != JSON.stringify(formatMath_helper(looper))) {
        looper = formatMath_helper(looper)
    }
    return looper
}


global.newScope = function (rb) {
    if (rb.stackVariables == undefined) {
        rb.stackVariables = {}
    }
    stackVariables.push(objCopy(rb.stackVariables))
    scope.push(objCopy(rb))
}

global.createStackVariableListOnly = function (vname, type) {
    stackVariables.at(-1)[vname] = objCopy(type)
}

global.getAllStackVariables = function () {
    var obj = {}
    stackVariables.forEach(inner_obj => {
        Object.entries(inner_obj).forEach(pair => {
            obj[pair[0]] = pair[1]
        })
    })
    return obj
}

function removeTabs(e) {
    return e.split("").map(x => x == "\t" ? "" : x).join("")
    // e = e.split("")
    // var flag = false
    // //console.log(`\n==========${e}==========\n`)
    // e = e.map(x => {
    //     //console.log(`Checking ${x}, ${flag}`)
    //     if (flag) {
    //         return x
    //     }
    //     if (x == " ") {
    //         return ""
    //     }
    //     flag = true
    //     return x
    // }).filter(x => x)
    // return e.join("")
}

global.getTrueLine = function (execFileLikeTrue, line) {
    var lineRead = -1
    var lookAtFile = -1;
    //console.log(":::", execFileLikeTrue)
    while (lineRead != line && execFileLikeTrue[lookAtFile + 1] != undefined) {
        lookAtFile++
        lineRead++
        //console.log(execFileLikeTrue[lookAtFile])
        execFileLikeTrue[lookAtFile] = removeTabs(execFileLikeTrue[lookAtFile])
        //console.log("::::", execFileLikeTrue[lookAtFile], lineRead, lookAtFile)
        while (execFileLikeTrue[lookAtFile].length == 0) //skip
        {
            lookAtFile++
        }
    }
    if (lookAtFile == -1) {
        console.log("UNABLE TO TRACK LINE")
        process.exit(1)
    }
    return lookAtFile

}

global.debugPrint = function () {
    if (MODE_DEBUG)
        console.log("\033[92m[DEBUG]\033[0m", ("\033[96m" + (debugPrint.caller.name || "*unkown caller*") + "\033[0m").padEnd(32), ...arguments);
}

function drawColLine(l, isError = false) {
    if (l - 1 < 0 || l - 1 > inputCodeLikeTrue.length - 1) return
    console.log("\033[93m" + String(l).padEnd(4) + "\033[0m: ", inputCodeLikeTrue[l - 1], isError ? "\033[33m<<HERE\033[0m" : "")
}

global.throwE = function (x) {
    var lineE = getTrueLine(inputCodeLikeTrue, globalLine) - includeFileOff - 1
    //console.log(lineE, includeFileOff, lineE - includeFileOff)
    if (returnHighlight) {
        console.log(JSON.stringify(
            {
                issue: true,
                desc: [...arguments],
                line: lineE
            }
        ))
    } else {
        console.trace()
        console.log("\n\n================== THIS WAS THROWE ==================\n\n")

        console.log("\033[31m[ERROR]\033[0m on \033[96m[line " + (lineE + 1) + "]\033[0m ::\033[33m", ...arguments, "\033[0m")
        console.log("\033[96m--->\033[0m", removeTabs(globalLineConts).trim(), "\n")
        // console.log("\033[93m" + "=".repeat(process.stdout.columns) + "\033[0m")
        // drawColLine(lineE - 1)
        // drawColLine(lineE)
        // drawColLine(lineE + 1, true)
        // drawColLine(lineE + 2)
        // console.log("\033[93m" + "=".repeat(process.stdout.columns) + "\033[0m")
        // console.log("\033[96m" + INPUTFILE + ":" + (lineE + 1) + "\033[0m")

    }

    process.exit(126)
    //console.log(lineE)
}
global.throwW = function (x) {
    var lineE = getTrueLine(inputCodeLikeTrue, globalLine) + 1 - includeFileOff
    console.log("\033[93m[WARNING]\033[0m on \033[96m[line " + lineE + "]\033[0m ::\033[33m", ...arguments, "\033[0m")
    //console.log(inputCodeLikeTrue[lineE], inputCodeLikeTrue[lineE].trim())
    console.log("\033[96m--->\033[0m", removeTabs(globalLineConts).trim(), "\n")
    console.log("\033[96m" + INPUTFILE + ":" + lineE + "\033[0m")
}

//taken from: https://stackoverflow.com/questions/65538406/convert-javascript-number-to-float-single-precision-ieee-754-and-receive-integ
global.doubleIEEE = function (double) {
    const buffer = new ArrayBuffer(4);
    const farr = new Float32Array(buffer);
    const uarr = new Uint32Array(buffer);
    farr[0] = double;
    return uarr[0];
}
global.methodExists = function (n) {
    return Object.values(formatMethods).map(x => Object.keys(x)).flat().includes(n)
}
global.objectIncludes = function (obj, inc) {
    return Object.keys(obj).includes(inc)
}

global.objectValuesIncludes = function (obj, inc) {
    return Object.values(obj).includes(inc)
}
global.newStackVar = function (name, type, offset = currentStackOffset) {
    return {
        type: objCopy(type),
        offset,
        name
    }
}


global.popTypeStack = function (u32ifNo = false) {
    if (typeStack.length == 0) {
        if (u32ifNo) {
            //throwW("Mising expected type, guessing u32")
            return defines.types.u32;
        }
        throwE("Missing expected type")
    }
    return typeStack.pop()
}

global.objectCompare = function (a, b) {
    return JSON.stringify(a) == JSON.stringify(b)
}

console.logArr = (x) => { console.dir(x, { depth: null, colors: true, maxArrayLength: null }) }

global.hasEntryFunction = false
//global.setStackVariable = function(vname)
// {
//     for(var i = stackVariables.length; i >= 0; i--)
//     {
//         var obj = stackVariables[i]
//         if(objectIncludes(obj, vname))
//         {
//             stackVariables[i].
//         }
//     }
//     throwE(`Stack variable ${vname} does not exist`)
// }
