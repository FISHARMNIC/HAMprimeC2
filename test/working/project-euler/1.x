create final <- 1000;

entry function<> -> u32
{
    create sum <- 0;

    create i <- 0;
    while(i <: final)
    {
        if(((i % 3) == 0) || ((i % 5) == 0))
        {
            sum <- sum + i;
        }
        i <- i + 1;
    }
    printf("result: %i\n", sum);

    return 0;
}