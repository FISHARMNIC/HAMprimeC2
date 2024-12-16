/*
Using supports removes need for code redundancy. Without them, the code would look like this:

add function <u32 a, u32 b> -> u32
{
    return(a + b);
}

add function <f32 a, f32 b> -> f32
{
    return(a + b);
}

... then same for strings

This is more of a trivial example, but supportive overloads can be
more useful in other scenarios. See "overloads2.x"
*/


add function supports (
    <u32 a, u32 b>       -> u32,
    <f32 a, f32 b>       -> f32,
    <string a, string b> -> string
)
{
    return(a + b);
}

entry function<> -> u32
{
    print_(add(123,456));
    print_(add(1.23,4.56));
    print_(add("abc","def"));
}