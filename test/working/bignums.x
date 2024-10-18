/*

CURRENTLY WIP
compile with ./assemble_gmp.sh

*/

Bignum format
{
    /* Internal mpf_t struct properties */
    .mpprec u32;
    .mpsize u32;
    .mpexp  u32;
    .mplimb p32;

    forward __gmpf_init         function<Bignum b> -> u32;
    forward __gmpf_init_set_str function<Bignum b, conststr n, u32 s> -> u32;
    forward __gmpf_clear        function<Bignum dest> -> u32;

    forward __gmp_printf        function<conststr f, ...> -> u32;

    forward __gmpf_set          function<Bignum dest, Bignum src> -> u32;
    forward __gmpf_set_si       function<Bignum dest, u32 src> -> u32;

    forward __gmpf_add          function<Bignum dest, Bignum oa, Bignum ob> -> u32;
    forward __gmpf_sub          function<Bignum dest, Bignum oa, Bignum ob> -> u32;
    forward __gmpf_mul          function<Bignum dest, Bignum oa, Bignum ob> -> u32;
    forward __gmpf_div          function<Bignum dest, Bignum oa, Bignum ob> -> u32;

    forward __gmpf_sqrt         function<Bignum dest> -> u32;
    forward __gmpf_pow_ui       function<Bignum dest, Bignum src, u32 src> -> u32;

    forward __gmpf_size         function<Bignum src> -> u32;
    forward __gmpf_get_str      function<string s, p32 ep, u32 base, u32 digs, Bignum src> -> string;
    
    .Bignum constructor<>
    {
        __gmpf_init(this);
    }

    .Bignum constructor<conststr numstr>
    {
        __gmpf_init_set_str(this, numstr, 10);
    }

    .destroy method<> -> u32
    {
        __gmpf_clear(this);
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

    .Bignum operator(add)<Bignum rhs> -> Bignum
    {
        return(this.add(rhs));
    }

    .Bignum operator(sub)<Bignum rhs> -> Bignum
    {
        return(this.sub(rhs));
    }

    .Bignum operator(mul)<Bignum rhs> -> Bignum
    {
        return(this.mul(rhs));
    }

    .Bignum operator(div)<Bignum rhs> -> Bignum
    {
        return(this.div(rhs));
    }

    .toString method<> -> string
    {
        create allocated <- string:(u8[16]);
        create expptr <- 0;

        __gmpf_get_str(allocated, $(expptr), 10, 14, this);

        create end <- substr(allocated,expptr, -1);
        if(strlen(end) == 0)
        {
            end <- "0";
        }
        
        create ssub <- substr(allocated,0,expptr) + "." + end;
        return(ssub);
    }
}

entry function<> -> u32
{
    create numA <- Bignum("386415896392e-9");
    create numB <- Bignum("123");

    create numC <- numA / numB;

    print_(numC);
    print_(numA);
    print_(numB);

    // when destructors are added this wont be needed
    numA.destroy();
    numB.destroy();
    numC.destroy();

    return 0;
}