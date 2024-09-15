/*
Example linked list format. In my opinion, this is a good demo on how simple HAM can be
* Notice how seamless things like adding a new element, or removing one
* Compare it to something like C. No mallocs, frees, pointer confusion, etc.
*/

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
    
    .find method<u32 index> -> Linked
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
        return reference;
    }
    
    .index method<u32 index> -> u32
    {
        create ref <- this.find(index);
        return(ref.current);
    }
    
    .add method<u32 value> -> u32
    {
        create end <- this.findLast();
        
        create newAddr <- Linked(value);
        end.next <- newAddr;
    }
    
    .remove method<u32 index> -> u32
    {
        if(index <: 1)
        {
            this <- this.next;
        }
        else
        {
            create previous <- this.find(index - 1);

            create skipped <- previous.next.next;
            previous.next <- skipped; 
        }
    }
    
    .replace method<u32 index, u32 value> -> u32
    {
        create reference <- this.find(index);
        reference.current <- value;
    }
}


entry function<> -> u32
{
    create myList <- Linked(1);
    myList.add(2);
    myList.add(3);
    
    printf("%i %i %i\n", myList.index(0), myList.index(1), myList.index(2));

    myList.remove(0);
    myList.add(5);
    myList.replace(2,4);
    
    printf("%i %i %i\n", myList.index(0), myList.index(1), myList.index(2));
    
    return 0;
}
