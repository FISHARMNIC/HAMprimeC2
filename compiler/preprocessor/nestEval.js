// this is what is to be imported

var nesters = {
    '(': ')',
    '[': ']',
    '<': '>'
}

function nest(split_line) {
    //throwE("Use nest2. Nest is longer being used")
    var out = []          // output
    var refStack = [out]  // stack of last references
    var openingStack = [] // stack of last parenthesis

    //console.log(split_line)
    for (var wordIndex = 0; wordIndex < split_line.length; wordIndex++) {
        var word = split_line[wordIndex]
        if (Object.keys(nesters).includes(word) || word == "<-") {
            openingStack.push(word) // push opening parenthesis
            var nref = []
            if(word != "(")
                refStack.at(-1).push(word)
            refStack.at(-1).push(nref)          // push new nested arr
            refStack.push(nref)
        }
        else if (nesters[openingStack.at(-1)] == word) // close par
        {
            refStack.pop();
            openingStack.pop();
            if(word != ")")
                refStack.at(-1).push(word)
        }
        else {
            refStack.at(-1).push(word)
        }
    }
    //console.logArr(out)
    return out
}

function nest2(split_line, closers = [null]) {
    var out = []
    console.log(split_line.join(" "))
    for (var wordIndex = 0; wordIndex < split_line.length; wordIndex++) {
        var word = split_line[wordIndex]
        if (Object.keys(nesters).includes(word)) {
            var ret = nest2(split_line.slice(wordIndex + 1), [nesters[word]])
            wordIndex += ret.t 
            out.push(word)
            out.push(ret.d)
        }
        else if (word == "<-") {
            out.push(nest2(split_line.slice(wordIndex + 1), [null]))
            return out
        } //else if(defines.operators.includes(split_line[wordIndex]) && closers != defines.mathEnders) // math
        // {
        //     var ret = nest2(split_line.slice(wordIndex - 1), defines.mathEnders)
        //     wordIndex += ret.t - 2
        //     out.push(ret.d)
        // }
        else if (closers.includes(word)) { // closing
            return {
                d: out,
                t: wordIndex
            }
        } else
        {
            out.push(word)
        } 
        
        //if(!defines.operators.includes(split_line[wordIndex + 1])){
        //     out.push(word)
        // }
    }

    //console.log(opener, split_line)
    if (closers[0] != null) {
        throwE(`Unclosed parameter in line`, split_line)
    }
    return out
}

function orderDeepestFirst(line) {
    var lineq = []
    var bckq = []
    var n = 0;
    line.forEach((word, index) => {

        if (typeof (word) == "object") {
            //console.log("nesting on", word)
            lineq.push(orderDeepestFirst(word))
            bckq.push(n++)
        } else /*if(word != '(' && word != ')')*/ {
            bckq.push(word)
        }
    })
    bckq.splice(0, 0, ...lineq)
    bckq.push(n)
    return bckq
}

var tevDELETE = 0

function runDeepestFirst(line) {
    var nestedEnd = line.at(-1)
    if (nestedEnd != 0 && line.length != 0) {
        var oArr = []
        for (var i = 0; i < nestedEnd; i++) {
            var outT = runDeepestFirst(line.slice(0, nestedEnd)[i])

            line = line.map(x => { // if accessing a number that needs to be replaced, replace it
                if (x == i) {
                    return outT
                }
                return x
            })
        }
        var newA = [...line.slice(nestedEnd, line.length - 1), 0]
        //console.log("weeee", newA)
        return runDeepestFirst(newA)
    }
    else {
        var aline = line.slice(0, line.length - 1)
        // here is where stuff should be evaluated. Using aline

        // it then needs to be replaced with a label
        //console.log("COMPILING",aline)

        var output = evaluator(aline)
        if(output.length ==1)
            output = output[0]
        //console.log("=====OUT", output)
        return output


        // console.log(`EV${tevDELETE} = EVALUATE: ${aline.join(" ")}`)
        // return (`EV${tevDELETE++}`)
    }
}

module.exports = { nest, nest2, orderDeepestFirst, runDeepestFirst, nesters }