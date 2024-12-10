/* if no return type is specified, functions default to "auto" */

/* dyna:array = any:dynamic:array means an array of any dynamic type
 * for example, an array of strings
 * or an array of formats

supportive map function
    <any:dynamic:array arr, any operation>
    <any:static:array arr, any operation>
{
...
}
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

map function supports (
    <any:dynamic:array arr, any operation> -> none,
    <any:static:array arr, any operation> -> none
)
{
...
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};
    create ages <- {1,2,3,4};

    /* issue is that the strings themselves are statics, so strict type checking will throw warn */
    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    map(ages, lambda<u32 value> {
        return (value * value);
    });

    print_(family);
    print_(ages);

    return 0;
}