myVariadic function<u32 numberOfArgs, ...> -> u32
{
    create i <- 0;
    while(i < numberOfArgs)
    {
        printf("Argument %i: %i\n", numberOfArgs, __arguments[i]);
        i <- (i + 1);
    }
}

entry function<> -> u32
{

}