Person format
{
    .name string;
    .age u32;
    
    .toString method<> -> string
    {
        return("Name: " + this.name + " || Age: " + this.age)
    }
}

entry function<> -> u32
{
    create size <- 5;
    create arr <- Person[size];

    arr[0] <- Person<name:"Nico",age:18>;
    arr[1] <- Person<name:"Nina",age:18>;
    arr[2] <- Person<name:"Mom",age:48>;
    arr[3] <- Person<name:"Dad",age:43>;
    arr[4] <- Person<name:"Dog",age:10>;

    forEach(item in arr)
    {
        print_(item);
    }
    
    return 0;
}