Person format
{
    .age u32;
    .name p8;

    .changeAge method<u32 a> -> u32
    {
        this.age <- a;
        __rc_collect__();
    }

    .dupefn method<> -> Person
    {
        create duped <- duplicate(this);
        __rc_collect__();
        duped.changeAge(20);
        return duped;
    }
}

entry function<> -> u32
{
    create bob <- Person<age:15,name:"bob">;
    create jon <- bob.dupefn();

    jon.name <- "jon";
    
    printf("%s %i\n", bob.name, bob.age);
    printf("%s %i\n", jon.name, jon.age);

    __rc_collect__();
    return 0;
}