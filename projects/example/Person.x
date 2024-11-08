Person format
{
    .name string;
    .age u32;

    .toString method<> -> string
    {
        return_new(`My name is ${this.name} and I am ${this.age} years old`);
    }
}

greet function<string name> -> u32
{
    print_("hello " + name);
}