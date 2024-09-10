var textarea = document.getElementById("code")
var highlight = document.getElementById("highlight")
var assembly = document.getElementById("assembly")
var codezone = document.getElementById("zone_code")

var editor = CodeMirror.fromTextArea(textarea, {
    lineNumbers: true,
    mode: "HAM",
    //mode: 'text/x-c++src',
    theme: 'oceanic-next',
    extraKeys: {
        "Tab": function(cm){
            cm.replaceSelection("    " , "end");
        }
    }
})

var highlighter = CodeMirror.fromTextArea(highlight, {
    lineNumbers: false,
    mode: 'none',
    theme: 'idea',
    readOnly: true,
    scrollbarStyle: null,
})

var assembly_viewer = CodeMirror.fromTextArea(assembly, {
    lineNumbers: true,
    mode: { name: 'gas', architecture: "x86" },
    theme: 'oceanic-next',
    readOnly: true,
})

assembly_viewer.setSize("100%", "100%")
editor.setSize("100%", "100%")
highlighter.setSize("100%", "100%")


function highlightErr(view, line, msg = null, _name = "__marked_err") {

    console.log(line)
    if (view[_name] != undefined) {
        view[_name].clear();
    }

    if (msg != null && view == highlighter) {
        console.log("HIH")
        if ((highlighter[_name + "_word"]) != undefined) {
            highlighter[_name + "_word"].clear();
        }

        highlighter.setValue("\n".repeat(line) + " ".repeat(68) + msg)
        highlighter[_name + "_word"] = highlighter.markText(
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
}

editor.on('change', eoc)

editor.on('cursorActivity', clrset)


function __removeTabs(e) {
    return e.split("").map(x => x == "\t" ? "" : x).join("")
}

function __getTrueLine(execFileLikeTrue, line) {
    var lineRead = -1
    var lookAtFile = -1;
    //console.log(":::", execFileLikeTrue)
    while (lineRead != line) {
        lookAtFile++
        lineRead++
        execFileLikeTrue[lookAtFile] = __removeTabs(execFileLikeTrue[lookAtFile])
        //console.log("::::", execFileLikeTrue[lookAtFile], lineRead, lookAtFile)
        while (execFileLikeTrue[lookAtFile].length == 0) //skip
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
        var info = data[offset]
        var tline = __getTrueLine(execFileLikeTrue, info[0].line)
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
    console.log("cc")
    clearHighlightedAsmLine()
    clearHighlightedAsmLine(assembly_viewer)

    var lineNo = editor.getCursor().line
    var line = asmLineFromCode(lineNo)

    highlightLineFromAsm(line[0], assembly_viewer, line[1])
    
    assembly_viewer.scrollIntoView({ line: line[0], ch: 0}, 100);
}

// highlighter.setValue(Array(1000).fill(" ".repeat(1000)).join("\n"))

assembly_viewer.on('cursorActivity', function () {
    var lineNo = assembly_viewer.getCursor().line

    var line = getLineFromAsm(lineNo)
    clearHighlightedAsmLine()

    highlightLineFromAsm(line)
})