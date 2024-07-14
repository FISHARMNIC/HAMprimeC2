/*
TODO:
    NEW
    - Array allocate +4 in order to store length of array too. Add specifier like "__disable length" to remove that if wanted
    - "own" keyword specifies who owns data. Without it its freed 
        - uses Memory Ownership Table for automatic freeing
        - "__disable ownership" to turn this off
    - working on: see ex6
    - add bignums (only supported using zmm registers)
    HIGH
    - Unclosed quotes like "don't" won't work in comments
    - IDE editing: \n becomes \\n. tab = \t. Stuff like that
    - fix most register formater functions to acknowledge ebp as register 'p'
    - if there isnt any math on the line, free up more, otherwise pre-clobber certain registers
    - do like "(123,555) &&== bob" is like an and
    - (x && y) or (a || b)
    - lambda functions
    - redo splitter to join lines when a parenthesis has been opened
*/

/* FIXED
- FIXED only use esp in loop if allocating format otherwise it can be overwritten like normal var
    - FIXED Stallocs need to return ESP since ebp offsets cannot be preserved if in a loop
    - FIXED Make it so if the last thing was a loop or something iterable, use esp instead
    - FIXED ESP is then moved into a variable that was allocated on the stack and can be accessed using EBP
    - FIXED so $offset(EBP) holds a reference to the actual address
- FIXED __allocfor__ will not work with loops
    - temporarily disabled stack allocations for formats since if you do loops it will be overriting the same thing
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

var INPUTFILE = __dirname + "/../test/working/" + (process.argv.length == 2 ? "variadic.x" : process.argv[2])

globalThis.inputCode = String(fs.readFileSync(INPUTFILE))
globalThis.inputCodeLikeTrue = inputCode.split("\n")
inputCode = inputCode.replace(/\n/g, ";").split(";").filter(x => x).map(x => x.replace(/\t/g, ""))

//console.log(helpers.registers)

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

    if(defines.priorityWords.includes(lsplit[0]) && !inComment)
    {
        prioritizeWord(lsplit[0])
    }

    arrayClamp = defines.types.u32
    helpers.registers.clearClobbers()
    helpers.registers.resetExtendedTypes()
    typeStack = []

    lsplit = nest.nest(lsplit);
    lsplit = nest.orderDeepestFirst(lsplit)
    lsplit = nest.runDeepestFirst(lsplit)

    helpers.counters.setMaxTempLabels();
    return lsplit;
})

helpers.variables.genTempLabels();

var out = parser.parseFinalCode()

lineOwners["offset"] = out.index; // text section offset (must add to each key)
lineOwners["file"] = INPUTFILE;

fs.writeFileSync(__dirname + "/../compiled/out.s", out.out)
fs.writeFileSync(__dirname + "/../compiled/debugInfo.json", JSON.stringify(lineOwners))

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