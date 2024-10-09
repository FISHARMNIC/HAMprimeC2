/*

CURRENTLY WIP
compile with ./NEW_asmgmp.sh

*/

Bignum format
{
    /* Internal mpf_t struct
    https://stackoverflow.com/questions/69730892/typedef-anonymous-struct-array-of-size-1
    */

    .mpprec u32;
    .mpsize u32;
    .mpexp  u32;
    .mplimb p32;

    forward __gmpf_init         function<Bignum b> -> u32;
    forward __gmpf_init_set_str function<Bignum b, conststr n, u32 s> -> u32;

    forward __gmp_printf        function<conststr f, ...> -> u32;

    forward __gmpf_set          function<Bignum dest, Bignum src> -> u32;
    forward __gmpf_set_si       function<Bignum dest, u32 src> -> u32;

    forward __gmpf_add          function<Bignum dest, Bignum oa, Bignum ob> -> u32;
    forward __gmpf_sub          function<Bignum dest, Bignum oa, Bignum ob> -> u32;
    forward __gmpf_mul          function<Bignum dest, Bignum oa, Bignum ob> -> u32;
    forward __gmpf_div          function<Bignum dest, Bignum oa, Bignum ob> -> u32;

    forward __gmpf_sqrt         function<Bignum dest> -> u32;
    forward __gmpf_pow_ui       function<Bignum dest, Bignum src, u32 src> -> u32;
    
    .Bignum constructor<>
    {
        __gmpf_init(this);
    }

    .Bignum constructor<conststr numstr>
    {
        __gmpf_init_set_str(this, numstr, 10);
    }

    .print method<> -> u32
    {
        __gmp_printf("%Ff\n", this);
    }

    .set method<Bignum other> -> u32
    {
        __gmpf_set(this, other);
    }

    .set_int method<u32 other> -> u32
    {
        __gmpf_set_si(this, other);
    }

    .add method<Bignum other> -> Bignum
    {
        create output <- Bignum();
        __gmpf_add(output, this, other);
        return output;
    }

    .sub method<Bignum other> -> Bignum
    {
        create output <- Bignum();
        __gmpf_sub(output, this, other);
        return output;
    }

    .mul method<Bignum other> -> Bignum
    {
        create output <- Bignum();
        __gmpf_mul(output, this, other);
        return output;
    }

    .div method<Bignum other> -> Bignum
    {
        create output <- Bignum();
        __gmpf_div(output, this, other);
        return output;
    }

    .sqrt method<Bignum other> -> Bignum
    {
        create output <- duplicate(this);
        __gmpf_sqrt(output);
        return output;
    }

    .pow method<u32 exp> -> Bignum
    {
        create output <- Bignum();
        __gmpf_pow_ui(output, this, exp);
        return output;
    }
}

entry function<> -> u32
{
    create numA <- Bignum("386415896392e-9");
    create numB <- Bignum("123");

    /* FIX numA.add(numB).print(); wont work */
    create numC <- numA.div(numB);
    numA.print();
    numB.print();
    numC.print();
    return 0;
}