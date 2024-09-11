FMT format {
    .buffer p32;
    .length u32;
    
    .List constructor<...> 
    {
        this.buffer <- 0;
        this.length <- 0;
    }

    .bob method<u32 a> -> u32
    {
        this <- a;
    }

}

entry function<> -> u32
{
    create myList <- FMT();
    myList.bob(123);
}