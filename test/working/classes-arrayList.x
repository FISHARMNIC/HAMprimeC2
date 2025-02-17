/*
Example for a Java ArrayList-like class
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
        if(this.length == 1)
        {
            /*Not the most efficient way, but its meant to show that it can allocate and reallocate just fine*/
            this.buffer <- u32[1];
        }
        else 
        {
            //print_("copying");
            this.buffer <- copy(u32[this.length], this.buffer);
        }
        //print_("b");
        this.buffer[this.length - 1] <- element;
        return(this.length);
    }

    .pop method<> -> u32 
    {
        this.length <- (this.length - 1);
        create retValue <- this.buffer[this.length];

        this.buffer <- copy(u32[this.length], this.buffer);
        return retValue;
    }

    .every method<fn iterator> -> u32 
    {
        create i <- 0;
        while(i <: this.length)
        {
            iterator(this.buffer[i], i);
            i <- (i + 1);
        }
    }
    
    .toString method<> -> string
    {
        create build <- "[";
        create i <- 0;
        while(i <: (this.length - 1))
        {
            build <- build + this.buffer[i] + ",";
            i <- i + 1;
        }
        build <- build + this.buffer[i] + "]";
        return build;
    }

    .List operator(add)<u32 rhs> -> List
    {
        /* Todo, operator support for float math too */

        create dupe <- duplicate(this);
        dupe.push(rhs);
        return dupe;
    }
}

entry function<> -> u32
{
    create myList <- List();

    myList.push(123);
    myList.push(456);
    printf("[%i,%i]\n", myList.buffer[0], myList.pop());
    myList.push(321);
    myList.every(lambda<u32 i, u32 n> {
        // "n" is optional
        printf("At [%i] is %i\n", n, i);
    });
    
    create secondList <- List(3, 1, 2, 3);
    //print_(secondList);

    create thirdList <- (secondList + 4 + 5);
    print_(thirdList);
    
    //printf("\n%p %p\n", myList, myList.buffer);
    
    return 0;
}