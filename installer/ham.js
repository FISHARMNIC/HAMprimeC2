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
            `${__dirname}/../../compiler/libs/globals.s`,
            `${__dirname}/../../compiler/libs/gcollect.s`,
        ],
    linkExternals: [],
    dontLink: false,
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
        { name: 'help', alias: 'h', type: String, description: "Print this menu"},
        { name: 'nolink', alias: 'c', type: Boolean, description: "Compile a single file without linking"}
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
        console.log("Examples\n", "\tham arrays.x -o out -l gmp\n", "\tham map.x", "\tham files.x -c files.o")
        process.exit(0)
    }
    if(!("ifiles" in options))
    {
        console.log("Error: no input file. Use 'ham --help' for instructions")
        process.exit(1)
    }

    var usesX11 = false

    assemblerArgs.linkExternals = (options.link || assemblerArgs.linkExternals).map(x => {
        if(options.nolink)
        {
            console.log("Cannot link when using '-c'")
        }
        else if(compatibilityLayers[x] != undefined)
            assemblerArgs.linkLocals.push(compatibilityLayers[x])
        else
        {
            console.log("Unknown library: " + x)
            process.exit(1)
        }
        return("-l" + x)
    })

    assemblerArgs.outFile  = options.ofile || assemblerArgs.outFile
    assemblerArgs.inFiles  = options.ifiles
    assemblerArgs.dontLink = options.nolink
}

function assemble() {

    const asmFile = `${__dirname}/../../compiled/out.s`

    var numberOfInFiles = assemblerArgs.inFiles.filter(x => { // keep only files that need to be compiled, not binaries being linked like: "ham files files2.x -o out"
        return true// x.substring(x.lastIndexOf("/") + 1, x.length).includes(".")
    }).length

    var assemblyOutFiles = []

    assemblerArgs.inFiles.forEach((x,i) => {
        try{
            var justName = x.substring(x.lastIndexOf("/") + 1, x.length)
            if(justName.includes("."))
            {
                var out = String(execSync(`node ${__dirname}/../../compiler/main.js __RANOPRINT__ ${x} ${numberOfInFiles == 1 ? "" : `${numberOfInFiles} __ID_${i}`}`)).trim()
                assemblyOutFiles.push(`${__dirname}/../../compiled/out${numberOfInFiles == 1 ? "" : i}.s`)
                if(out.length != 0)
                    console.log(out)
            }
            else
            {
                console.log("not compiling binary: " + x, "\n\t> if you did not want this, add an extension to the file")
                assemblerArgs.linkLocals.push(x)
            }
        }
        catch(e)
        {
            console.log(String(e.stdout))
            console.log("Error: compilation error")
            process.exit(1)
        }
    })
    console.log("├ Assembly : " + asmFile)
    
    var asmPrefix = os.type() == "Darwin" ? "limactl shell debian " : ""

    try{
        var str;
        if(assemblerArgs.dontLink)
        {
            if(assemblyOutFiles.length != 1)
            {
                console.log("Error: cannot use '-c' with multiple input files")
                process.exit(1)
            }
            str = `${asmPrefix}gcc -c ${assemblyOutFiles.join(" ")} -o ${assemblerArgs.outFile} -g -no-pie -m32 -fno-asynchronous-unwind-tables`
            //console.log(str)
        }
        else
        {
            str = `${asmPrefix}gcc ${assemblyOutFiles.join(" ")} ${assemblerArgs.linkLocals.join(" ")} -o ${assemblerArgs.outFile} -g -no-pie -m32 -fno-asynchronous-unwind-tables ${assemblerArgs.linkExternals.join(" ")}`
        }

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