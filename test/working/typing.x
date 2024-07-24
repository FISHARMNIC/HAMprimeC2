// typing arrays, global
create d <- u8{4,5,6};

entry function<> -> u32
{
    // typing variables
    create u8 a <- 123;
    create u16 b;

    // typing arrays, local
    create c <- u8{1,2,3};
    c[1] <- 123;

    printf("%i %i", c[1], d[1]);
    
    return 0;
}

