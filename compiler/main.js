const fs = require("fs");

// All required libs
globalThis.defines = require("./preprocessor/defines.js");
globalThis.types = defines.types;
require("./preprocessor/globals.js");
globalThis.parser = require("./preprocessor/splitter.js");
globalThis.nest = require('./preprocessor/nestEval.js')
globalThis.actions = require('./helpers/actions.js')
globalThis.helpers = require('./helpers/helpers.js')
globalThis.evaluator = require('./helpers/evaluator.js')
globalThis.mathEngine = require("./math/mathEngine.js");
globalThis.floatEngine = require("./math/floatEngine.js");

// load input file and split into lines
const INPUTFILE = "../test/ex4.x"
inputCode = String(fs.readFileSync(INPUTFILE));
inputCode = inputCode.replace(/\n/g, ";").split(";").filter(x => x);

//console.log(helpers.registers)

scope.push([])
inputCode = inputCode.map(line => {
    // parse it into words
    var lsplit = parser.split(line);
    helpers.registers.clearClobbers()
    typeStack = []

    lsplit = nest.nest(lsplit);
    
    lsplit = nest.orderDeepestFirst(lsplit)
    //console.log(lsplit)
    lsplit = nest.runDeepestFirst(lsplit)

    helpers.counters.setMaxTempLabels();
    return lsplit;
})

// the compiler goes LEFT TO RIGHT NOW

// actions.variables.create("bob",defines.types.u32,123);
// actions.variables.set("bob", 456)
// actions.variables.read("bob")
// actions.variables.read("bob")
// actions.variables.read("bob")
// actions.variables.read("bob")
// actions.variables.read("bob")
// actions.variables.read("bob")
// actions.variables.read("bob")

console.log(outputCode)
//console.logArr(helpers.formats.propertyOffset("Person", "age"))