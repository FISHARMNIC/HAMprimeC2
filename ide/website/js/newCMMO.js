var conversions = {
    keywords: "def",
    types: "number",
    allVars: "keyword",
    functions: "num"
}

var _read_type = "none"

function smmatch(stream) {
    _read_type = "none"

    if (!(formatted_hg_info instanceof Array)) {
        return
    }

    formatted_hg_info.some(x => {
        var r = stream.match(x.value)
        if (r) {
            _read_type = conversions[x.type]
            //console.log(`found ${x.value} => ${_read_type}`)
        }
        return r
    })
}

function matchAll(stream, words) {
    return words == undefined ? false : words.some(x => {
        if (/^[a-zA-Z]+$/.test(x)) // only letters
        {
            //console.log(`\\b${x}\\b`)
            return stream.match(new RegExp(`\\b${x}\\b`))
        }
        return stream.match(x)

    })
}

var operators = ["!=", "<<", ">>", "<:", ":>", "==", "<=", ">=", "->", "<-", "+", "-", "*", "/", "|", "&", "%", "<", ">", "(", ")", ":"]
var brackets = ["{", "}", "[", "]"]

var inComment = false

CodeMirror.defineMode("HAM", function () {
    return {
        token: function (stream, state) {
            if (stream.eatSpace()) return null;

            if (stream.match("/*") || inComment) {
                if (stream.match("*/")) {
                    inComment = false
                } else {
                    inComment = true
                }
                stream.next()
                return "comment"
            } else if (stream.match("//")) { // comments
                stream.skipToEnd();
                return "comment";
            }
            else if (matchAll(stream, brackets)) {
                return "brack"
            }
            else if (stream.match("#")) {
                stream.skipToEnd();
                return "keyword";
            }
            else if (matchAll(stream, operators)) // ops
            {
                return "ops"
            } else if (stream.match(/".*?"/) || stream.match(/`.*?`/)) { // strings
                return "string";
            } 

            smmatch(stream)
            if (_read_type != "none") {
                return _read_type
            }

                stream.next();
                return null;
        }
    };

});