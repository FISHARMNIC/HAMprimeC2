Linked format 
{
    .current u32;
    .next Linked;
    
    .Linked constructor<u32 value> -> u32
    {
        this.current <- value;
        this.next <- 0;
    }
    
    .findLast method<> -> Linked
    {
        create reference <- borrow this;
        while(reference.next != 0)
        {
            reference <- reference.next;
        }
        return reference;
    }
    
    .find method<u32 index> -> u32
    {
        create reference <- borrow this;
        create i <- 0;
        while(i <: index)
        {
            if(reference.next == 0)
            {
                return 0;
            }
            reference <- reference.next;
            i <- i + 1;
        }
        return(reference.current);
    }
    
    .add method<u32 value> -> u32
    {
        create end <- this.findLast();
        create newAddr <- Linked(value);
        end.next <- newAddr;
    }
}


entry function<> -> u32
{
    create myList <- Linked(1);
    myList.add(2);
    myList.add(3);
    
    printf("%i %i %i\n", myList.find(0), myList.find(1), myList.find(2));
    
    return 0;
}
