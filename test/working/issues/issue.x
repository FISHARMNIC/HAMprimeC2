/* issue is that it doesn't store size, but print attempts to access it */

create sarr <- {1,2,3};

entry function<>
{
    print_(sarr);
    return 0;

}