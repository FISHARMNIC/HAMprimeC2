/* 
    "Persistent" is a special keyword that will create force arrays to be on the global scope
    - "dispose" is to free it
    - You can also just use C "malloc" and "free" as long as you declare the prototypes

    By default, all dynamically allocated variables store an extra u32 before the array, which holds the size in bytes
    - use "__flag DynamicArraysAllocateSize false;" to disable that
    - use "__flag StaticArraysAllocateSize true;" to enable that for statically allocated arrays
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