/* 
    Program that showcases loops and prints the first 3 squares
*/

/* This function doesn't do anything, it's just here to show that loops can have function calls in their conditional statement */
getNum function<u32 n> -> u32
{
    return(n);
}

entry function<p8 args, u32 argv> -> u32
{
    create x <- 1;
    create y <- 9;
    while(x <= getNum(10))
    {
        printf("%i\n", (x * x));
        x <- (x + 1);
    }
    
    return 0;
}