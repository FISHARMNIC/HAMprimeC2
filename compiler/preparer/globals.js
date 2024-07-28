// yes, it uses globals

global.scope = [];
global.currentStackOffset = 0;
global.requestBracket = 0;
global.globalVariables = {           // Object : {variable name: type}
    "this": defines.types.u32,
}
global.userFunctions = {           // Object : {function name: {func name, parameters[{param name , type},...]}, return type}
    "printf": {
        name: 'printf',
        parameters: [
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
    }
}
global.specialFunctions = {
    size: function(params) {
        throwE("todo")
    }
}
global.lineOwners = {}
global.userFormats = {}
global.stackVariables = [{}]
global.nextAllocIsPersistent = false;
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
    StaticArraysAllocateSize: false
}
global.nextNumIsFloat = false;
global.areaHasFloat = false;
global.keywordTypes = {
    FORMAT: 0,
    FUNCTION: 1,
    INIT: 2,
    METHOD: 3,
    WHILE: 4,
    IF: 5,
    ARRAY: 6
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

global.getTrueLine = function (execFileLikeTrue, line) {
    var lookAtFile = 0;
    var lookAtSpliced = 0;
    while (line != lookAtSpliced) {
        //console.log(execFileLikeTrue[lookAtFile].split("").filter(x => x != " " && x != "\t").slice(0,2).join(""))
        if (execFileLikeTrue[lookAtFile] != "" && execFileLikeTrue[lookAtFile].split("").filter(x => x != " " && x != "\t").slice(0, 2).join("") != "//") {
            lookAtSpliced++;
        }
        lookAtFile++;
    }
    //gave up
    return lookAtFile + ((execFileLikeTrue[lookAtFile - 1] != "" && execFileLikeTrue[lookAtFile - 1].split("").filter(x => x != " " && x != "\t").slice(0, 2).join("") != "//") ? -1 : 0);
}

global.debugPrint = function () {
    console.log("\033[92m[DEBUG]\033[0m", ("\033[96m" + (debugPrint.caller.name || "*unkown caller*") + "\033[0m").padEnd(32), ...arguments);
}
global.objCopy = function (x) {
    return JSON.parse(JSON.stringify(x))
}
global.throwE = function (x) {
    console.log(`[ERROR] @ line ${globalLine}: `, ...arguments)
    console.trace()
    console.log("\n\n================== THIS WAS THROWE ==================\n\n")
    console.log(getTrueLine(inputCodeLikeTrue, globalLine))
    process.exit(126)
}
global.throwW = function (x) {
    console.log(`[WARNING] @ line ${globalLine}: `, ...arguments)
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

global.newGlobalVar = function (type, info = {}) {
    return {
        type: objCopy(type),
        info
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
