var site = window.location.origin

function getTerminal()
{
    return document.getElementById("zone_terminal_ta")
}

function clearTerm()
{
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
        var out = JSON.parse(get("compile")).data
        var out_as = JSON.parse(get("assemble")).data
        document.getElementById("zone_terminal_ta").value = out.join("\n") + out_as.join("\n")
        var out = this.getOutput()
        assembly_viewer.setValue(out)
    },
    getOutput: function() {
        return get("asm")
    },
    getFiles: function () {
        return JSON.parse(get("ls")).data
    },
    runCompiled: function() {
        getTerminal().value = "Compiling..."
        var out = JSON.parse(get("run"))
        console.log(out)
        getTerminal().value = out.out.join("\n") + "\n" + "Exited with code: " + out.code
    },
    loadFile: function(file) {
        var out = get(`read/${file}`)
        editor.setValue(out)
    },
    compileAndRun: function() {
        this.compile()
        this.runCompiled()
    },
    debug: function(file) {
        getTerminal().value = "Debugging..."
        var out = JSON.parse(get(`debug`))
        console.log(out.data)
        getTerminal().value = out.data.join("\n")
    }
}