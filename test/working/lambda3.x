/* if no return type is specified, functions default to "auto" */

/* dyna:array = any:dynamic:array means an array of any dynamic type
 * for example, an array of strings
 * or an array of formats
*/

map function<dyna:array arr, any operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> dyna);
        i <- i + 1;
    }
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};

    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    print_(family);

    return 0;
}