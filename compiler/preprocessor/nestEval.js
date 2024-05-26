// this is what is to be imported

var nesters = {
    '(': ')',
    '{': '}',
    '[': ']',
    '<': '>'
}

function nest(split_line) {
    var out = []          // output
    var refStack = [out]  // stack of last references
    var openingStack = [] // stack of last parenthesis

    console.log(split_line)
    for (var wordIndex = 0; wordIndex < split_line.length; wordIndex++) {
        var word = split_line[wordIndex]
        if (Object.keys(nesters).includes(word)) {
            openingStack.push(word) // push opening parenthesis
            var nref = []
            refStack.at(-1).push(word)
            refStack.at(-1).push(nref)          // push new nested arr
            refStack.push(nref)
        }
        else if (nesters[openingStack.at(-1)] == word) // close par
        {
            refStack.pop();
            openingStack.pop();
            refStack.at(-1).push(word)
        }
        else{
            refStack.at(-1).push(word)
        }
    }
    console.logArr(out)
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
        } else /*if(word != '(' && word != ')')*/{
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
        evaluator(aline)
        console.log(`EV${tevDELETE} = EVALUATE: ${aline.join(" ")}`)
        return (`EV${tevDELETE++}`)
    }
}

module.exports = { nest, orderDeepestFirst, runDeepestFirst, nesters }