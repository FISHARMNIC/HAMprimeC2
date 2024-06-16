const fs = require("fs")

function replace0s(line) {
    return line.replace(/[\u0000]/g, "\0")
}

const { execSync } = require('child_process')
function execute(command, stringify = true) {
    var out = String(execSync(command)).replace(/[\u001b\u009b][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-ORZcf-nqry=><]/g, '')
    if(stringify)  {
        out = JSON.stringify({data: out.split("\n").filter(x => x)})
    }
    return out
}

module.exports = function (command) {
    if (command == "ls") {
        return execute(`ls -p ${__dirname}/../test`)
    } else if (command == "compile") {
        return execute(`node ${__dirname}/../compiler/main.js`)
    } else if (command == "asm") {
        return String(fs.readFileSync(`${__dirname}/../compiled/out.s`))
    } else if (command == "assemble") {
        return execute(`limactl shell debian gcc ${__dirname}/../compiled/out.s -o ${__dirname}/../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables`)
    } else if (command == "run") {
        var out
        var code = 0
        try {
            out = execute(`limactl shell debian "${__dirname}/../compiled/out"`, false).split("\n").map(x => replace0s(x)).filter(x => x)
        }
        catch (error) {
            console.log("error", error.status)
            code = error.status
            out = [replace0s(String(error.stdout)).split("\n").filter(x => x)]
        }
        console.log(out)
        return JSON.stringify({code,out})
    } else if (command == "debug") {
        return execute("limactl shell debian node ../compiler/debugger/stripped")
    }

    else if (command.includes("/")) {
        var iof = command.indexOf("/")
        var sub = command.slice(iof + 1)
        command = command.slice(0, iof)

        console.log(command, sub)
        if (command == "read") {
            return String(fs.readFileSync(`${__dirname}/../test/${sub}`))
        }
    }
}