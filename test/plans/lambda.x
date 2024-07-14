doOperation function<u32 a, u32b, func~p32 operation> -> u32
{
    return operation(a,b);
}

entry function<> -> u32
{
    printf("%i\n", doOperation(4,5,(
        lambda function<u32 pa, u32 pb> -> u32 
        {
            return (pa * pb + pa);
        }
    );
    return 0;
}