Person format
{
    .name string;
    .age u32;

    .toString method<>
    {
        return(`${this.name} is ${this.age} years old`);
    }
}

entry function<> -> u32
{
    create arr <- {1,2,3};
    create bob <- duplicate(arr);
    bob[1] <- 4;

    print_(arr);
    print_(bob);

    create jon <- Person<name:"Jon",age:123>;
    create mike <- duplicate(jon);
    mike.name <- "Mike";
    
    /*
    Note, "duplicate" is not a deep clone

    meaning that if mike.name was not changed, its .name property still belongs to jon

    there are plans to fix this later on or add it so that you can make your own duplicate function
    for formats similar to how toString works
    */

    print_(jon);
    print_(mike);

    
    return 0;
}