entry function<> -> u32
{
    create a <- 1;
    create b <- 2;

    create max <- 4000000;
    create sum <- 0;

    while(a <: max)
    {
        if((a % 2) == 0)
        {
            sum <- sum + a;
        }
        if((b % 2) == 0)
        {
            sum <- sum + b;
        }

        a <- a + b;
        b <- a + b;
    }

    printf("result: %i\n", sum);
}