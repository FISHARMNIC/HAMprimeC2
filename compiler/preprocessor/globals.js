globalThis.scope = [];
globalThis.currentStackOffset = 0;
globalThis.requestBracket = 0;
globalThis.globalVariables = {           // Object : {variable name: type}
    "this": defines.types.u32,
}
globalThis.userFunctions = {           // Object : {function name: {func name, parameters[{param name , type},...]}, return type}
    "printf": {
        name: 'printf',
        parameters: [
            {name: "format", type: defines.types.p8}
        ],
        variadic: true,
        returnType: defines.types.u32
    },
}
globalThis.userFormats = {}
globalThis.stackVariables = [{}]
globalThis.nextAllocIsPersistent = false;
globalThis.outputCode = { // object with out data
    data: [],
    init: [],
    text: [],
    autoPush: function () {
        if (scope.length == 0)
            this.init.push(...arguments)
        else
            this.text.push(...arguments)

        debugPrint(outputCode.autoPush.caller.name, ...arguments)
    },
    comment: function() {
        this.autoPush("# " + [...arguments].join(" "))
    }
}
globalThis.typeStack = []






globalThis.keywordTypes = {
    FORMAT: 0, 
    FUNCTION: 1,
    INIT: 2,
    METHOD: 3
}


globalThis.getLastScopeType = function()
{
    if(scope.length == 0)
        return -1
    return scope[scope.length - 1].type
}

globalThis.newScope = function(rb)
{
    stackVariables.push({})
    scope.push(objCopy(rb))
}

globalThis.createStackVariableListOnly = function(vname, type)
{
    stackVariables.at(-1)[vname] = objCopy(type)
}

globalThis.getAllStackVariables = function()
{
    var obj = {}
    stackVariables.forEach(inner_obj => {
        Object.entries(inner_obj).forEach(pair => {
            obj[pair[0]] = pair[1]
        })
    })
    return obj
}

globalThis.debugPrint = function () {
    console.log("\033[92m[DEBUG]\033[0m", ("\033[96m" + (debugPrint.caller.name || "*unkown caller*") + "\033[0m").padEnd(32), ...arguments);
}
globalThis.objCopy = function (x) {
    return JSON.parse(JSON.stringify(x))
}
globalThis.throwE = function (x) {
    console.log(`[ERROR] @ line ___: `, ...arguments)
    console.trace()
    console.log("\n\n================== THIS WAS NOT A JS ERROR, THIS WAS THROWE ==================\n\n")
    process.exit(1)
}
globalThis.throwW = (x) => {console.log(`[WARNING] @ line ____: `, ...arguments); process.exit(0)};

//taken from: https://stackoverflow.com/questions/65538406/convert-javascript-number-to-float-single-precision-ieee-754-and-receive-integ
globalThis.doubleIEEE = function (double) {
    const buffer = new ArrayBuffer(4);
    const farr = new Float32Array(buffer);
    const uarr = new Uint32Array(buffer);
    farr[0] = double;
    return uarr[0];
}
globalThis.methodExists = function (n) {
    return Object.values(formatMethods).map(x => Object.keys(x)).flat().includes(n)
}
globalThis.objectIncludes = function(obj,inc)
{
    return Object.keys(obj).includes(inc)
}

globalThis.objectValuesIncludes = function(obj,inc)
{
    return Object.values(obj).includes(inc)
}
globalThis.newStackVar = function (type) {
    return {
        type: objCopy(type),
        offset: currentStackOffset
    }
}

globalThis.newGlobalVar = function(type, info = {}) {
    return {
        type: objCopy(type),
        info
    }
}

globalThis.popTypeStack = function(u32ifNo = false) {
    if (typeStack.length == 0) {
        if (u32ifNo) {
            //throwW("Mising expected type, guessing u32")
            return defines.types.u32;
        }
        throwE("Missing expected type")
    }
    return typeStack.pop()
}

globalThis.objectCompare = function(a,b)
{
    return JSON.stringify(a) == JSON.stringify(b)
}

console.logArr = (x) => {console.dir(x, {depth: null, colors: true, maxArrayLength: null})}

//globalThis.setStackVariable = function(vname)
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
