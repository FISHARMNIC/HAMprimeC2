var site = window.location.origin

function getTerminal() {
    return document.getElementById("zone_terminal_ta")
}

function clearTerm() {
    getTerminal().value = ""
}

function get(command) {
    const xhr = new XMLHttpRequest()
    xhr.open('GET', site + "/get/" + command, false)
    xhr.send(null)
    if (xhr.status != 200) {
        throw new Error('Fail' + xhr.statusText)
        return 0
    }
    return xhr.responseText
}

var comms = {
    compile: function () {
        show("terminal")
        var out = JSON.parse(get("compile")).data
        if (out[out.length - 2] == "================== THIS WAS THROWE ==================") {
            console.log("F")
            document.getElementById("zone_terminal_ta").value = out.join("\n")
            var failedLine = out[out.length - 1]
            highlightErr(highlighter, failedLine, "[ERR]")
        } else {
            console.log("W")
            var out_as = JSON.parse(get("assemble")).data
            document.getElementById("zone_terminal_ta").value = out.join("\n") + out_as.join("\n")
            var out_asm = this.getOutput()
            assembly_viewer.setValue(out_asm)
        }
    },
    getOutput: function () {
        return get("asm")
    },
    getFiles: function () {
        return JSON.parse(get("ls")).data
    },
    runCompiled: function () {
        show("terminal")
        getTerminal().value = "Compiling..."
        var out = JSON.parse(get("run"))
        console.log(out)
        getTerminal().value = out.out.join("\n") + "\n" + "Exited with code: " + out.code
    },
    loadFile: function (file) {
        var out = get(`read/${file}`)
        editor.setValue(out)
    },
    compileAndRun: function () {
        this.compile()
        this.runCompiled()
    },
    debug: function (file) {
        var _out = this.getOutput()
        assembly_viewer.setValue(_out)

        getTerminal().value = "Debugging..."
        var out = JSON.parse(get(`debug`))
        console.log(out.data)
        var errorData = out.data[0]
        if (errorData != "OK") {
            var problematicLineHAM = parseInt(errorData.slice(0, errorData.indexOf(" ")))
            var problematicLineASM = parseInt(errorData.slice(errorData.indexOf(" ")))
            getTerminal().value = "Segmentation Fault\n"
            if (problematicLineHAM != -1) {
                highlightErr(highlighter, problematicLineHAM, "[SEG]")
                highlightErr(assembly_viewer, problematicLineASM - 1)
            }
        } else {
            getTerminal().value = "No run-time errors\n"
        }
        getTerminal().value += out.data.join("\n")
    }
}

comms.loadFile("ex3.x")