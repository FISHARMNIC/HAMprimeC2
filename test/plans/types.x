List format<dataType>
{
    .buffer dyna:array;

    /* Doing this forces a cast on call at compile time  */
    .pop method<> -> dataType
    {
        /* code */
    }
}

entry function<>
{
    /* maybe change named parameters to use normal parenthesis? */
    create jon <- List<string>("apple","beef","cello");

    /* Compiler turns it into: print_(string:(jon.pop())); */
    print_(jon.pop());
}