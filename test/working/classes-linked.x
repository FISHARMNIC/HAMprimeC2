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
        create node <- borrow this;
        while(node.next != 0)
        {
            node <- borrow node.next;
        }
        
        return node;
    }
    
    .find method<u32 index> -> Linked:borrowed
    {
        create node <- borrow this;
        create i <- 0;
        
        while(i <: index)
        {
            if(node.next == 0)
            {
                return null;
            }
            node <- borrow node.next;
            i <- i + 1;
        }
        return node;
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
            
            if(previous == 0) /* could not find */
            {
                print_(`Index ${index} does not exist!`);
                return 0;
            } 
            elif(previous.next == 0) /* Last item */
            {
                print_(`Index ${index} is out of range!`);
            }
            else
            {
                /*
                previous.next.next may be null if removing last item.
                
                When assigning null to a dynamic
                 - Ownership won't be completed
                 - If you want an error to be thrown instead, do:
                     "__rule segfaultOnNullOwnership true;"
                     NOTE I think that for now changing this rule doesnt actually do anything
                */ 
                previous.next <- previous.next.next;
            }
        }
    }
    
    .replace method<u32 index, u32 value> -> u32
    {
        create node <- this.find(index);
        node.current <- value;
    }
    
    .toString method<> -> string
    {
        create node <- borrow this;
        create build <- "[";
        while(node.next != 0)
        {
            //printf("::%p %i %s %p\n", node, node.current, build, node.next);
            build <- build + node.current + "->";
            //printf("---!!\n");
            node <- borrow node.next;
        }
        //printf("DONE:: %p %s %i\n", node, build, node.current);
        build <- build + node.current + "]";
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
