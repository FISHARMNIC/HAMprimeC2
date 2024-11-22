/* Ony accepts any array type that holds dynamics */
map function<smart:dynamic:array arr, any operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> smart:dynamic);
        i <- i + 1;
    }
}


map function<smart:static:array arr, any operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> smart:static);
        i <- i + 1;
    }
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};
    create ages    <- {5, 10, 25, 12};

    /* calls first map function */
    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    /* calls second map function */
    map(family, lambda<u32 value> {
        return (`Is ${value}`);
    });

    forEach(person in family)
    {
        print_(person);
    }

    return 0;
}