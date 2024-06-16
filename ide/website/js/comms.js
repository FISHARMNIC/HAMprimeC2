var site = window.location.origin

function clearTerm()
{
    document.getElementById("zone_terminal_ta").value = ""
}

function get(command) {
    const xhr = new XMLHttpRequest();
    xhr.open('GET', site + "/get/" + command, false);
    xhr.send(null);
    if (xhr.status != 200) {
        throw new Error('Fail' + xhr.statusText);
        return 0;
    }
    return xhr.responseText;
}

var comms = {
    compile: function () {
        var out = JSON.parse(get("compile")).data
        document.getElementById("zone_terminal_ta").value = out.join("\n")
        var out = this.getOutput()
        // assemble here too
        assembly_viewer.setValue(out)
    },
    getOutput: function() {
        return get("asm")
    },
    getFiles: function () {
        return JSON.parse(get("ls")).data
    },
    runCompiled: function() {
        var out = JSON.parse(get("run"))
        console.log(out)
        document.getElementById("zone_terminal_ta").value = out.stdout.join("\n") + "\n" + "Exited with code: " + out.status
    },
    loadFile: function(file) {
        var out = get(`read/${file}`)
        editor.setValue(out)
    }
}