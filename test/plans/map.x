Map #T(keys);

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
        }
        printf("creating %s with value %i at index %i\n", newKey, newValue, occupiedSize);
        
        this.keys[occupiedSize] <- newKey;
        /* this.values[occupiedSize] <- newValue; */
        
        this.occupiedSize <- occupiedSize + 1;
    }

    .Map operator(index_get)<string index> -> any
    {
        create i <- 0;
        while(i <: this.occupiedSize)
        {
            printf("checking %s\n", this.keys[i]);
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
    
    map["Nico"] <- 123;
    map["Dad"]  <- 456;
    map["Rio"]  <- 789;

    create i <- 0;
    while(i <: map.allocatedSize)
    {
        printf("%i:%i\n", map.keys[i], map.values[i]);
        i <- i + 1;
    }
    //printf("%i\n", map["Nico"]);
}