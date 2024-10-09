/*
BROKEN! See comment below

*/

create final <- 10;

entry function<> -> u32
{
    create sum <- 0;

    create i <- 0;
    while(i <: final)
    {
        /* something with the line: "if(((i % 3) == 0) || ((i % 5) == 0))" doesnt work */
        if(((i % 3) == 0) || ((i % 5) == 0))
        {
            printf("Mulitple: " + i + "\n");
            sum <- sum + i;
        }
        i <- i + 1;
    }
    printf("hi %i\n", sum);
}