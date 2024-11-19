map function<string:array arr, u32 size, any operation> -> none
{
    create i <- 0;

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> string);
        i <- i + 1;
    }
}

entry function<> -> u32
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};

    map(family, 4, lambda<string value> -> string {
        return (`I love my ${value}`);
    });

    forEach(person in family)
    {
        print_(person);
    }
}