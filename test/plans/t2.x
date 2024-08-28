Person format
{
    .name = p8;

    .Person constructor<> 
    {
        this.name <- "bob";
    }
}

entry function<> -> u32
{
    create bob <- Person();
    bob <- 123;

    return 0;
}