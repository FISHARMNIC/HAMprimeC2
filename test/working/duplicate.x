entry function<> -> u32
{
    create arr <- {1,2,3};
    create bob <- duplicate(arr);
    bob[1] <- 4;

    printf("%i %i \n", bob[1], arr[1]);
    
    return 0;
}