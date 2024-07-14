test function<> -> u32
{
    return(123);
}

create gi <- 1;
create garr <- {1,2,3};

entry function<> -> u32
{
    create li <- 2;
    create larr <- {1,2,3};

    larr[li] <- test();
    garr[gi] <- 456;
    printf("%i %i\n", larr[li], garr[gi]);
}