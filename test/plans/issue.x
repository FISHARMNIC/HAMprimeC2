/*
Testing a possible issue with garbage collector
See rollcall.c !!!IMPORTANT
*/

List format {
    .buffer array;
    .length u32;
    
    /* Constructor */
    .List constructor<>
    {
        this.buffer <- 0;
        this.length <- 0;
    }
    
    /* Constructor overloading */
    .List constructor<u32 size, ...>
    {
        this.buffer <- u32[size];
        this.length <- size;
        
        create i <- 0;
        while(i <: size)
        {
            this.buffer[i] <- __arguments[i + 1];
            i <- i + 1;
        }
    }

    /* Method */
    .push method<u32 element> -> u32
    {
        this.length <- (this.length + 1);
        create e <- 0;
        if(this.length == 1)
        {
            /*Not the most efficient way, but its meant to show that it can allocate and reallocate just fine*/
            this.buffer <- u32[1];
        }
        else 
        {
            e <- u32[this.length];
            this.buffer <- copy(e, this.buffer);
        }
        this.buffer[this.length - 1] <- element;
        printf("-----buff: %p %p\n", this.buffer, e);
        return(this.length);
    }

    .pop method<> -> u32 
    {
        this.length <- (this.length - 1);
        create retValue <- this.buffer[this.length];

        this.buffer <- copy(u32[this.length], this.buffer);
        return retValue;
    }

    .every method<any iterator> -> u32 
    {
        create i <- 0;
        while(i <: this.length)
        {
            call iterator(this.buffer[i]);
            i <- (i + 1);
        }
    }
    
    .toString method<> -> string
    {
        /* "[" is a static string so "" needs to be added */
        create build <- "[" + "";
        create i <- 0;
        while(i <: (this.length - 1))
        {
            build <- build + this.buffer[i] + ",";
            i <- i + 1;
        }
        build <- build + this.buffer[i] + "]";
        return build;
    }
}

putint function<u32 i> 
{
    printf("Printing: %i\n", i);
}

entry function<> -> u32
{
    printf("::Instance\n");
    create myList <- List();

    printf("::A\n");
    myList.push(123);
    printf("::B\n");
    myList.push(456);
    printf("::C\n");
    myList.push(321);
    
    //myList.every($putint);
    
    create secondList <- List(3, 1, 2, 3);
    //print_(secondList);
    //printf("\n%p %p\n", myList, myList.buffer);
    
    return 0;
}