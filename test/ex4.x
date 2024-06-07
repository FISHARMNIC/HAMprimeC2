factorial function<u32 n> -> u32
{
    if(n > 1)
    {
        return (n * factorial(n - 1));
    }
    return 1;
}

entry function<p8 args, u32 argv> -> u32
{
    printf("%i\n", factorial(5));
}