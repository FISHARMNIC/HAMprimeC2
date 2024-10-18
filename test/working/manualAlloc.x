Person format
{
    .name string;
    .age u32;
    
    // todo #2, make return automatically guess if needs to do return_new
    .toString method<> -> string
    {
        // or do return_new all on one line
        create outStr <- "Name: " + this.name + " || Age: " + this.age;
        return outStr;
    }
}

entry function<> -> u32
{
    create size <- 5;
    
    create arr <- Person[size];

    arr[0] <- Person<name:"Nico",age:17>;
    arr[1] <- Person<name:"Nina",age:17>;
    arr[2] <- Person<name:"Mom",age:48>;
    arr[3] <- Person<name:"Dad",age:43>;
    arr[4] <- Person<name:"Dog",age:10>;
    

    forEach(item in arr)
    {
        print_(item);
    }
    
    return 0;
}