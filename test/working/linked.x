/*
Example linked list format. In my opinion, this is a good demo on how simple HAM can be
* Notice how seamless things like adding a new element, or removing one
* Compare it to something like C. No mallocs, frees, pointer confusion, etc.
*/

Linked format 
{
    .current u32;
    .next Linked;
    /* In theory, .next should be a Linked:dynamic.
       |> This is because each next element will be 
       |> dynamically alloated.
       * However, it is not needed since statics will
         attempt to automatically take ownership on 
         dynamics.
       * It also allows for there not needing to be
         "borrow" statements on lines like:
       |> reference <- reference.next
       * Since "reference" should just be looking at
         the data, not owning it.
    */
    
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
                return(Linked:(0));
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
        /* Note that here, newAddr is dynamic while "end.next" is not.
           However, if the destination is not dynamic, it doens't 
           matter. As long as the value is dynamic, the ownership
           will be transferred to the destination unless the keyword
           "borrow" was used.
        */
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
