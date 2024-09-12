/*
Example for a Java ArrayList-like class
*/

List format {
    .buffer p32;
    .length u32;
    
    .List constructor<...>
    {
        this.buffer <- 0;
        this.length <- 0;
    }

    /*Not the most efficient way, but its meant to show that it can allocate and reallocate just fine*/
    .push method<any element> -> p32
    {
        this.length <- (this.length + 1);
        if(this.length == 1)
        {
            this.buffer <- malloc(4);
        }
        else 
        {
            this.buffer <- realloc(this.buffer, (this.length * 4));
        }
        this.buffer[this.length - 1] <- element;
        return(this.buffer);
    }

    .pop method<> -> any 
    {
        this.length <- (this.length - 1);
        create returnValue <- this.buffer[this.length];
        this.buffer <- realloc(this.buffer, (this.length * 4));
        return returnValue;
    }

    .every method<p32 iterator> -> u32 
    {
        create i <- 0;
        while(i <: this.length)
        {
            call iterator(this.buffer[i]);
            i <- (i + 1);
        }
    }
}

putint function<u32 i> 
{
    printf("Printing: %i\n", i);
}

entry function<> -> u32
{
    create myList <- List();

    myList.push(123);
    myList.push(456);
    printf("[%i,%i]\n", myList.buffer[0], myList.pop());
    myList.push(321);
    myList.every($putint);

    // myList <- 12;
    
    return 0;
}