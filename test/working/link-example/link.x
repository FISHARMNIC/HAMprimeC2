Person format
{
    .name string;
    .age u32;

    .toString method<> -> auto
    {
        return(`My name is ${this.name} and I am ${this.age} years old`);
    }
}

greet function<string name> -> none
{
    print_("hello " + name);
}