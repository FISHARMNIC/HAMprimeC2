entry function<> -> u32
{
    /* make sure to wrap in parenthesis! */
    create bob <- (lambda<u32 a, u32 b> {
        print_(`${a} + ${b} = ${a + b}`);
    });
    
    //JS_EVAL "throwE(globalVariables)";

    bob(123, 456);
}