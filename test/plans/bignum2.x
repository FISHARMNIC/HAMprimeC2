#include sys bignums;

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

    create sum <- bignum("0");
    create one <- bignum("1");
    create divisor <- bignum("1");

    create intermediate <- bignum("0");

    while(sum_index <: sum_end)
    {
        bignum_div_intb(intermediate, one, factorial(sum_index));
        bignum_add(sum, sum, intermediate);
        sum_index <- (sum_index + 1);
    }

    bignum_print(sum);

    return 0;
}