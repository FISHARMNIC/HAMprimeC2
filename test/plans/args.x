entry function<u32 argc, p8 argv> -> u32
{
    create i <- 0;
    while(i <: argc)
    {
        printf("%s", argv[i]);
        i <- i + 1;
    }
}