Person format
{
    .name string;
    .age u32
    
    .toString method<>
    {
        return(`name: ${this.name}, age: ${this.age}`);
    }
}

entry function<>
{
    create people <- Person[1];
    people[0] <- Person<name:"Bob",  age: 124>;

    print_(people);

    return 0;
}