entry function<> -> u32
{
    create arr <- {1,2,3};
    create i <- 0;
    while(i <: 3)
    {
        printf("%i\n", @(arr + (i * 4)));
        i <- i + 1;
    }
    return 0;
}