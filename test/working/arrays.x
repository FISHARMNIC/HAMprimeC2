/*
======== Array setting demonstration ========
This example showcases loading and reading to/from arrays
*/

create gi <- 1;
create garr <- {1,2,3};


/* The following functions don't really do anything. They're only there to show that you can use functions in indexing  */
test function<> -> u32
{
    return(123);
}

getgi function<u32 a, u32 b> -> u32
{
    return (gi + a - b);
}

entry function<> -> u32
{
    create li <- 2;
    create larr <- {1,2,3};

    larr[li] <- test();
    gi <- (gi + 1);
    garr[getgi(3,4)] <- 456;
    garr[2] <- (garr[getgi(0,1)] + 333);
    gi <- (gi - 1);
    printf("%i %i %i\n", larr[li], garr[gi], garr[2]);
}