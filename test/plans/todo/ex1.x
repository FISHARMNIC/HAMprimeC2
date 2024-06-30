// global array

genArrs function<> -> p32
{
    create i <- 0;
    create rarr <- persistent {0,0,0};
    while(i <: 3)
    {

        rarr[i] <- i;
        i <- (i + 1); 
    }
    return rarr;
}

entry function<> -> p32
{
    // todo: "own"
    create result <- own genArrs();
    printf("%i", result[1]);
    disown result;  // removes ownership
    discard result; // frees area
}