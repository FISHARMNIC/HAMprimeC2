#include sys staticList

entry function<>
{
    /* 
    todo, implement something that autocasts pops to float 
    like in java where you can pass a type to an arraylist
    */
    create list <- StaticList();

    list.push(123.123);
    list.push(456.456);
    list.push(789.789);

    list.delete(1);

    print_(f32:(list.pop()));
    print_(f32:(list[0]));

}