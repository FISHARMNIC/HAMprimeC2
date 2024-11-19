doOperation function<u32 a, u32 b, any operation> -> auto
{
    return(call operation(a,b) -> u32);
}

entry function<> -> u32
{
    create someVar <- 123;

    print_(doOperation(4,5,
        lambda<u32 pa, u32 pb> -> auto {
            return(pa + pb + someVar);
        }
    ));
    return 0;
}