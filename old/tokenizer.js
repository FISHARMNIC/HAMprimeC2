var token_types = {
    KEYWORD: 0, // format, function, etc.
    TYPE: 1,    // u8, u16, etc.
    INTEGER: 2,
    FLOAT: 3,
    STRING: 4,
    SYMBOL: 5,  // !@#$ etc.
    NEST: 6,  // Not actually a word, and data is nested within this. The corresponding word/letter is stored in .data
    NAMED_PROPERTY: 7, // in declaring an instance of a format, like bob:"123"
    UNKNOWN_IDENTIFIER: 8, // Any word that's not declared, like a new
}

// expects arr[startIndex] to be "(", and returns matching ")"
function pSeek(arr, startIndex, opener, closer) {
    var c = 0;
    var i = startIndex;
    while (i < arr.length) {
        if (arr[i] == opener) {
            c++;

        } else if (arr[i] == closer) {
            c--;
            if (c == 0) {
                return i + 1;
            }
        }
        //console.log(arr[i], c)
        i++;
    }
    return -1;
}



function tokenize(split_line) {
    var i = 0;
    while (i++ < 10) {
        var ownerStack = []; // parenthesis nesting
        for (var wordIndex = 0; wordIndex < split_line.length; wordIndex++) {

            function readNoJoin(start, size) {
                var ret = split_line.slice(start, start + size).map(e => e.word)
                split_line.splice(start + 1, size - 1)
                return ret
            }

            function join(start, size) {
                split_line[start] = split_line.slice(start, start + size).map(e => e.word).join("")
                split_line.splice(start + 1, size - 1)
            }

            var word = split_line[wordIndex]
            var getWord = o => wordIndex + o < split_line.length && wordIndex + o >= 0 ? split_line[wordIndex + o] : false;

            var data = {};
            var return_obj = {};
            // For unparsed data, just give pass#2 some info like if it's a number
            if (typeof word == "string") {
                return_obj = { word, data, type: -1 };
                if (defines.keywords.includes(word)) {
                    return_obj.type = token_types.KEYWORD
                } else if (Object.keys(defines.types).includes(word)) {
                    return_obj.type = token_types.TYPE
                } else if (parseFloat(word) == word && word.includes(".")) {
                    return_obj.type = token_types.FLOAT
                } else if (parseInt(word) == word) {
                    return_obj.type = token_types.INTEGER
                } else if (word[0] == '"' && word[word.length - 1] == '"') {
                    return_obj.type = token_types.STRING
                } else if (defines.symbols.includes(word)) {
                    return_obj.type = token_types.SYMBOL
                } else {
                    return_obj.type = token_types.UNKNOWN_IDENTIFIER
                }
            }
            else {
                return_obj = word
                // #region FLOATS
                // if float in form of X.Y or X.Yf
                if (word.type == token_types.INTEGER && getWord(1).word == "." && getWord(2).type == token_types.INTEGER) {

                    join(wordIndex, getWord(3).word == "f" ? 4 : 3); // X.Yf
                    var wrd = doubleIEEE(parseFloat(split_line[wordIndex]))
                    return_obj = { word: wrd, data, type: token_types.FLOAT };
                }
                // if float in form of Xf
                else if (word.type == token_types.INTEGER && getWord(1).word == "f") {
                    join(wordIndex, 2)
                    var word = doubleIEEE(parseFloat(split_line[wordIndex]))
                    return_obj = { word, data, type: token_types.FLOAT };
                }
                // #endregion
                // #region PARENTHESIS
                else if (word.word == "(") {
                    // get area inside of parenthesis
                    var toToken = split_line.slice(wordIndex + 1, pSeek(split_line.map(e => e.word), wordIndex, "(", ")") - 1)
                    split_line.splice(wordIndex + 1, toToken.length + 1)
                    //console.log("TOKENIZING", toToken)
                    return_obj = { word: tokenize(toToken), data: "(", type: token_types.NEST }
                }
                else if (word.word == "<") {
                    // get area inside of parenthesis
                    var toToken = split_line.slice(wordIndex + 1, pSeek(split_line.map(e => e.word), wordIndex, "<", ">") - 1)
                    split_line.splice(wordIndex + 1, toToken.length + 1)
                    //console.log("TOKENIZING", toToken)
                    return_obj = { word: tokenize(toToken), data: "<", type: token_types.NEST }
                }
                // #endregion
                // #region MISC
                // if its in a format declaration. XX:YY
                else if (word.type == token_types.UNKNOWN_IDENTIFIER && getWord(1).word == ":") {
                    var stuff = readNoJoin(wordIndex, 3)
                    stuff = [stuff[0], tokenize(stuff[2].split())]
                    console.log(stuff)
                    return_obj = { word: stuff, type: token_types.NAMED_PROPERTY }
                }
            }


            split_line[wordIndex] = return_obj;
        }
    }
    //console.log(split_line)
    return split_line
}

module.exports = { tokenize, token_types };