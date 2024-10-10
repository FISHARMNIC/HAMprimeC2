Map format
{
    .allocatedSize u32;
    .occupiedSize u32;

    .keys conststr:array;
    .values u32:array;

    .Map constructor<> -> u32
    {
        this.allocatedSize <- 10;
        this.occupiedSize <- 0;

        this.keys <- conststr[10];
        this.values <- u32[10];
    }

    .Map operator(index_set)<conststr newKey, u32 newValue>
    {
        create occupiedSize <- this.occupiedSize;

        if(occupiedSize == this.allocatedSize)
        {
            this.allocatedSize <- this.allocatedSize * 2;

            this.keys <- copy(conststr[this.allocatedSize], this.keys);
            this.values <- copy(u32[this.allocatedSize], this.values);
        }

        this.keys[occupiedSize] <- newKey;
        this.values[occupiedSize] <- newValue;
        
        this.occupiedSize <- occupiedSize + 1;
    }

    .Map operator(index_get)<conststr index> -> any
    {
        create i <- 0;
        while(i <: this.occupiedSize)
        {
            //printf("checking %s\n", this.keys[i]);
            if(this.keys[i] == index)
            {
                return(this.values[i]);
            }
            i <- i + 1;
        }
    }

}

entry function<> -> u32
{
    create map <- Map();
    
    map["Nico" + "ABC"] <- 123;
    map["Dad"]  <- 456;
    map["Rio"]  <- 789;

    printf("%i %i %i\n", map["Rio"], map["Dad"], map["NicoABC"]);

    /*
    create i <- 0;
    while(i <: map.allocatedSize)
    {
        printf("%s:%i\n", map.keys[i], map.values[i]);
        i <- i + 1;
    }
    */
}