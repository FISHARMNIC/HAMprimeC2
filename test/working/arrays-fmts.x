Person format
{
    .name string;
    .age u32;

    .toString method<>
    {
        return(`name: ${this.name}, age: ${this.age}`);
    }
}

entry function<>
{
    create people <- ({
        Person<name:"abc", age: 1>,
        Person<name:"def", age: 2>,
        Person<name:"gih", age: 3>,
        Person<name:"jkl", age: 4>,
        Person<name:"mno", age: 5>,
        Person<name:"pqr", age: 6>,
        Person<name:"stu", age: 7>,
    });
    
    __rc_collect__(); // testing to make sure gc is working correct

    print_(people);
}