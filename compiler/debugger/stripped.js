const { exec, execSync } = require("child_process");
const fs = require("fs");

var execFileLikeTrue;
var execFile;
var pathStr = `gdb -ex run -ex 'quit' --args ${__dirname + '/../../compiled/out'}`

function getTrueLine(execFileLikeTrue, line)
{
    var lookAtFile = 0;
    var lookAtSpliced = 0;
    while(line != lookAtSpliced)
    {
        //console.log(execFileLikeTrue[lookAtFile].split("").filter(x => x != " " && x != "\t").slice(0,2).join(""))
        if(execFileLikeTrue[lookAtFile] != "" && execFileLikeTrue[lookAtFile].split("").filter(x => x != " " && x != "\t").slice(0,2).join("") != "//")
        {
            lookAtSpliced++;
        }
        lookAtFile++;
    }
    //gave up
    return lookAtFile + ((execFileLikeTrue[lookAtFile - 1] != "" && execFileLikeTrue[lookAtFile - 1].split("").filter(x => x != " " && x != "\t").slice(0,2).join("") != "//") ? -1 : 0);
}

function output(e, out, ste) {
    if (e) {
        console.log(`error: ${e.message}`);
        return;
    }
    if (ste) {
        console.log(`stderr: ${ste}`);
        return;
    }

    out = out.toString();
    var index = out.indexOf("out.s:")
    if(index == -1)
    {
        if(out.includes("SIGSEGV"))
        {
            console.log("-1 -1")
            console.log("Untraceable segfault. Checking c-functions like scanf or printf")
            exec(`gdb -ex run -ex where -ex 'quit' --args ${__dirname + '/../../compiled/out'}`, (a,b,c) => {
                b = b.substring(b.indexOf("SIGSEGV")).split('\n')
                console.log(b.filter(x => (/#\d/g).test(x) && !(/(lib32\/libc)|(\?\?)/g).test(x)).join("\n"))
            })
        } else {
            console.log("OK")
        }
        return
    }

    var data = JSON.parse(fs.readFileSync(__dirname + "/../../compiled/debugInfo.json"))
    var fsout = String(fs.readFileSync(data.file));
    
    execFileLikeTrue = fsout.split("\n")
    execFile = fsout.replace(/\n/g, ";").split(";").filter(x => x);

    var noOffset = parseInt(out.slice(index).split("\n")[1].split("\t")[0]) // line of fault in assembly (1 index)
    var offset = noOffset - data.offset                                     // line of fault in text section

    while(data[offset] == undefined)
    {
        offset--;
    }
    var info = data[offset];
    //console.log(info[0].line)
    
    var trueLine = getTrueLine(execFileLikeTrue, info[0].line)
    console.log(`${trueLine + 1} ${noOffset}`)
    console.log(info[0].caller.split("\n").slice(2).join("\n").replace(/\t/g,""));

}

try{
execSync(`${__dirname + '/../scripts/assemble.sh'}`)
}
catch(error)
{
    
}
exec(pathStr, output);

module.exports = getTrueLine