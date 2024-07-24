var textarea = document.getElementById("code")
var highlight = document.getElementById("highlight")
var assembly = document.getElementById("assembly")
var codezone = document.getElementById("zone_code")

var editor = CodeMirror.fromTextArea(textarea, {
    lineNumbers: true,
    mode: 'text/x-c++src',
    theme: 'idea',
    extraKeys: {
        "Tab": function(cm){
            cm.replaceSelection("    " , "end");
        }
    }
})

var highlighter = CodeMirror.fromTextArea(highlight, {
    lineNumbers: false,
    mode: 'text/x-c++src',
    theme: 'idea',
    readOnly: true,
    scrollbarStyle: null,
})

var assembly_viewer = CodeMirror.fromTextArea(assembly, {
    lineNumbers: true,
    mode: { name: 'gas', architecture: "x86" },
    theme: 'idea',
    readOnly: true,
})

assembly_viewer.setSize("100%", "100%")
editor.setSize("80%", "100%")
highlighter.setSize("100%", "100%")


function highlightErr(view, line, msg = null) {

    console.log(line)
    if (view.__marked_err != undefined) {
        view.__marked_err.clear();
    }

    if (msg != null && view == highlighter) {
        console.log("HIH")
        if ((highlighter.__marked_err_word) != undefined) {
            highlighter.__marked_err_word.clear();
        }

        highlighter.setValue("\n".repeat(line) + " ".repeat(75) + msg)
        highlighter.__marked_err_word = highlighter.markText(
            { line: line, ch: 75 },
            { line: line, ch: 999 },
            { className: "highlight_yellow", atomic: true }
        )
    }
    view.__marked_err = view.markText(
        { line: line, ch: 0 },
        { line: line, ch: 999 },
        { className: "highlight_red", atomic: true }
    )

    // highlighter.markText(
    //     { line: line, ch: offset },
    //     { line: line, ch: 999 },
    //     { className: "highlight_yellow" }
    //   )

}

function eoc() {
    document.getElementById("saveIcon").hidden = false
}

editor.on('change', eoc)
// highlighter.setValue(Array(1000).fill(" ".repeat(1000)).join("\n"))

assembly_viewer.on('cursorActivity', function () {
    var lineNo = assembly_viewer.getCursor().line
    console.log(lineNo)
})