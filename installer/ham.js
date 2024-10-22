// WIP 

const { execSync } = require('child_process');
const  os = require('os');

var assemblerArgs = {
    outFile: `${__dirname}/../../compiled/out`,
    inFile: "",
    linkLocals:
        [
            `${__dirname}/../../compiler/libs/strings/bin/strings.o`,
            `${__dirname}/../../compiler/libs/garbage/bin/garbage_linked.o`,
            `${__dirname}/../../compiler/libs/garbage/bin/garbage_rollcall.o`,
        ],
    linkExternals: [],

}

console.log("┌──── HAM COMPILER ────·")
parseCLA()
assemble()
console.log("└──────SUCCESSFUL──────·")

function parseCLA() {
    var defs = [
        { name: 'ofile', alias: 'o', type: String },
        { name: 'link',  alias: 'l', type: String, multiple: true },
        { name: 'ifiles', alias: 'i', type: String, multiple: true, defaultOption: true},
        // { name: 'asm', alias: 's', type: Boolean, defaultValue: false}
    ]
    
    var CLA = require('command-line-args')
    var options = CLA(defs)

    if(!("ifiles" in options))
    {
        console.log("Error: no input file")
        process.exit(1)
    }

    assemblerArgs.linkExternals = (options.link || assemblerArgs.linkExternals).map(x => "-l" + x)
    assemblerArgs.outFile = options.ofile || assemblerArgs.outFile
    assemblerArgs.inFiles  = options.ifiles
}

function assemble() {

    const asmFile = `${__dirname}/../../compiled/out.s`

    assemblerArgs.inFiles.forEach(x => {
        try{
            var out = String(execSync(`node ${__dirname}/../../compiler/main.js __RANOPRINT__ ${x}`)).trim()
            if(out.length != 0)
                console.log(out)
        }
        catch(e)
        {
            console.log(String(e.stdout))
            console.log("Error: compilation error")
            process.exit(1)
        }
    })
    console.log("├ Assembly : " + asmFile)
    
    var asmPrefix = os.type() == "Darwin" ? "limactl shell debian" : ""
    try{
        var out = String(execSync(`${asmPrefix} gcc ${__dirname}/../../compiled/out.s ${assemblerArgs.linkLocals.join(" ")} -o ${assemblerArgs.outFile} -g -no-pie -m32 -fno-asynchronous-unwind-tables ${assemblerArgs.linkExternals.join(" ")}`)).trim()
        if(out.length != 0)
            console.log(out)
    }
    catch(e)
    {
        console.log(String(e.stdout))
        console.log(String(e.stderr))

        console.log("Assembler failed")
        process.exit(0)
    }
    console.log("├ Binary   : " + assemblerArgs.outFile)
}