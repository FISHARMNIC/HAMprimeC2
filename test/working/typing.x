// typing arrays, global
create d <- u8{4,5,6};

entry function<> -> u32
{
    // typing variables
    create a <- u8:(123);
    create b <- u16:(0);

    // typing arrays, local
    create c <- u8{1,2,3};
    c[1] <- 123;

    printf("%i %i", c[1], d[1]);
    
    return 0;
}

