/*
TODO:
    NEW
    - add char to string
    - !! IMPORTANT !! garbage collector should only be triggered at the end of functions
        - in case inline-data causes trigger, which makes them lose the data
    - IDE gets all functions from globals.js and uses it that you can do like a function lookup and see how it works.
        - server converts to JSON, sends to client, client parses back to JS obj
    - add type chains that give pointers multiple types as they are dereferenced
        - p8~p32~p16 bob
    - fix "__rule defaultTransience true", currently breaks compiler
    - add rule that just disables garbage collection completely
    - "smart" type means it not only passes the value but also a second 4 byte value (before the argument) that contains info about the type of the Argument
        -It can only be used as a parameter
        - It passes:
            * bit 1-2: number of bytes
            * bit 3: is a pointer
            * bit 4: is a float
    - rework variadic arguments, they should be just a normal array that points to the stack
        - this allows for you to pass a pointer to vargs and read them from another fn
        - currently its a "fake" array
    - make c#-like vectors 
    - make certain methods that do special things
        - eg:
            - something.add() allows for special instructions on how to add. 
            - "jon + 123" if jon is a format of type person, jon. add can look 
    - make a raytracer now that i have floats
    - flag for defaultFloats
    - flag for __ccalled__ to be turned on automatically, and switches off caller saving regs
    - flag "NoStringDuplicates" when TRUE: any string literals with the same value use the same reference. Default TRUE
    - "own" keyword specifies who owns data. Without it its freed 
        - uses Memory Ownership Table for automatic freeing
        - "__disable ownership" to turn this off
    - working on: see ex6
    - Add everytime something is stored in a register, that value is stored on the compiler too
        - before moving somethig into the same register, if its the same thing, just dont move it since it's already there
        - NOTE: THIS ONLY WORKS IF *EVERY* MOV IS DONE USING A FUNCTION THAT TRACKS MOVS
        - NOTE: this is probably a bad idea
            - Just write a postprocessor that removes unnecessary instructions
    - store number of args as extra "hidden" parameter in variadics
    - add keyword to disable packed structs
    - add a sort of dictionary for formats so that they can have their properties called by name from a string
        - like myVar["name"] gets the property "name"
    - add a keyword that allows you to call a certain method from any class type
        - Remember, the method names are just formatted functions
        - This keyword should just call that formatted function
            - Class name comes from guessType of the instance that is trying to call it
        - Useful for things like a ".print" for easy printing
        - possible way it looks: "attempt myClass.print" or maybe "force"
        - or maybe "<formatName>.call(<methodName>,<instance>"
            - "Person.call(print, myPointer)"
    - add inline assembly
    - "global" keyword for exporting functions and variables
    - No casting to float and vice versa

    HIGH
    - sqrt doesnt work
    - argc doesnt work and argv
    - Don't think that arr[a][b] <- 123; (nested setting) will work! Untested
    - allow $this.property to get address
    - do oldFormatAllocs for array access chains too like bob[1][2][3]
    - GET RID OF TYPESTACK COMLPETELY SOME THINGS STILL USE IT
    - "} elif {"" won't work for some reason, needs new line, maybe because it thinks array?
    _ __define only works for single words
    - FORMAT PROPERTYS CANNOT BE SET
    - Unclosed quotes like "don't" won't work in comments
    - IDE editing: \n becomes \\n. tab = \t. Stuff like that
    - (??? FIXED ???) fix most register formater functions to acknowledge ebp as register 'p'
    - if there isnt any math on the line, free up more, otherwise pre-clobber certain registers
    - do like "(123,555) &&== bob" is like an and
    - (x && y) or (a || b)
    - lambda functions
    - redo splitter to join lines when a parenthesis has been opened
*/

/* FIXED
- Array allocate +4 in order to store length of array too
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
global.defines = require("./preparer/defines.js");
global.types = defines.types;

require("./preparer/globals.js");

global.parser = require("./preparer/splitter.js");
global.nest = require('./preparer/nestEval.js')
global.actions = require('./helpers/actions.js')
global.helpers = require('./helpers/helpers.js')
global.evaluator = require('./helpers/evaluator.js')
global.mathEngine = require("./math/mathEngine.js");
global.stringAdder = require("./math/stringAdder.js");
global.floatEngine = require("./math/floatEngine.js");
global.prioritizeWord = require("./helpers/priority.js")
global.preprocess = require("./preprocessor/pre.js")

global.mainDir = __dirname
global.returnHighlight = false
// load input file and split into lines
if(process.argv[2] == "__FLAG_HIGHLIGHT__")
{
    returnHighlight = true
    process.argv.splice(2,1)
}
var INPUTFILE = __dirname + "/../test/working/" + (process.argv.length == 2 ? "variadic.x" : process.argv[2])

global.inputCode = String(fs.readFileSync(INPUTFILE))
global.inputCodeLikeTrue = inputCode.split("\n")
inputCode = quickSplit(inputCode)

preprocess(inputCode)
//console.log(inputCode)
//console.log(helpers.registers)

global.previewNextLine = function()
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
    lastArrayType = defines.types.u32
    helpers.registers.clearClobbers()
    helpers.registers.resetExtendedTypes()
    typeStack = []
    oldFormatAllocs = []

    lsplit = nest.nest(lsplit);
    lsplit = nest.orderDeepestFirst(lsplit)
    lsplit = nest.runDeepestFirst(lsplit)

    helpers.counters.setMaxTempLabels();
    return lsplit;
})

helpers.variables.genTempLabels();

autoIncludes.push(mainDir + "/libs/gcollect.s")
if (programRules.hasUsedMmap)
{
    autoIncludes.push(mainDir + "/libs/alloc.s")
}

var out = parser.parseFinalCode()

lineOwners["offset"] = out.index; // text section offset (must add to each key)
lineOwners["file"] = INPUTFILE;

if(!MODE_DEBUG)
{
    console.log("\n----- Note: debug mode is off -----\n")
}

fs.writeFileSync(__dirname + "/../compiled/out.s", out.out)
fs.writeFileSync(__dirname + "/../compiled/debugInfo.json", JSON.stringify(lineOwners))

if(returnHighlight)
{
    var rinfo = {
        functions: Object.keys(userFunctions),
        keywords: [...defines.keywords, "constructor", "create", "...", "call", "."],
        types: Object.keys(defines.types),
        allVars: [...__anyVarEverMade,"this"]
    }
    fs.writeFileSync(__dirname + "/../compiled/highlightInfo.json", JSON.stringify(rinfo))
}

console.log("\033[93m======== Program Compiled Successfully ======\033[0m")
console.log("|| Output in  : \033[96m" + __dirname + "/../compiled/out.s" + "\033[0m")
console.log("|| Debug info : \033[96m" + __dirname + "/../compiled/debugInfo.json" + "\033[0m")
console.log("\033[93m=============================================\033[0m")

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