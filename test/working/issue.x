Person format
{
    .name string;

    .add method<u32 age> -> Person
    {
        this.name <- this.name + age;
        return(this);
    }

    .print method<> -> u32
    {
        print_(this.name);
    }
}

entry function<> -> u32
{
    create me <- Person<name:"Nico">;
    me.add(123).print();
}