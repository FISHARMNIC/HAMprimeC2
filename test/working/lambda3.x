/* if no return type is specified, functions default to "auto" */

map function<string:array arr, any operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> string);
        i <- i + 1;
    }
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};

    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    forEach(person in family)
    {
        print_(person);
    }

    return 0;
}