List format {
    __rule DynamicArraysAllocateSize false;

    .buffer p32;
    .length p32;
    
    .List constructor<...> {
        this.buffer <- 0;
        this.length <- 0;
    }

    .push method<any element> -> p32
    {
        this.length <- (this.length + 1);
        if(this.length == 1)
        {
            this.buffer <- __allocate__(4);
        }
        else 
        {
            this.buffer <- realloc(this.buffer, (this.length * 4));
        }
        this.buffer[this.length - 1] <- element;
        return this.buffer;
    }

    /*
    .pop method<> -> u32 {
        this.length <- (this.length - 1);
        create returnValue = this.buffer[this.length];
        this.buffer <- realloc(this.buffer, (this.length * 4));
        return returnValue;
    }
    */

    __rule DynamicArraysAllocateSize true;
}

entry function<> -> u32
{
    create myList <- List();
    myList.push(1);
    printf("%i\n", myList.buffer[0]);
    
    /* myList.push(2); */
}