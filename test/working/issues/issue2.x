Person format
{
    .name string;
    .age u32;

    .toString method<> -> auto
    {
        return(`name: ${this.name}, age: ${this.age}`);
    }
}

testLam function<fn lam> -> none
{
    lam();
}

entry function<> -> u32
{
    create bob <- {123,456};

    testLam(
        lambda<> -> auto {
            bob <- {456,789};
        }
    );

    print_(bob);
}