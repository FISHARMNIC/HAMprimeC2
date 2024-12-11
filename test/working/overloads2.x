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
    <any:array arr, any operation> -> none,
    <dyna:array arr, any operation> -> none
)
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> auto);
        i <- i + 1;
    }
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};
    create ages <- {1,2,3,4};

    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    map(ages, lambda<u32 value> {
        return (value * value);
    });

    __rc_collect__();

    print_(family);
    print_(ages);

    return 0;
}