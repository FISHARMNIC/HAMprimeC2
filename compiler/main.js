/*
TODO:

    IMPORTANT   
        Splitter for some reason just removes single quote when doing like "'s"

    FOREACH notes:
        note, "load first element into eax", shouldn't always be eax, depends on element type
        note, item is declared outside of the forEach stack
        note, force esp allocation inside for each
        DO ESP ALLOCATION DELETE AFTER CLOSING WHILE/FEACH LOOP???
    

    !! CRUCIAL !!
        - for some reason you cant have fn name like "substring" bc splitter turns into ["sub","string"]

    Add destructors for things like GMP
        - for compatibility with C


    How does duplicate work for items with dynamic children?
    Do the thing that brackets can open onto new line
        - will completely break line tracking (maybe?)

    WHY NOT JUST HAVE ALL ALLOCATIONS SAVED IN TEMPOWNER????
        - removes need for return_new


    TEMPOWNER REWORK:::::
        - WAIT IS THIS NEEDEDDDDD??????? YESSSSS
            - temp owner is reset every time somebody asks for it
            - so when cleanup is called, if tempowner was changed, the old alloc is now destroyed
        - For each function, allocate it's own tempowner variable (on the stack)
        - When the function closes and calls collector, that shouldn't be overwritten yet
        - However, later on that will get deleted and that data should then be cleaned up if it still belongs to tempowner
        *** ISSUE IS ***
            - autocast function call, cptos takes tempowner, other fn in that function uses cptos and upon exit destroys ref
        *** SOLUTION ***
            - __TEMPOWNER__ becomes a pointer to the allocation on the stack for the local tempowner
                - must be pushed at the beginning of a function, and popped at the end
            - note, some code will have to be changed since __TEMPOWNER__ is now a pointer

    Add overloading to operator overloads (like how its done on constructors)
    !! CRUCIAL !!
        - typing.x is broken

    - add ownership locking.
        - just do type annex like Person:locked
        - Special property in type that specifies to pass 1 or 0 to __rc_allocate__

    !! WEIRD !!
        - why does having "const char *__PRINT_TYPE_INT__ = "%i\n";" in strings.c place the string in the wrong section w/o any actual data?
    !! IMPORTANT !!
        - add operator overload with different params
        - currently only have one possilbe overload, but what if you want to add with int vs format etc?

    - Make some 3d thing

    - !! CRUCIAL !!
        - When allocating array of formats like Person[xxx]
        - each entry should be instead:
            - allocating 4 bytes for pointer
            - assigning the data of that address to a second allocation of size "Person"
            - manualAlloc.x works because it's allocating a new one on each line
            - But if you so "create bob <- Person[10]"
                - you can't do "bob[0].x <- xxx" without doing "bob[0] <- Person<...>";
    - !! IMPORTANT !! Warnings and errors dont gen correct line when using #include

    Todo, only pushl __this__ when that function does anything with classes
        - Special flag that is only enabled when that function does anything with classes
        
    - !! IMPORTANT !!
        - if setting ownership, dont need to also copy value since ownership does that. See asm for "create arr <- {1,2,3}"";

    - add class inheritance
    - add __cstruct__(var) converts format to actual value for passing struct to C function
    - make an assembly simulator that is able to trace why segfaults happen and give a reason, like dereferencing null pointer
        - Written in C.
        - Allows for debugging
        - .Rio framework
 
    !! IMPORTANT !!
        - look into "thiscall" calling convention, which is meant for member functions
        - moves "this" into ecx, then other arguments on stack
            - do this and then keep ecx reserved and use it as "this". Make sure to push and pop ecx before and after if clobbered

    - maybe class function aliases, like in bignumNEW, it would be nice to have the memberfunctions just directly reference the gmp functions
        - something like: ".set alias(__gmpf_set_ui)<self, u32 other> -> Bignum"

    - new type "bool" that print_ automatically displays "true" or "false".
    - just u32 with special property called like: "specialType: 'bool'"
    - make compiling less confusing
        - forward to bashsrc
    - make a simple UI generator like visual basic drag and drop
    - "smart" type
        - each type is assigned a number.
        - Passing as type smart passes both the number and its type ID
        - then you can do: "if(bob is u32)" or if(arr[0] is Person)
     - or maybe just type called "TYPE" which is just the typeID

    - maybe add cacheing "this" in register in methods because it's used a lot
    - add private properties and public. Do like cpp private: and public:
    - !! IMPORTANT !! 
        - if not nextThingTakesOwnership, copy type and remove hasData
        - MAKE SURE THAT BORROW COPIES TYPE AND REMOVES HASDATA FROM TYPE
        - This is partly done for setting and creating variables
    - !! IMPORTANT !! just make global arrays allocated dynamically
        - removes confusion between p8 and array8 

    - add push and pop for array types
    - throw error if defining function or variable that is keyword
    - see plans/settingptr.x
    - Automatic return typing, see warns on linked.x
    - Multiple pointer types
        - like char ***
        - Instead of having pointer:true or false, give it a number, like pointer:5
        - When 0, no longer a pointer. This is eq to false. Otherwise >0 eq to true
    - !! IMPORTANT !!
        - optimize __rc_quick_check__
        - change it so by default, all functions save registers automatically
    - make structs not packed (4 byte alignment)
        - add packed flag in type to make it optional
    - add auto return guesstype of statement on return
    - "own" doens't force ownership unless the data has hasData. Make it force calling the function regardless
    - add setting pointer like @bob <- 123;
    - add char to string
    - !! IMPORTANT !! garbage collector should only be triggered at the end of functions
        - in case inline-data causes trigger, which makes them lose the data
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

    - make a raytracer now that i have floats
    - flag for defaultFloats
    - flag for __ccalled__ to be turned on automatically, and switches off caller saving regs
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
    - Unclosed quotes like "don't" won't work in comments
    - IDE editing: \n becomes \\n. tab = \t. Stuff like that
    - (??? FIXED ???) fix most register formater functions to acknowledge ebp as register 'p'
    - if there isnt any math on the line, free up more, otherwise pre-clobber certain registers
    - do like "(123,555) &&== bob" is like an and
    - (x && y) or (a || b)
    - lambda functions
    - redo splitter to join lines when a parenthesis has been opened
*/

