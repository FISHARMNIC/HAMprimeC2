/*
Issue is:
    Somewhere, the code is writing to text instead of init.
    Still outside of function, so it never gets run.
*/

create arrGlobal <- {1,2,{3,4,5}, "chicken"};

entry function<> -> u32
{
    /* %N specifies how many bytes per element (default 4) */
    printf("%c\n", arrGlobal[3][%1 3]);

    return 0;
}