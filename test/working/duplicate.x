entry function<> -> u32
{
    create arr <- {1,2,3};
    create bob <- duplicate(arr);
    bob[1] <- 4;

    print_(arr);
    print_(bob);
    
    return 0;
}