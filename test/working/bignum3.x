#include sys bignums;

create p32 factorial_res;

factorial function<u32 n> -> p32
{
    bignum_set_fromInt(factorial_res, 1);

    create i <- n;
    while(i >= 2)
    {
        bignum_mul_intb(factorial_res, factorial_res, i);
        i <- (i - 1);
    }

    return factorial_res;
}

entry function<> -> u32
{
    bignum_setp(256);

    create sum_index <- 0;
    create sum_end <- 100;

    create sum <- bignum("0");
    create one <- bignum("1");
    create divisor <- bignum("1");
    create intermediate <- bignum("0");
    
    // just allocate one time;
    factorial_res <- bignum("0");

    while(sum_index <: sum_end)
    {
        bignum_div(intermediate, one, factorial(sum_index));
        bignum_add(sum, sum, intermediate);
        sum_index <- (sum_index + 1);
    }

    bignum_print(sum);

    return 0;
}