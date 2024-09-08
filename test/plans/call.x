// WORKS!


Person format
{
    .age u32;
    .name p8;

    .print method<> -> u32
    {
        printf("hi\n");
    }
}

entry function<> -> u32
{
    create bob <- Person<age:17,name:"bob">; 
    Person.call(bob, print);
    return 0;
}