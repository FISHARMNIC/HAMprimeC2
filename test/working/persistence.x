/* 
    "Persistent" is a special keyword that will create force arrays to be on the global scope
    "dispose" is to free it
    You can also just use C "malloc" and "free" as long as you declare the prototypes
*/

genArrs function<> -> p32
{
    create rarr <- persistent {1,2,3};
    return rarr;
}

entry function<> -> p32
{
    create result <- genArrs();
    printf("%i\n", result[1]);
    dispose(result);
    return 0;
}