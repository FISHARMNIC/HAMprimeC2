Map format
{
    .allocatedSize u32;
    .occupiedSize u32;

    .keys string:array;
    .values array;

    .Map constructor<> -> u32
    {
        this.occupiedSize <- 0;
        this.keys <- string[10];
    }

    .Map operator(index_set)<string newKey, u32 newValue>
    {
        /* issue is: reading 8(%ebp) as newKey, but it's supposed to be 12(%ebp) */
        print_(newKey);
        //this.keys[this.occupiedSize] <- newKey;
    }
}

entry function<> -> u32
{
    create map <- Map();
    map["Dad"]  <- 456;

    return 0;
}