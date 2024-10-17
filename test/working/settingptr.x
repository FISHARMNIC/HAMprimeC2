/* 
    TODOS:
    Check for:
        - @(number)
        - @(some dynamic address)
        - @(string literal)
        - @(string variable)
        - @(conststr variable (do those even exist still? I forgot, maybe global?)

*/

entry function<> -> u32
{
    create arr <- {1,2,3};
    create i <- 0;

    @(arr) <- 5;
    @(arr + 4) <- 6;
    @(arr + 8) <- 7;

    while(i <: 3)
    {
        printf("%i\n", @(arr + (i * 4)));
        i <- i + 1;
    }
    return 0;
}