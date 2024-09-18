// yes, it uses globals

// global.objCopy = function (x) {
//     return JSON.parse(JSON.stringify(x))
// }

global.objCopy = function(x) {
    return structuredClone(x)
}

global.newGlobalVar = function (type, info = {}) {
    return {
        type: objCopy(type),
        info
    }
}

// ONLY FOR HIGHLIGHTING IN IDE
global.__anyVarEverMade = []
global.__addToAnyVarEverMade = function(x)
{
    if(!__anyVarEverMade.includes(x))
        __anyVarEverMade.push(x)
}


global.MODE_DEBUG = false;
global.scope = [];
global.currentStackOffset = 0;
global.requestBracket = 0;
global.oldFormatAllocs = [] // for freeing registers in property chains like a.b.c.d
global.macros = {
    TRUE: "1",
    FALSE: "0",
    NULL: "0",
    "this": "__this__"
}
global.globalVariables = {           // Object : {variable name: type}
    "__this__": newGlobalVar(defines.types.u32),
    "___TEMPORARY_OWNER___": newGlobalVar(defines.types.u32)
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
    "strjoinmany" : {
        name: "strjoinmany",
        parameters: [
            { name: "number", type: defines.types.u32 },
        ],
        variadic: true,
        returnType: defines.types.string
    },
    "strlen" : {
        name: "strlen",
        parameters: [
            { name: "string", type: defines.types.string },
        ],
        variadic: false,
        returnType: defines.types.u32
    }
}
global.specialFunctions = {
    size: function (params) {
        throwE("todo")
    }
}
global.lineOwners = {}
global.userFormats = {}
global.stackVariables = [{}]
global.nextAllocIsTransient = false
global.nextAllocIsPersistent = false
global.defaultAutomaticOwnership = true
global.nextThingTakesOwnership = defaultAutomaticOwnership

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
global.typeStack = [] // depricated
global.mostRecentIfStatement = []
global.arrayClamp = defines.types.u32
global.globalLine;
global.inComment = false;
global.programRules = {
    DynamicArraysAllocateSize: true,
    StaticArraysAllocateSize: false,
    hasUsedMmap: false,
    defaultTransience: false,
    optimizeMemory: false
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
}

global.quickSplit = function (inputCode) {
    return inputCode.replace(/\n/g, ";").split(";").filter(x => x).map(x => x.replace(/\t/g, ""))
}

global.getLastScopeType = function () {
    if (scope.length == 0)
        return -1
    return scope[scope.length - 1].type
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
    while (lineRead != line) {
        lookAtFile++
        lineRead++
        execFileLikeTrue[lookAtFile] = removeTabs(execFileLikeTrue[lookAtFile])
        //console.log("::::", execFileLikeTrue[lookAtFile], lineRead, lookAtFile)
        while (execFileLikeTrue[lookAtFile].length == 0) //skip
        {
            lookAtFile++
        }
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
    var lineE = getTrueLine(inputCodeLikeTrue, globalLine)
    if(returnHighlight)
    {
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

    console.log("\033[31m[ERROR]\033[0m on \033[96m[line " + lineE + 1 + "]\033[0m ::\033[33m", ...arguments, "\033[0m")
    console.log("\033[93m" + "=".repeat(process.stdout.columns) + "\033[0m")
    drawColLine(lineE - 1)
    drawColLine(lineE)
    drawColLine(lineE + 1, true)
    drawColLine(lineE + 2)
    console.log("\033[93m" + "=".repeat(process.stdout.columns) + "\033[0m")


    }

    process.exit(126)
    //console.log(lineE)
}
global.throwW = function (x) {
    var lineE = getTrueLine(inputCodeLikeTrue, globalLine)
    console.log("\033[93m[WARNING]\033[0m on \033[96m[line " + (lineE + 1) + "]\033[0m ::\033[33m", ...arguments, "\033[0m")
    //console.log(inputCodeLikeTrue[lineE], inputCodeLikeTrue[lineE].trim())
    console.log("\033[96m--->\033[0m", removeTabs(inputCodeLikeTrue[lineE]).trim(), "\n")
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
global.newStackVar = function (type, offset = currentStackOffset) {
    return {
        type: objCopy(type),
        offset
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
