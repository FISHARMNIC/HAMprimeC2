var textarea = document.getElementById("code")
var highlight = document.getElementById("highlight")
var assembly = document.getElementById("assembly")
var codezone = document.getElementById("zone_code")
var selected_info = document.getElementById("info_viewer")

var editor = CodeMirror.fromTextArea(textarea, {
    lineNumbers: true,
    mode: "HAM",
    //mode: 'text/x-c++src',
    theme: 'oceanic-next',
    extraKeys: {
        "Tab": function(cm){
            cm.replaceSelection("    " , "end");
        }
    },
    foldOptions: {
        rangeFinder: CodeMirror.fold.brace
    },
    foldGutter: true,
    gutters: ["CodeMirror-linenumbers", "CodeMirror-foldgutter"]
})

var highlighter = CodeMirror.fromTextArea(highlight, {
    lineNumbers: false,
    mode: null,
    readOnly: true,
    scrollbarStyle: null,
})

var assembly_viewer = CodeMirror.fromTextArea(assembly, {
    lineNumbers: true,
    mode: { name: 'gas', architecture: "x86" },
    theme: 'oceanic-next',
    readOnly: true,
})

var selected_info_viewer = CodeMirror.fromTextArea(selected_info, {
    lineNumbers: false,
    mode: "HAM",
    theme: 'oceanic-next',
    readOnly: true,
})

assembly_viewer.setSize("100%", "100%")
editor.setSize("100%", "100%")
highlighter.setSize("100%", "100%")

function clrErr(view = highlighter, _name = "__marked_err")
{
    
    if (view[_name] != undefined) {
        view[_name].clear();
        view[_name] = undefined
    }

    if ((view[_name + "_word"]) != undefined) {
        view[_name + "_word"].clear();
        view[_name + "_word"] = undefined
    }

    if(view.__clearMe__)
    {
        view.setValue("")
        view.__clearMe__ = false
    }
}
function highlightErr(view, line, msg = null, _name = "__marked_err") {

    clrErr(view, _name)
    // if (view[_name] != undefined) {
    //     view[_name].clear();
    // }

    if (msg != null) {
        view.__clearMe__ = true
        view.setValue("\n".repeat(line) + " ".repeat(68) + msg)
        view[_name + "_word"] = view.markText(
            { line: line, ch: 75 },
            { line: line, ch: 999 },
            { className: "highlight_yellow", atomic: true }
        )
    }

    view[_name] = view.markText(
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

function clearHighlightedAsmLine(o = editor)
{
    if(o["__asm"] != undefined)
    o["__asm"].clear();
}


function eoc() {
    document.getElementById("saveIcon").hidden = false
    clrErr(highlighter)
    clrErr(assembly_viewer)
}

editor.on('change', eoc)

editor.on('cursorActivity', clrset)


function __removeTabs(e) {
    try {
    return e.split("").map(x => x == "\t" ? "" : x).join("")
    } catch(error)
    {
        console.log("COUND NOT PARSE", error)
        return e
    }
}

function __getTrueLine(execFileLikeTrue, line) {

    //console.log(execFileLikeTrue)
    var lineRead = -1
    var lookAtFile = -1;
    //console.log(":::", execFileLikeTrue)
    while (lineRead != line && lookAtFile < execFileLikeTrue.length) {
        lookAtFile++
        lineRead++
        if(execFileLikeTrue[lookAtFile] == undefined)
            return -1
        execFileLikeTrue[lookAtFile] = __removeTabs(execFileLikeTrue[lookAtFile])
        while (lookAtFile < execFileLikeTrue.length && execFileLikeTrue[lookAtFile].length == 0) //skip
        {
            lookAtFile++
        }
    }
    return lookAtFile

}

function getLineFromAsm(asmLine){
    var data = debugInfoJSON
    //console.log(data)
    var fsout = editor.doc.getValue()

    execFileLikeTrue = fsout.split("\n")
    execFile = fsout.replace(/\n/g, ";").split(";").filter(x => x);

    var noOffset = asmLine // line of fault in assembly (1 index)
    var offset = noOffset - data.offset                                     // line of fault in text section


    //console.log(data, offset, data.offset)
    while (data[offset] == undefined) {
        if (offset >= 0)
            offset--;
        else
            return -1
    }
    if (offset >= 0) {
        //console.log(execFileLikeTrue)
        var info = data[offset]
        var tline = __getTrueLine(execFileLikeTrue, info[0].line)
        if(tline == -1)
        {
            //getTerminal().value += "\n[IDE ERROR] Unable to track assembly"
        }
        return tline
    }
}

function highlightLineFromAsm(line, o = highlighter, end = line) {
    if(end == -1)
        end = line
    
    if (line >= 0) {
        o["__asm"] = o.markText(
            { line: line, ch: 0 },
            { line: end, ch: 999 },
            { className: "highlight_gray", atomic: true }
        )
    }
}

function asmLineFromCode(line)
{
    var len = assembly_viewer.doc.getValue().split("\n").length
    //console.log(len)
    for(var i = len; i >= 0; i--)
    {
        // var l = getLineFromAsm(i) - 1
        if(line > getLineFromAsm(i - 1))
        {
            // get end
            var b = i
            while(getLineFromAsm(b) <= line)
            {
                b++
                if(b > len)
                {
                    b = -1
                    break
                }
            }

            return [i - 1,b - 1]
        }
    }
    return -1
}

function clrset()
{
    //console.log("cc")
    selected_info_viewer.setValue("")
    clearHighlightedAsmLine()
    clearHighlightedAsmLine(assembly_viewer)

    var lineNo = editor.getCursor().line
    var line = asmLineFromCode(lineNo)

    highlightLineFromAsm(line[0], assembly_viewer, line[1])
    
    assembly_viewer.scrollIntoView({ line: line[0], ch: 0}, 100);
}

// highlighter.setValue(Array(1000).fill(" ".repeat(1000)).join("\n"))

// assembly_viewer.on('cursorActivity', function () {
//     var lineNo = assembly_viewer.getCursor().line

//     var line = getLineFromAsm(lineNo)
//     clearHighlightedAsmLine()

//     highlightLineFromAsm(line)
// })

// from https://stackoverflow.com/questions/1026069/how-do-i-make-the-first-letter-of-a-string-uppercase-in-javascript
function capitalize(s)
{
    return s && String(s[0]).toUpperCase() + String(s).slice(1);
}

document.addEventListener("selectionchange", e => {
    var selectedText = editor.getSelection()

    const cursor = editor.getCursor(); // {line, ch}

    // Get the screen coordinates of the cursor
    const coords = editor.cursorCoords(cursor, 'page'); // {left, top, bottom}

    console.log('Cursor Position:', cursor);
    console.log('Screen Coordinates:', coords);


    // make not for each
    var n = -1
    Object.entries(highlightingInfo).forEach(e => {
        if(e[1].includes(selectedText))
        {
            n = e[0]
        }
    })
    if(n != -1)
    {
        if(n == "allVars")
        {
            n = "variable"
        } else {
            n = n.slice(0, n.length - 1)
        }
    selected_info_viewer.setValue(`${selectedText} : "${n}"`)
    document.getElementById("keywordInfo").src = `https://fisharmnic.github.io/docs/Keywords/${capitalize(selectedText)}.html`
    }
})