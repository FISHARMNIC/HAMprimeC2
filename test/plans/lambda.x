doOperation function<u32 a, u32b, any operation> -> u32
{
    return(call u32 operation(a,b));
}

entry function<> -> u32
{
    printf("%i\n", doOperation(4,5,
        lambda<u32 pa, u32 pb> -> u32 {
            return (pa * pb + pa);
        }
    ));
    return 0;
}