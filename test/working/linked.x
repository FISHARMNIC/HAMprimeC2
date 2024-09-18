/*
Example linked list format. In my opinion, this is a good demo on how simple HAM can be
* Notice how seamless things like adding a new element, or removing one
* Compare it to something like C. No mallocs, frees, pointer confusion, etc.
*/

Linked format 
{
    .current u32;
    /* Since next is allocated dynamically, we should show that */
    .next Linked:dynamic;
    
    .Linked constructor<u32 value>
    {
        this.current <- value;
        this.next <- 0;
    }
    
    .findLast method<> -> Linked
    {
        create reference <- borrow this;
        while(reference.next != 0)
        {
            reference <- borrow reference.next;
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
                /* Return null */
                return(Linked:(0));
            }
            reference <- borrow reference.next;
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
        
        /* This is where we dynamically allocate .next */
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
            // note, wont work for end of arr. Fix soon
            create previous <- this.find(index - 1);

            /*
            Here, you don't actually need the borrow or cast
            However, creating skipped takes ownership, and then
            previous.next takes that ownership right after. 
            Since there is no need for skipped to have ownership,
            the data can be borrowed then cast back into a dynamic
            
            If this is confusing, just ignore "borrow" and the 
            "Linked:dynamic:()" cast
            */
            create skipped <- borrow previous.next.next;
            previous.next <- Linked:dynamic:(skipped); 
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
