
#include sys bignums;

entry function<> -> u32
{
    create bob <- bignum("386415896392e-9");
    create jon <- bignum("123");

    bignum_div(bob, bob,jon);

    bignum_print(bob);

    return 0;
}