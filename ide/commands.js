globalThis.currentDirectory = `${__dirname}/../test/working`

globalThis.fs = require("fs")

function replace0s(line) {
    return line.replace(/[\u0000]/g, "\0")
}

function formatOutput(out) {
    return JSON.stringify({ data: out.replace(/[\u001b\u009b][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-ORZcf-nqry=><]/g, '').split("\n").filter(x => x) })
}

const { execSync } = require('child_process')
function execute(command, stringify = true, acceptError = false) {
    try {
        var out = String(execSync(command))
        if (stringify) {
            out = formatOutput(out)
        }
        return out
    } catch(error)
    {
        if(acceptError)
        {
            var out = String(error.stdout)
            console.log("Error but OK", out)
            if (stringify) {
                out = formatOutput(out)
            }
            return out
        }
        console.log("FAILLL", String(error), String(error.stdout))
        return -1
    }
}

module.exports = function (command) {
    if (command == "ls") {
        return execute(`ls -p ${currentDirectory}`)
    } else if(command == "gd") {
        return currentDirectory
    } else if (command == "asm") {
        return String(fs.readFileSync(`${__dirname}/../compiled/out.s`))
    } else if (command == "highlightInfo")
    {
        return String(fs.readFileSync(`${__dirname}/../compiled/highlightInfo.json`))
    } else if (command == "getDebugInfo") {
        return String(fs.readFileSync(`${__dirname}/../compiled/debugInfo.json`))
    } else if (command == "assemble") {
        return execute(`limactl shell debian gcc ${__dirname}/../compiled/out.s ${__dirname}/../compiler/libs/globals.s ${__dirname}/../compiler/libs/gcollect.s ${__dirname}/../compiler/libs/strings/bin/strings.o ${__dirname}/../compiler/libs/garbage/bin/garbage_linked.o ${__dirname}/../compiler/libs/garbage/bin/garbage_rollcall.o ${__dirname}/../compiler/libs/garbage/bin/garbage_chunks.o -o ${__dirname}/../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables`)
    } else if (command == "run") {
        var out
        var code = 0
        try {
            out = execute(`limactl shell debian "${__dirname}/../compiled/out"`, false).split("\n").map(x => replace0s(x)).filter(x => x)
        }
        catch (error) {
            console.log("error", out)
            code = error.status
            out = [replace0s(String(error.stdout)).split("\n").filter(x => x)]
        }
        console.log(out)
        return JSON.stringify({ code, out })
    } else if (command == "debug") {
        return execute("limactl shell debian node ../compiler/debugger/stripped")
    } else if (command == "highlights") {
        return execute(`node ${__dirname}/../compiler/main.js __FLAG_HIGHLIGHT__ ${sub}`)
    } else if (command.includes("/")) {
        var iof = command.indexOf("/")
        var sub = command.slice(iof + 1)
        command = command.slice(0, iof)

        console.log(command, sub)
        if (command == "read") {
            return String(fs.readFileSync(`${currentDirectory}/${sub}`))
        } else if (command == "compile") {
            var out;
            try {
                out = execute(`node ${__dirname}/../compiler/main.js __FLAG_HIGHLIGHT__ ${sub}`, true, true)
            }
            catch (error) {
                out = formatOutput(String(error.stdout))
            }
            return out
        } else if(command == "createFile") {
            return String(fs.writeFileSync(`${currentDirectory}/${sub}`, "", {flag: "a"}))
        } else if(command == "sd") {
            sub = sub.trim()
            if(sub.includes(".") || sub.length == 0)
            {
                return("ERR FINV")
            }
            else
            {
                currentDirectory = `${__dirname}/../projects/${sub}`
                console.log(currentDirectory)
                if(!fs.existsSync(currentDirectory))
                {
                    fs.mkdirSync(currentDirectory)
                    fs.mkdirSync(currentDirectory + "/bin")
                }
            }
        }
    }
}