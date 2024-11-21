doOperation function<u32 a, u32 b, any operation> -> auto
{
    call operation(a,b) -> none;
}

entry function<> -> u32
{
    create someVar <- 123;
    create otherVar <- 456;

    /* JS_EVAL "throwE(getAllStackVariables())"; */

    /* Showing lambda captures */

    doOperation(4,5, 
        lambda<u32 pa, u32 pb> -> auto {
            print_(`someVar is ${someVar}`);
            print_(`setting someVar to: ${pa} + ${pb} + ${someVar} = ${pa + pb + someVar}`); 
            someVar <- pa + pb + someVar;
        }
    );

    print_(`someVar is now ${someVar}`);
    return 0;
}