#include sys bignums;

Bignum format
{
    .number p32;

    .Bignum constructor<string numstr>
    {
        this.number <- bignum(numstr);
    }

    .add method<Bignum other> -> Bignum
    {
        bignum_add(this, this, other); 
        return this;
    }

    .addWith method<string
}
