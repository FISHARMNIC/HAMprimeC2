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
noExes.push( ...["dynamic"], ...Object.keys(defines.types), ...defines.conditionals, "<<", ">>") // laod all types into exceptions

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
                // NEW

                var revbuild = line.slice(charNum)
                var index = revbuild.length - 1

                //console.log("INDEX", index, revbuild, x)
                while (index >= 0) {
                    if (x == revbuild) {
                        //console.log("READING", x)
                        if (build != "")
                            outBuffer.push(build) // push current
                        outBuffer.push(x) // push sequence
                        build = "" // clear current
                        charNum += x.length - 1; //offset by length of sequence
                        //console.log("FOUND", x)
                        return false;
                    }
                    //console.log(revbuild)
                    revbuild = revbuild.slice(0, revbuild.length - 1)
                    index--
                }
                return true

                // OLD

                // if length = 2, then sum up the current and the next
                // if length = 3, current + next + second next
                if (cascade(x.length, charOffset) == x) {
                    console.log("READING", x)
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

function parseFinalCode(outName, numberOfFiles) {
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
.align 4

.extern __disable_gc__
.extern __rc_triggerSegfaultOnNullOwnership__
.extern __PRINT_TYPE_INT__
.extern __this__
.extern __xmm_sse_temp__
.extern ___TEMPORARY_OWNER___

######## user data section ########
`
        + outputCode.data.join("\n") +
        `
###################################
.text

#### compiler initation section ###
__init_for_${outName}__:
${(hasEntryFunction && numberOfFiles != 1) ? (new Array(numberOfFiles)).fill(0).map((x, i) => `call __init_for_out${i}__`).join("\n") : ""}
`
        + outputCode.init.join("\n") +
        `
ret
.global __init_for_${outName}__
###################################

${hasEntryFunction ? `.global main\nmain:\ncall __init_for_${outName}__\ncall entry\nret` : "# No main function"}

###################################
`

    var index = out.split("\n").length
    out += outputCode.text.join("\n") + "\n\n"
    return { out, index }
}

function addReserved(x) {
    noExes.push(x)
}

module.exports = { split, addReserved, parseFinalCode, symbols, noExes, nesters }