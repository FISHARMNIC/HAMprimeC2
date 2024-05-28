function evaluate(line) {
    console.log(line)
    line = line.map((x) => { // bad code yes
        if (objectIncludes(defines.types, x) && !objectIncludes(userFormats, x)) {
            typeStack.splice(0, 0, objCopy(defines.types[x]))
            return null
        } else if (helpers.variables.variableExists(x)) {
            typeStack.splice(0, 0, helpers.variables.getVariableType(x))
        }
        return x;
    }).filter(x => x)
    //throwE(line, typeStack)

    function popTypeStack(u32ifNo = false) {
        if (typeStack.length == 0) {
            if (u32ifNo) {
                return defines.types.u32;
            }
            throwE("[COMPILER] Missing expected type")
        }
        return typeStack.pop()
    }

    for (var wordNum = 0; wordNum < line.length; wordNum++) {

        var word = line[wordNum]
        var offsetWord = x => wordNum + x >= 0 ? line[wordNum + x] : null;

        // #region formats
        if (word == '.') { // child property UNFINISHED
            if (objectValuesIncludes(nest.nesters, offsetWord(-1))) // if like >. or ).
            {
                parent = offsetWord(-1)
            } else {

            }
        } else if (objectIncludes(userFormats, word)) // if word is a class
        {
            console.log("=======", scope)
            if (offsetWord(1) == '<') // if using an init
            {
                var dataLbl = actions.formats.parseParams(word, offsetWord(2))
                line[wordNum] = dataLbl
                line.splice(wordNum + 1, 3)
            }
            console.log("=======", scope)
        }
        // #endregion
        // #region Variables
        else if (word == "create") {        // variable creation
            /*
               0    1   2  3
            create bob <- jon
            create bob u32    (u32 will not show up)
            */
            if (getLastScopeType == keywordTypes.FORMAT) {
                throwE("'Create' should not be used inside of a format")
            }

            if (offsetWord(2) == '<-') {
                typeStack.push(defines.types.u32)
                return actions.variables.create(offsetWord(1), popTypeStack(true), offsetWord(3))
            } else {
                typeStack.push(defines.types.u32)
                return actions.variables.create(offsetWord(1), popTypeStack(true), 0)
            }
        } else if (offsetWord(1) == "<-") { // variable setting
            if (getLastScopeType() == keywordTypes.FORMAT) { // just creating a property
                scope[scope.length - 1].data.properties.push({
                    name: word,
                    type: popTypeStack()
                })
            } else {
                typeStack.push(defines.types.u32)
                return actions.variables.set(word, offsetWord[1])
            }
        } else if (word[0] == '"' && word[word.length - 1] == '"') {
            line[wordNum] = actions.allocations.newStringLiteral(word.substring(1, word.length - 1))
        }
        // #endregion
        // #region Brackets
        else if (word == "{") {
            if (requestBracket != 0) {
                newScope(requestBracket)
                requestBracket = 0
            } else {
                // array
            }
        } else if (word == "}") {
            var oldScope = scope.pop()
            if (oldScope.type == keywordTypes.FORMAT) {
                userFormats[oldScope.data.name] = {
                    properties: oldScope.data.properties,
                    statics: oldScope.data.statics,
                    methods: {},
                    inits: {},
                    size: helpers.formats.getFormatSize(oldScope.data.properties)
                }
                var nobj = objCopy(defines.types.___format_template___)
                nobj.formatPtr = userFormats[oldScope.data.name]
                defines.types[oldScope.data.name] = nobj
            }
            console.log("IJWJWWO", scope)
        }
        // #endregion
        // #region Keywords
        else if (defines.keywords.includes(word)) // keyword   
        {
            var kname = offsetWord(-1)
            if (word == "format") {
                requestBracket = {
                    type: keywordTypes.FORMAT,
                    data: {
                        name: kname,
                        properties: [],
                        statics: [],
                        size: 0
                    }
                }
            } else if (word == "persistent") {
                nextAllocIsPersistent = true;
            }
        }
        // #endregion
        // #region Math

        // #endregion
    }

    for (var wordNum = 0; wordNum < line.length; wordNum++) {
        var word = line[wordNum]
        if (defines.operators.includes(line[wordNum + 1])) {
            var start = wordNum
            var onNum = true;
            var build = [];
            while (wordNum < line.length) {
                word = line[wordNum]
                if (onNum) {
                    if (defines.symbols.includes(word) || defines.operators.includes(word)) {
                        break;
                    }
                }
                build.push(word)
                onNum = !onNum;
                wordNum++;
            }
            var lbl = mathEngine(build)
            line.splice(start, build.length + 1, lbl)
        }
    }

    return line
}
module.exports = evaluate