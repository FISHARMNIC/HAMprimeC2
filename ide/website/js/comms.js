var site = window.location.origin
var currentOpenFile;
var fileIsSaved = false

function getTerminal() {
    return document.getElementById("zone_terminal_ta")
}

function clearTerm() {
    getTerminal().value = ""
}

function get(command) {
    const xhr = new XMLHttpRequest()
    try {
        xhr.open('GET', site + "/get/" + command, false)
        xhr.send(null)
    } catch (error) {
        window.alert("Server Crashed")
    }
    if (xhr.status != 200) {
        window.alert("Server failed to process request")
        return 0
    }
    return xhr.responseText
}

function send(string) {
    const xhr = new XMLHttpRequest();
    xhr.open("POST", site, false);

    // Send the proper header information along with the request
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = () => {
        // Call a function when the state changes.
        if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
            // Request finished. Do processing here.
        }
    };
    xhr.send(string);
}

var comms = {
    compile: function () {
        show("terminal")
        var out = JSON.parse(get("compile/" + currentOpenFile)).data
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
        currentOpenFile = file
        editor.setValue(out)
        document.getElementById("saveIcon").hidden = true
    },
    saveFile: function () {
        var textContent = editor.doc.getValue()
        console.log(textContent)
        send(JSON.stringify({ textContent, currentOpenFile }))
        document.getElementById("saveIcon").hidden = true
    },
    createFile: function(name) {
        get(`createFile/${name}`)
        renderFiles()
    },
    compileAndRun: function () {
        // https://stackoverflow.com/questions/6921895/synchronous-delay-in-code-execution 
        const wait = (msec) => new Promise((resolve, _) => {
            setTimeout(resolve, msec);
        });

        (async () => {
             this.compile()
            await wait(100);
             this.runCompiled();
        })();
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
            getTerminal().value = "Segmentation Fault\n" + "Line: " + problematicLineHAM  + "\nAssembly: " + problematicLineASM + "\n"
            if (problematicLineHAM != -1) {
                highlightErr(highlighter, problematicLineHAM - 1, "[SEG]")
                highlightErr(assembly_viewer, problematicLineASM - 1)
            }
        } else {
            getTerminal().value = "No run-time errors\n"
        }
        getTerminal().value += out.data.join("\n")
    }
}

comms.loadFile("recursion.x")
