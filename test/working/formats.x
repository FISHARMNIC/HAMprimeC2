Person format
{
    // create different properties
    .age u32;
    .name p8;
}

Student format
{
    .info Person;
    .id u32;
}

giveNewID function<Student stud, u32 new_id> -> u32
{
    stud.id <- new_id;
}

entry function<> -> u32
{
    create bob <- Student<id:123,info:Person<age:15,name:"bob">>;

    giveNewID(bob, 321);
    bob.info.age <- 16;

    // Nested properties
    printf("The student %s (id #%i) is %i years old\n", bob.info.name, bob.id, bob.info.age);

    /* this also works: create bob <- Person<age:(5+10),name:"bob">.name; */
    
    return 0;
}