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

*/


add function supports (
    <u32 a, u32 b> -> u32,
    <f32 a, f32 b> -> f32
)
{
    return(a + b);
}

entry function<> -> u32
{
    print_(add(123,456));
    print_(add(1.23,4.56));
}