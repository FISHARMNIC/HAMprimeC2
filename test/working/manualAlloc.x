Person format
{
    .name string;
    .age u32;
    
    .toString method<> -> string:dynamic
    {
        return_new("Name: " + this.name + " || Age: " + this.age + "\n");
    }
}

entry function<> -> u32
{
    create size <- 5;
    create arr <- Person[size];

    arr[0] <- Person<name:"Nico",age:17>;
    arr[1] <- Person<name:"Nina",age:17>;
    arr[2] <- Person<name:"Mom",age:53>;
    arr[3] <- Person<name:"Dad",age:62>;
    arr[4] <- Person<name:"Rio",age:10>;
    
    create i <- 0;
    while(i <: size)
    {
        print_(arr[i]);
        i <- i + 1;
    }
    
    return 0;
}