recurse function<u8 num, u32 numb> -> u32
{
    printf("%i %i\n", num, numb);
}

entry function<p8 args, u32 argv> -> u32
{
    recurse(123, 111);
    create x <- 0;
    while(x <: 10)
    {
        x <- (x + 1);
    }
}