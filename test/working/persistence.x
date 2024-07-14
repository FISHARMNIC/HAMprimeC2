/* 
    "Persistent" is a special keyword that will create local arrays on the global scope
*/

genArrs function<> -> p32
{
    create rarr <- persistent {1,2,3};
    return rarr;
}

entry function<> -> p32
{
    create result <- genArrs();
    printf("%i", result[1]);
    return 0;
}