/* FIXED - this list has not been updated in very long
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
global.floatEngine = require("./math/floatEngineNEW.js");
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
global.INPUTFILE = __dirname + "/../test/working/" + (process.argv.length == 2 ? "variadic.x" : process.argv[2])

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

process.on('uncaughtException', function (err) {
    if(returnHighlight) 
        throwE('[Node Error]:\n\t', err.toString())

    throw(err)
});


inputCode = inputCode.map((line,lineNo) => {
    // parse it into words
    globalLine = lineNo
    globalLineConts = line

    var lsplit = parser.split(line);
    var io = lsplit.indexOf("//")
    if(io != -1)
    {
        lsplit = lsplit.slice(0,lsplit.indexOf("//"))
    }

    if(defines.priorityWords.includes(lsplit[0]) && !inComment)
    {
        prioritizeWord(lsplit[0], lsplit.slice(1))
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
        keywords: ["borrowed", ...defines.keywords, "index_get", "index_set", "add", "sub", "mul", "div", "operator", "constructor", "create", "...", "call", ".", "$", "@", "dynamic", "forward", "dynamicChildren", "__arguments", "locked"],
        types: Object.keys(defines.types),
        ppdirs: ["include", "sys"],
        allVars: [...__anyVarEverMade,"this"]
    }
    fs.writeFileSync(__dirname + "/../compiled/highlightInfo.json", JSON.stringify(rinfo))
}

console.log("\033[93m======== Program Compiled Successfully ======\033[0m")
console.log("|| Output in  : \033[96m" + __dirname + "/../compiled/out.s" + "\033[0m")
console.log("|| Debug info : \033[96m" + __dirname + "/../compiled/debugInfo.json" + "\033[0m")
console.log("\033[93m=============================================\033[0m")

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