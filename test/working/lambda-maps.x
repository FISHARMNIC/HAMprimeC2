/* if no return type is specified, functions default to "auto" */

/* dyna:array = any:dynamic:array means an array of any dynamic type
 * for example, an array of strings
 * or an array of formats
*/

// FOR  A BETTER VERSION OF THIS, SEE functions-supports2.x

map function<dyna:array arr, fn operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- operation(arr[i]);
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

    /* just GC test */
    __rc_collect__();

    print_(family);

    return 0;
}