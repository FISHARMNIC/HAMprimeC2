Person format
{
    .name string;
    .age u32;

    .toString method<>
    {
        return(`name: ${this.name}, age: ${this.age}`);
    }
}

// segfalts
entry function<>
{
    create people <- ({
        Person<name:"abc", age: 1>,
        Person<name:"def", age: 2>,
        Person<name:"gih", age: 3>
    });

    print_(people);
}