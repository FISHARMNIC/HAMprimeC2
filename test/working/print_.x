Person format
{
    .age u32;
    .name string;

    .toString method<> -> string
    {
        return("Age: " + this.age + ", name: " + this.name);
    }
}

entry function<> -> u32
{
    create arr <- {1,2,3};

    print_(arr);
    print_({4,5,6});

    print_("hi");

    print_(123); // Current issue with IDE displaying garbage.
    print_(456.789);

    print_(Person<age:17,name:"Nico">);

    create fmtArr <- Person[2];
    fmtArr[0] <- Person<name:"Joe",age:123>;
    fmtArr[1] <- Person<name:"Jim",age:456>;
    
    print_(fmtArr);
    
    return 0;
}