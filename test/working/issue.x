/*
BROKEN! See comment below

*/

entry function<> -> u32
{
    create i <- 4;
    if(((i % 3) == 0) || ((i % 5) == 0))
    {
            printf("YES");
    }
}