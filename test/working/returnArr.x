newArr function<> -> array
{
    create someArr <- {1,2,3};
    return someArr;
    // or you can do return_new({1,2,3});
}


entry function<> -> u32
{
    create bob <- newArr();
    printf("%i %i %i\n", bob[0], bob[1], bob[2]);
    return 0;
}