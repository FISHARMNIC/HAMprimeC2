/*
*** Supportive overloads ***

Supportive overloads allow for the same function definition to be used with multiple parameter types

In this example, where "arr[i]" is being set in the map function, the compiler needs to know whether
"arr" holds dynamic, or static types. This is due to how the garbage collector works. If you only had one
definition say, for static arrays "any:array", then the compiler would throw a warning when you tried
calling map with say, an array of strings. This is because strings are dynamic, and so a string array
is actually a "dyna:array". By using a supportive overload, you can avoid rewriting the function twice, as
to the programmer, the code is the same whether you are using an array of statics or dynamics. However,
as mentioned earlier, the compiler will treat the code different depending on whether you are using 
statics or dynamics. So to wrap it up, the "supports" keyword is more of a macro, that copies and pastes
a function several times, but with different parameter and return types

*/

map function supports (
    <any:array arr,  fn operation>,
    <dyna:array arr, fn operation>
)
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- operation(arr[i]);
        i <- i + 1;
    }
}

Person format
{
    .name string;
    .age u32
    
    .toString method<>
    {
        return(`name: ${this.name}, age: ${this.age}`);
    }
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};
    create ages   <- {1,2,3,4,5,6,7,8};
    
    create people <- Person[3];
    people[0] <- Person<name:"Bob",  age: 1>;
    people[1] <- Person<name:"Joe",  age: 2>;
    people[2] <- Person<name:"Phil", age: 3>;
    
    /* strings are dynamics */
    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    /* integers are statics */
    map(ages, lambda<u32 value> {
        return (value * value);
    });
    
    /* formats are dynamics */
    map(people, lambda<Person value> {
        /* keep in mind that "value" is a reference */
        /* you could use "duplicate" if you dont like that */
        value.age <- value.age + 1;
        value.name <- value.name + " Jackson";
        return value;
    })

    /*
    Just a test. This will result in seeing garbage data if ownership is not working correctly
    */
    __rc_collect__();

    print_(family);
    print_(ages);
    print_(people);

    return 0;
}