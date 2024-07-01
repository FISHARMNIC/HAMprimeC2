// broken somehow

test function<a,b> -> u8
{
    return (a + b * a);
}

entry function<>
{
    printf("%i\n", test(2,3));
    return 0;
}