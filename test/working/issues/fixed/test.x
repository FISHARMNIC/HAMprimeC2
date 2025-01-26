something function<>
{
    create inner <- u8[10];
}

entry function<>
{
    /* doesn't gc "inner" since gc checks before it gets overriden, and doesn't check next time since new scope */
    /* possible solution could be to desotry everything that is owned on the stack */

    create alpha <- u8[10];
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
    something();
}