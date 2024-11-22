/* if no return type is specified, functions default to "auto" */

/* dyna:array = any:dynamic:array means an array of any dynamic type
 * for example, an array of strings
 * or an array of formats
*/

map function<dyna:array arr, p32 operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> dyna);
        i <- i + 1;
    }
}

/*
map function<any:array arr, p32 operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> any);
        i <- i + 1;
    }
}
*/

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};
    create ages <- {1,2,3,4};

    /* issue is that the strings themselves are statics, so strict type checking will throw warn */
    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    /*
    map(ages, lambda<string value> {
        return (1);
    });
    */

    print_(family);

    return 0;
}