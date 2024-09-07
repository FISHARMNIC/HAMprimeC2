function removeTabs(e) {
    return e.split("").map(x => x == "\t" ? "" : x).join("")
}

module.exports = function(execFileLikeTrue, line) {
    var lineRead = -1
    var lookAtFile = -1;
    //console.log(":::", execFileLikeTrue)
    while (lineRead != line) {
        lookAtFile++
        lineRead++
        execFileLikeTrue[lookAtFile] = removeTabs(execFileLikeTrue[lookAtFile])
        //console.log("::::", execFileLikeTrue[lookAtFile], lineRead, lookAtFile)
        while (execFileLikeTrue[lookAtFile].length == 0) //skip
        {
            lookAtFile++
        }
    }
    return lookAtFile

}