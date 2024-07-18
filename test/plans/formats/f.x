/*
Planned:

Two types of methods: "Excluded" and "Included"

Excluded
    * done how there were done in the first compiler.
    * Aren't actually part of the format, and cannot be called via reference
    * Not defined within format itself
    * Default

Included
    * Are part of the format and occupy a pointer



format Person {
    age u8;
    name p8;

    /* Included method */
    method greetA<p8 otherPerson> -> u32 
    {
        printf("Hello %s!, my name is %s and I am %i years old", otherPerson, self.name, self.age
    }
}

/* Exluded method */
Person method greetB<p8 otherPerson> -> u32 
{
    printf("Hello %s!, my name is %s and I am %i years old", otherPerson, self.name, self.age
}


entry function<> -> u32
{

}