factorial function<u32 n> -> u32
{
    if(n >= 1)
    {
        return (n * factorial(n - 1));
    }
    return 1;
}

entry function<> -> u32
{
    create sum_index <- 0;
    create sum_end <- 10;

    create sum <- 0.0;

    while(sum_index <: sum_end)
    {
        sum <- (sum + (1.0 / (factorial(sum_index)));
        sum_index <- (sum_index + 1);
    }

    printf("%f", sum);
}