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
                return null;
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
                print_("Index " + index + " out of range!\n");
            }
            else
            {
                /*
                previous.next.next may be null if removing last item.
                
                When assigning null to a dynamic
                 - Ownership won't be completed
                 - If you want an error to be thrown instead, do:
                     "__rule segfaultOnNullOwnership true;"
                */ 
                previous.next <- previous.next.next;
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
        create build <- "[";
        while(reference.next != 0)
        {
            //printf("::%p %i %s %p\n", reference, reference.current, build, reference.next);
            build <- build + reference.current + "->";
            //printf("---!!\n");
            reference <- borrow reference.next;
        }
        //printf("DONE:: %p %s %i\n", reference, build, reference.current);
        build <- build + reference.current + "]";
        //printf("::FINISHED::\n");
        return build;
    }
}

entry function<> -> u32
{
    create myList <- Linked(1);
    
    myList.add(2);
    myList.add(3);
    
    print_(myList);
 
    myList.remove(0);
    myList.add(5);
    myList.replace(2,4);
    
    print_(myList);
    
    myList.remove(1);
    myList.add(8);
    myList.add(16);
    myList.add(32);
    myList.remove(4);
    
    print_(myList);
    
    printf("There should be an error below this...\n---> ");
    myList.remove(10);
   
    return 0;
}
