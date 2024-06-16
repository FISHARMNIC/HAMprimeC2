const fs = require("fs");

function replace0s(line)
{
    return line.replace(/[\u0000]/g, "\0")
}

const { execSync } = require('child_process')
function execute(command) {
    var out = String(execSync(command)).replace(/[\u001b\u009b][[()#;?]*(?:[0-9]{1,4}(?:;[0-9]{0,4})*)?[0-9A-ORZcf-nqry=><]/g, '');
    out = {
        data: out.split("\n").filter(x => x)
    }
    return JSON.stringify(out)
}

module.exports = function (command) {
    if (command == "ls") {
        return execute(`ls -p ${__dirname}/../test`)
    } else if (command == "compile") {
        return execute(`node ${__dirname}/../compiler/main.js`)
    } else if (command == "asm") {
        return String(fs.readFileSync(`${__dirname}/../compiled/out.s`))
    } else if (command == "assemble") {
        return execute(`gcc ${__dirname}/../compiled/out.s -o ${__dirname}/../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables`)
    } else if (command == "run") {
        try {
            return JSON.stringify({
                status: 0,
                stdout: execute(`limactl shell debian "${__dirname}/../compiled/out"`).map(x => replace0s(x))
            })
          } 
          catch (error) {
            return JSON.stringify({
                status: error.status, 
                stdout: [replace0s(String(error.stdout)).split("\n").filter(x => x)]
            })
          }
    } else if(command.includes("/")) {
        var iof = command.indexOf("/")
        var sub = command.slice(iof + 1)
        command = command.slice(0,iof)
        
        console.log(command, sub)
        if(command == "read")
        {
            return String(fs.readFileSync(`${__dirname}/../test/${sub}`))
        }
    }
}