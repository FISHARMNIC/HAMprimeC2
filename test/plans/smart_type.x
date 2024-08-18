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
        return this.buffer;
    }

    .print method<> -> u32
    {
        create i <- 0;
        printf("[");
        while(i <: this.length)
        {
            printf("%i,", this.buffer[i]);
            i <- i + 1;
        }
        printf("]\n");
    }   
}

/*
 * "smart" type means it not only passes the value but also a second 4 byte value (before the argument) that contains info about the type of the Argument
 * It can only be used as a parameter
 * It passes:
    * bit 1-2: number of bytes
    * bit 3: if is a pointer
    * bit 4: if is a float
    * bit 5: if is a format 
*/
print function<smart input> -> u32
{
    if(smPointer input)
    {
        printf("%p", input);
    }
    else if(smFloat input)
    {
        printf("%f", f32:(input));
    }
    else if(smBytes input == 1)
    {
        printf("%c", input);
    }
    else
    {
        printf("%i", input);
    }
}

entry function<> -> u32
{
    create myList <- List();
    myList.push(123);
    myList.push(456);
    // make this under a class like Java System.out
    print(myList);
}