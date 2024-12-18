Person format
{
    privates;

    .ssn u32;

    publics;

    .name string;
    .age u32;

    .Person constructor<string name, u32 age>
    {
        this.name <- name;
        this.age  <- age;
        
        this.ssn  <- rand() % 100;
    }
    
    .getSSN method<> -> u32
    {
        return(this.ssn);
    }
}

entry function<> -> u32
{
    create person <- Person("Nico",18);

    print_(person.name + " is " + person.age + " years old.");
    print_(person.name + " ssn is " + person.getSSN());
    /* This will cause a compiler error */
    /*
    print_(person.ssn);
    */
    
    return 0;
}