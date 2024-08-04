create arrGlobal <- {1,2,9, "chicken"};

entry function<> -> u32
{
    /* %N specifies how many bytes per element (defaul 4) */
    printf("%c\n", arrGlobal[3][%1 3]);
}