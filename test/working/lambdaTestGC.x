Person format
{
    .name string;
    .age u32;

    .toString method<> -> auto
    {
        return(`name: ${this.name}, age: ${this.age}`);
    }
}

testLam function<any lam> -> none
{
    call lam();
}

entry function<> -> u32
{
    create bob <- {123,456};
    create Person:array jon;
    testLam(
        lambda<> -> auto {
            bob <- {456,789};
            jon <- Person[2];
            jon[0] <- Person<name:"Joe",age:123>;
            jon[1] <- Person<name:"Jim",age:456>;
    });

    /* to show that no gc issues */
    __rc_collect__();

    print_(bob);
    print_(jon);
}