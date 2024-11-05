#include inc.xh

entry function<> -> u32
{
    create me <- Person<name:"Nico",age:18>;
    print_(me);
} 