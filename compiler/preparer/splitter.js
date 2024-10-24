// Parser
// old program

var symbols = defines.symbols

var noExes = [
    "<-",
    "->",
    "/*",
    "//",
    "*/",
    "#f",
    "..."
];
noExes.push(...Object.keys(defines.types), ...defines.conditionals) // laod all types into exceptions

var quoteMarks = [
    `"`,
    `'`,
    `\``
]

var nesters = {
    '(': ')',
    '{': '}',
    '[': ']',
    '<': '>'
}

var inComment = false;

// computes the sum of the outputs of a function expecting an offset
// ex. returns char + nextChar + secNextChar
function cascade(amount, fn, start = "") {
    sum = start;
    for (var i = 0; i < amount; i++) {
        sum += fn(i)
    }
    return sum;
}

function split(line) {
    var len = line.length;
    var build = "";
    var outBuffer = [];
    var inquotes = "";

    var mode = line[0] == parseInt(line[0]); // mode 1 if numbers 0 if letters

    for (var charNum = 0; charNum < len; charNum++) {
        var prevChar = line[charNum - 1];
        var char = line[charNum];
        var nextChar = line[charNum + 1];
        var secNextChar = line[charNum + 2];
        var charOffset = x => String(line[charNum + x]);

        // false if there is an exception (dont split)

        if (!inComment) {
            if (char == "/" && charOffset(1) == "*") {
                outBuffer.push(build)
                build = ""
                inComment = true
                charNum++
                continue;
            }


            if (inquotes != "" && !quoteMarks.includes(char)) {
                build += char;
                continue;
            }

            var noExe = noExes.every(x => {
                // if length = 2, then sum up the current and the next
                // if length = 3, current + next + second next
                if (cascade(x.length, charOffset) == x) {
                    if (build != "")
                        outBuffer.push(build) // push current
                    outBuffer.push(x) // push sequence
                    build = "" // clear current
                    charNum += x.length - 1; //offset by length of sequence
                    return false;
                }
                return true
            })
            if (!noExe) continue; // there was a resevered sequence, dont split and skip

            if (symbols.includes(char)) { // splitting character

                if (build != "")
                    outBuffer.push(build); // push current

                if (char == "-" && (parseInt(nextChar) == nextChar)) {
                    build = "-"
                    mode = 1
                } else {
                    if (char != " ")
                        outBuffer.push(char);
                    build = ""; // clear buffer
                }
            } else if (quoteMarks.includes(char)) { // enter special non-splitting mode in quotes
                if (inquotes == char) { // are exiting quotes
                    outBuffer.push(build + char);
                    build = ""
                    inquotes = "";
                } else if (inquotes == "") { // are entering quotes
                    build += char;
                    inquotes = char;
                }
            } else if ((char == parseInt(char)) != mode) { // if we are going from numbers to letters or vice versa
                if (build != "")
                    outBuffer.push(build);
                mode = !mode;
                build = char;
            } else {
                build += char; // build current char
            }

        } else {
            if (char == "*" && charOffset(1) == "/") {
                charNum++
                inComment = false
            }
        }
    }
    if (build != "") outBuffer.push(build); // use end of string as splitter to 

    if (inquotes != "") {
        console.log("[PARSER ERROR] Missing end-quote: " + line)
        process.exit(1)
    }
    return outBuffer;
}

function parseFinalCode() {
    //console.log(outputCode)
    var out =
        `
/*
********HAM PRIME**********
Compiled with love on ${String(new Date())}
**************************
*/

.section .note.GNU-stack,"",@progbits
.macro .1byte v
.byte \\v
.endm
.data
__rc_triggerSegfaultOnNullOwnership__: .byte ${programRules.segfaultOnNullOwnership? 1 : 0}
__PRINT_TYPE_INT__: .asciz "%i\\n"
######## Auto included libs #######
`
+ autoIncludes.map(x => `\n.include "${x}"\n`).join("\n") +
`
###################################
.data
.align 4
__this__: .4byte 0
__xmm_sse_temp__: .4byte 0
___TEMPORARY_OWNER___: .4byte 0 
.global ___TEMPORARY_OWNER___
.global __this__
.extern __disable_gc__
######## user data section ########
`
+ outputCode.data.join("\n") +
`
###################################
.text

.global main
.global user_init

user_init:
#### compiler initation section ###
__init__:
`
        + outputCode.init.join("\n") +
        `
ret
###################################

${hasEntryFunction? "main:\ncall __init__\ncall entry\nret" : "# No main function"}

###################################
`

    var index = out.split("\n").length
    out += outputCode.text.join("\n") + "\n"
    return { out, index }
}

function addReserved(x) {
    noExes.push(x)
}

module.exports = { split, addReserved, parseFinalCode, symbols, noExes, nesters }