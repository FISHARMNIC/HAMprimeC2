globalThis.scope = 0;
globalThis.bracketStack = [];
globalThis.currentStackOffset = 0;


globalThis.globalVariables = {           // Object : {variable name: type}
    __return_8__: types.i8,
    __return_16__: types.i16,
    __return_32__: types.i32,
    __return_flt__: types.f32,
    "this": types.u32,
    "argv": types.u32,
    "argc": types.u32
}
globalThis.userFunctions = {           // Object : {function name: {func name, parameters[{param name , type},...]}, return type}
    "put_string": {
        name: 'put_string',
        parameters: [{ name: "buffer", type: types.p8 }],
        returnType: types.u32
    },
    "put_int": {
        name: 'put_int',
        parameters: [{ name: "number", type: types.u32 }],
        returnType: types.u32
    },
    "puts": {
        name: 'puts',
        parameters: [{ name: "string", type: types.p8 }],
        returnType: types.u32
    },
    "printf_mini": {
        name: 'printf_mini',
        parameters: [],
        returnType: types.u32
    },
    "put_float": {
        name: 'put_float',
        parameters: [{ name: "number", type: types.f32 }],
        returnType: types.u32
    },
    "put_floatln": {
        name: 'put_floatln',
        parameters: [{ name: "number", type: types.f32 }],
        returnType: types.u32
    },
    "fopen": {
        name: 'fopen',
        parameters: [],
        returnType: types.u32
    },
    "fwrite": {
        name: 'fopen',
        parameters: [],
        returnType: types.u32
    },
    "fread": {
        name: 'fopen',
        parameters: [],
        returnType: types.u32
    },
    "fclose": {
        name: 'fclose',
        parameters: [],
        returnType: types.u32
    },
    "mpow": {
        name: 'mpow',
        parameters: [],
        returnType: types.f32
    },
    "scanf_mini": {
        name: 'scanf_mini',
        parameters: [],
        returnType: types.u32
    },
    "malloc": {
        name: "malloc",
        parameters: [],
        returnType: types.p32
    },
    "free": {
        name: "free",
        parameters: [],
        returnType: types.u32
    },
    "strlen_rapid" : {
        name: "strlen_rapid",
        parameters: [{name: "string", type: types.p8 }],
        returnType: types.u32
    }
}
globalThis.stackVariables = {}

globalThis.outputCode = { // object with out data
    data: [],
    init: [],
    text: [],
    autoPush: function () {
        if (bracketStack.length == 0)
            this.init.push(...arguments)
        else
            this.text.push(...arguments)
    }
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
globalThis.throwW = (x) => console.log(`[WARNING] @ line ${globalInd}: `, ...arguments);

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
    return Object.value(obj).includes(inc)
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
console.logArr = (x) => {console.dir(x, {depth: null, colors: true, maxArrayLength: null})}