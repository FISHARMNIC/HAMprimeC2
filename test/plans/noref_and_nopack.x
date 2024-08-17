Person format
{
    .age u32;
    .name p8;
}

// "clone" passes by value instead
change function<clone Person p, u32 new_id> -> u32
{
    p.age <- 123;
}

entry function<> -> u32
{
    create bob <- Person<age:15,name:"bob">;
    

    change(bob);

    return 0;
}