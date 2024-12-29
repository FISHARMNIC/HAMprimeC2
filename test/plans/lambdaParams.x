doOperation function<u32 a, u32 b, any operation> -> auto
{
    call operation(a,b) -> none;
}

testStuff function<u32 oa, u32 ob, u32 oc>
{
    doOperation(4,5, 
        lambda<u32 pa, u32 pb> -> auto {
            print_(`${oa} ${ob} ${oc}`);
            someVar <- pa + pb + someVar;
        }
    );
}

entry function<> -> u32
{
    create someVar <- 123;
    create otherVar <- 456;

    /* JS_EVAL "throwE(getAllStackVariables())"; */

    /* Showing lambda captures */

    testStuff(1,2,3);

    print_(`someVar is now ${someVar}`);
    return 0;
}