newArr function<> -> array
{
    return({1,2,3});
}


entry function<> -> u32
{
    create bob <- newArr();
    printf("%i %i %i\n", bob[0], bob[1], bob[2]);
    return 0;
}