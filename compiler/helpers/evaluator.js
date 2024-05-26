function evaluate(line)
{
    var typeStack = []
    line = line.map((x) => { // bad code yes
        if(objectIncludes(defines.types, x))
        {
            typeStack.splice(0, 0, objCopy(defines.types[x]))
            return null
        } else if(helpers.variables.variableExists(x))
        {
            typeStack.splice(0, 0, helpers.variables.getVariableType(x))
            return null
        }
        return x;
    }).filter(x => x)
    //throwE(line, typeStack)

    function popTypeStack(u32ifNo = false) {
        if (typeStack.length == 0) {
            if(u32ifNo){
                return defines.types.u32;
            }
            throwE("[COMPILER] Missing expected type")
        }
        return typeStack.pop()
    }

    for(var wordNum = 0; wordNum < line.length; wordNum++)
    {
        
        var word = line[wordNum]
        var offsetWord = x => wordNum + x >= 0 ? line[wordNum + x] : null;
        
        // #region Variables
        if(word == "create")
        {
            /*
               0    1   2  3
            create bob <- jon
            create bob u32    (u32 will not show up)
            */
            if(offsetWord(2) == '<-')
            {
                return {
                    word:actions.variables.create(offsetWord(1), popTypeStack(true), offsetWord(3)),
                    type:defines.types.u32
                }
            } else {
                return {
                    word: actions.variables.create(offsetWord(1), popTypeStack(true), 0),
                    type: defines.types.u32
                }
            }  
        }
        // #endregion
        // #region Formats
        if(word == ".")
        {

        }
        // #endregion
    }

}
module.exports = evaluate