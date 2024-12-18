factorial function<u32 n> -> u32
{
    print_("Reading: " + n);
    if(n >= 1)
    {
        return (n * factorial(n - 1));
    }
    return 1;
}

entry function<> -> u32
{
    printf("%i\n", factorial(5));
    return 0;
}