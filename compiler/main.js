/*
TODO:
    - fix most register formater functions to acknowledge ebp as register 'p'
    - if there isnt any math on the line, free up more, otherwise pre-clobber certain registers
    - __allocfor__ will not work with loops
        - temporarily disabled stack allocations for formats since if you do loops it will be overriting the same thing
    - do like "(123,555) == bob" is like an and
    - todo: (x && y) or (a || b)
*/

const fs = require("fs");
const exec = require('child_process').exec;
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
globalThis.prioritizeWord = require("./helpers/priority.js")
globalThis.mainDir = __dirname
// load input file and split into lines
const INPUTFILE = "../test/ex4.x"
inputCode = String(fs.readFileSync(INPUTFILE));
inputCode = inputCode.replace(/\n/g, ";").split(";").filter(x => x);

//console.log(helpers.registers)

inputCode = inputCode.map(line => {
    // parse it into words
    var lsplit = parser.split(line);
    var io = lsplit.indexOf("//")
    if(io != -1)
    {
        lsplit = lsplit.slice(0,lsplit.indexOf("//"))
    }

    if(defines.priorityWords.includes(lsplit[0]))
    {
        prioritizeWord(lsplit[0])
    }

    helpers.registers.clearClobbers()
    typeStack = []

    lsplit = nest.nest(lsplit);
    
    lsplit = nest.orderDeepestFirst(lsplit)
    //console.log(lsplit)
    lsplit = nest.runDeepestFirst(lsplit)

    helpers.counters.setMaxTempLabels();
    return lsplit;
})

fs.writeFileSync(__dirname + "/../compiled/out.s", parser.parseFinalCode().out)

//console.log(lineOwners)
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

//console.log(outputCode)
//console.logArr(helpers.formats.propertyOffset("Person", "age"))