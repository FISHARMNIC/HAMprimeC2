User format
{
    .name string;
    .age u32;

    .toString method<> -> string
    {
        create out <- this.name + " (age " + this.age + ")";
        return out;
    }
}

entry function<> -> u32
{
    create me <- User<name:"Nico",age:18>;

    create awesomePerson <- "Nina";
    create age <- 123.456;

    print_("Hello " + me + " and " + awesomePerson + "! I am " + age + " years old");
    
    /* HAM also supports string interpolation */
    /* NOTE BIG ISSUE RIGHT NOW: 
        CANT DO ${age + 1} for some reason
        Maybe issue with float adder?
        Maybe issue with GC? (doubt it, just results in float 0.0000000
    */

    print_(`Hello ${me} and ${awesomePerson}! And in I year I will ${age + 1} years old`);

    if(me.name == "Nico")
    {
        print_("Hey! My name is also Nico!");
    }

    return 0;
}