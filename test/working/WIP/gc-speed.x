inner function<>
{
    create someAlloc <- u32[1];
}

medium function<>
{
    create someAlloc <- u32[1];
    inner();
}

entry function<>
{
    create bob;

    create i <- 0;
    while(i <: 100000)
    {
        bob <- u32[1];
        medium();

        i <- i + 1;
    }
}