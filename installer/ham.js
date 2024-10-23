// WIP 

const { execSync } = require('child_process');
const  os = require('os');
const CLA = require('command-line-args')

var compatibilityLayers = {
    "X11" : `${__dirname}/../../compiler/libs/gfx/bin/gfx.o`
}

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
        { name: 'ofile', alias: 'o', type: String, description: "Output file directory"},
        { name: 'link',  alias: 'l', type: String, multiple: true, description: "Link with system libs (gmp, m, X11, etc)"},
        { name: 'ifiles', alias: 'i', type: String, multiple: true, defaultOption: true, description: "Input files"},
        { name: 'help', alias: 'h', type: String, description: "Print this menu"}
        // { name: 'asm', alias: 's', type: Boolean, defaultValue: false}
    ]
    
    var options = CLA(defs)

    if("help" in options)
    {
        var maxLen = Math.max(...defs.map(x => x.name.length))
        var pad2 = Math.max(...defs.map(x => `<${typeof(x.type())}${x.multiple? ", ..." : ""}>`.length))

        defs.forEach(def => {
            console.log("--" + def.name.padEnd(maxLen) + ` -${def.alias} : ` + `<${typeof(def.type())}${def.multiple? ", ..." : ""}>`.padEnd(pad2) + ` : ${def.description}`)
        })
        console.log("Examples\n", "\tham arrays.x -o out -l gmp\n", "\tham map.x")
        process.exit(0)
    }
    if(!("ifiles" in options))
    {
        console.log("Error: no input file")
        process.exit(1)
    }

    var usesX11 = false

    assemblerArgs.linkExternals = (options.link || assemblerArgs.linkExternals).map(x => {
        if(compatibilityLayers[x] != undefined)
            assemblerArgs.linkLocals.push(compatibilityLayers[x])
        return("-l" + x)
    })

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
        var str = `${asmPrefix} gcc ${__dirname}/../../compiled/out.s ${assemblerArgs.linkLocals.join(" ")} -o ${assemblerArgs.outFile} -g -no-pie -m32 -fno-asynchronous-unwind-tables ${assemblerArgs.linkExternals.join(" ")}`
        //console.log("COMPILING\n\n", str, "\n\n")
        var out = String(execSync(str)).trim()
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