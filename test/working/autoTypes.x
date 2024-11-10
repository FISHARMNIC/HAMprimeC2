/*
Showcase for inherited typing
Rules
    - No auto parameters
    - Cannot pass uninitialized untyped variables to functions
    - Once on an untype variable has been initialized, if it assumes another type a warning will be thrown 
        - the variable will then be converted to that type
        - plans to maybe remove this warning for untyped variables

*/

Person format
{
    .name;
    .age;

    .Person constructor<string n, u32 age>
    {
        this.name <- n;
        this.age  <- age;
    }

    .toString method<> -> auto
    {
        return(`${this.name} is ${this.age} years old`);
    }
}

entry function<> -> auto
{
    create me <- Person("Nico", 18);
    print_(me);

    return 0;
}