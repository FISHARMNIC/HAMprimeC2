User format
{
    .name string;
    .ID u32;

    .toString method<> -> string
    {
        return(this.name + this.ID);
    }
}

entry function<> -> u32
{
    create me <- User<name:"Nico",ID:123>;

    create awesomePerson <- "Nina";
    create age <- 123.456;

    create out <- "Hello " + me + " and " + awesomePerson + "! I am " + age + " years old";

    printf("output: %s\n", out);

    return 0;
}