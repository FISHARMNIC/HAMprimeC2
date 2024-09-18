Person format
{
    .name string;
    .age u32;
    
    // dev note: in future have something similar to type "array" where string by default is dyanmic
    // need to be careful for static strings though
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
    arr[2] <- Person<name:"Mom",age:48>;
    arr[3] <- Person<name:"Dad",age:43>;
    arr[4] <- Person<name:"Dog",age:10>;
    
    create i <- 0;
    while(i <: size)
    {
        print_(arr[i]);
        i <- i + 1;
    }
    
    return 0;
}