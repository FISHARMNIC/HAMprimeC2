/* 
    This is still WIP, and many features do not work yet / are untested
    TODOS:
    Check for:
        - @(number)
        - @(array with dynamic children)
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

    /*
    Neither of these work properly:
        create jon <- "jon";
        @(jon) <- 'b'; 
        @(jon + 1) <- 'b';
    print_(jon);
    */

    return 0;
}