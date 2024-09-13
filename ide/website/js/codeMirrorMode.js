function matchAll(stream, words) {
  return words == undefined ? false : words.some(x => stream.match(x))
}

var operators = ["<<", ">>", "<:", ":>", "==", "<=", ">=", "->", "<-", "+", "-", "*", "/", "|", "&", "%", "<", ">","(", ")", ":"]
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
      else if (matchAll(stream, highlightingInfo.allVars)) {
        return "keyword"
      }
      else if (matchAll(stream, highlightingInfo.keywords)) {
        return "def"
      } else if(matchAll(stream, brackets)){
        return "brack"
      }
      else if (matchAll(stream, highlightingInfo.functions)) {
        return "num"
      }
      else if (matchAll(stream, highlightingInfo.types)) // types
      {
        return "number"
      } else if (matchAll(stream, operators)) // ops
      {
        return "string"
      } else if (stream.match(/".*?"/)) { // strings
        return "string";
      } else {
        stream.next();
        return null;
      }
    }
  };
});
