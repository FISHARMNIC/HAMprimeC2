Person format
{
    .name;
    .age;

    .Person constructor<string n, u32 age> -> u32
    {
        this.name <- n;
        this.age <-  age;
    }

    .toString method<> -> string
    {
        return_new(`${this.name} is ${this.age} years old`);
    }
}

entry function<> -> u32
{
    create me <- Person("Nico", 18);
    print_(me);

}