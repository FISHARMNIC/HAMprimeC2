var textarea = document.getElementById("code")
var highlight = document.getElementById("highlight")
var assembly = document.getElementById("assembly")
var codezone = document.getElementById("zone_code")

var editor = CodeMirror.fromTextArea(textarea, {
    lineNumbers: true,
    mode: 'text/x-c++src',
    theme: 'idea',
})

var highlighter = CodeMirror.fromTextArea(highlight, {
    lineNumbers: true,
    mode: 'text/x-c++src',
    theme: 'idea',
    readOnly: true
})

var assembly_viewer = CodeMirror.fromTextArea(assembly, {
    lineNumbers: true,
    mode: {name: 'gas', architecture: "x86"},
    theme: 'idea',
    readOnly: true,
})

assembly_viewer.setSize("100%", "100%")
editor.setSize("80%", "100%")
highlighter.setSize("100%", "100%")

function highlightErr(line, msg) {
    var txt = editor.doc.getValue().split("\n")
    //var pad = parseInt(codezone.style.width.replace("%", "") - 20)
    //var offset = txt[line].length + pad
    //txt[line] += " ".repeat(pad) + msg
    //highlighter.setValue(txt.join("\n"))
    
    editor.markText(
      { line: line, ch: 0 },
      { line: line, ch: 999 },
      { className: "highlight_red" }
    )

    // highlighter.markText(
    //     { line: line, ch: offset },
    //     { line: line, ch: 999 },
    //     { className: "highlight_yellow" }
    //   )

  }

function eoc()
{
    const text = editor.doc.getValue()
    //highlighter.setValue(text)
    var from = {line: 0, ch: 0}
    var to = {line:10, ch: 10}
    
    highlightErr(0, "hello")
}

editor.on('change', eoc)


assembly_viewer.on('cursorActivity', function() {
    var lineNo = assembly_viewer.getCursor().line
    console.log(lineNo)
})