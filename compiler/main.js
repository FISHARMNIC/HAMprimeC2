/*
TODO:

    HIGH
        - Stallocs need to return ESP since ebp offsets cannot be preserved if in a loop
        - Make it so if the last thing was a loop or something iterable, use esp instead
    - fix most register formater functions to acknowledge ebp as register 'p'
    - if there isnt any math on the line, free up more, otherwise pre-clobber certain registers
    - __allocfor__ will not work with loops
        - temporarily disabled stack allocations for formats since if you do loops it will be overriting the same thing
    - do like "(123,555) == bob" is like an and
    - (x && y) or (a || b)
    - Incorporate c functions
    - lambda functions
    - function prototypes
    - redo splitter to join lines when a parenthesis has been opened
*/

const fs = require("fs");
const exec = require('child_process').exec;
// All required libs
globalThis.defines = require("./preparer/defines.js");
globalThis.types = defines.types;

require("./preparer/globals.js");

globalThis.parser = require("./preparer/splitter.js");
globalThis.nest = require('./preparer/nestEval.js')
globalThis.actions = require('./helpers/actions.js')
globalThis.helpers = require('./helpers/helpers.js')
globalThis.evaluator = require('./helpers/evaluator.js')
globalThis.mathEngine = require("./math/mathEngine.js");
globalThis.floatEngine = require("./math/floatEngine.js");
globalThis.prioritizeWord = require("./helpers/priority.js")
globalThis.mainDir = __dirname

// load input file and split into lines
const INPUTFILE = "../test/ex6.x"
inputCode = String(fs.readFileSync(INPUTFILE));
inputCode = inputCode.replace(/\n/g, ";").split(";").filter(x => x);

//console.log(helpers.registers)

globalThis.globalLine;
globalThis.previewNextLine = function()
{
    return inputCode[globalLine + 1]
}

inputCode = inputCode.map((line,lineNo) => {
    // parse it into words
    globalLine = lineNo

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

    arrayClamp = defines.types.u32
    helpers.registers.clearClobbers()
    typeStack = []

    lsplit = nest.nest(lsplit);
    lsplit = nest.orderDeepestFirst(lsplit)
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