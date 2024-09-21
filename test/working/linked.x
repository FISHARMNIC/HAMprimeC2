/*
Example linked list format. In my opinion, this is a good demo on how simple HAM can be
* Notice how seamless things like adding a new element, or removing one
* Compare it to something like C. No mallocs, frees, pointer confusion, etc.
*/

Linked format 
{
    .current u32;
    .next Linked;
    
    .Linked constructor<u32 value>
    {
        this.current <- value;
        this.next <- 0;
    }
    
    .findLast method<> -> Linked:borrowed
    {
        create reference <- borrow this;
        while(reference.next != 0)
        {
            reference <- borrow reference.next;
        }
        
        return reference;
    }
    
    .find method<u32 index> -> Linked:borrowed
    {
        create reference <- borrow this;
        create i <- 0;
        
        while(i <: index)
        {
            if(reference.next == 0)
            {
                /* Return null */
                return(Linked:borrowed:(0));
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
        create end <- borrow this.findLast();
        
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
            create previous <- this.find(index - 1);
            if(previous == 0) /* could not find */
            {
                print_("Index " + index + " does not exist!\n");
                return 0;
            } 
            elif(previous.next == 0) /* Last item */
            {
                previous.next <- 0;
            }
            else
            {
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
    }
    
    .replace method<u32 index, u32 value> -> u32
    {
        create reference <- this.find(index);
        reference.current <- value;
    }
    
    .toString method<> -> string
    {
        create reference <- borrow this;
        create build <- "[" + "";
        while(reference.next != 0)
        {
            // printf("::%p\n", reference);
            build <- build + reference.current + "->";
            reference <- borrow reference.next;
        }
        // printf("::%p\n", reference);
        build <- build + reference.current + "]";
        return build;
    }
}


entry function<> -> u32
{
    create myList <- Linked(1);
    // printf("-----ADDING-----\n");
    myList.add(2);
    myList.add(3);
    
    print_(myList);
 
    myList.remove(0);
    myList.add(5);
    myList.replace(2,4);
    
    print_(myList);

    return 0;
}
