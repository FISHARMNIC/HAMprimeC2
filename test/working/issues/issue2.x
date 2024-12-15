Person format
{
    .name string;
    .age u32
}

// just generates invalid assembly, fix this
entry function<> -> u32
{
    create people <- ({
        Person<name:"abc", age: 1>,
        Person<name:"def", age: 2>,
        Person<name:"gih", age: 3>
    });
}