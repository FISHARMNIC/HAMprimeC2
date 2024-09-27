Person format
{
    .age u32;
    .name string;

    .toString method<> -> string
    {
        return_new("Age: " + this.age + ", name: " + this.name);
    }
}

entry function<> -> u32
{
    create arr <- {1,2,3};

    print_(arr);
    print_({4,5,6});

    print_("hi");

    print_(123); // Current issue with IDE displayign garbage.
    print_(456.789);

    print_(Person<age:17,name:"Nico">);
    
    return 0;
}