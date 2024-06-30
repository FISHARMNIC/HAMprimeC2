getNum function<u32 n> -> u32
{
    return(n);
}

entry function<p8 args, u32 argv> -> u32
{
    create x <- 0;
    create y <- 9;
    while(x <: getNum(3))
    {
        printf("%i\n", (x * x));
        x <- (x + 1);
    }
}