/*
Example for a Java ArrayList-like class
*/

List format {
    .buffer array;
    .length u32;
    
    .List constructor<...>
    {
        this.buffer <- 0;
        this.length <- 0;
    }

    /*Not the most efficient way, but its meant to show that it can allocate and reallocate just fine*/
    .push method<u32 element> -> array
    {
        this.length <- (this.length + 1);
        if(this.length == 1)
        {
            this.buffer <- u32[1];
        }
        else 
        {
            this.buffer <- copy(u32[this.length], this.buffer);
        }
        this.buffer[this.length - 1] <- element;
        return(this.buffer);
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