/*
IMPORTANT / BROKEN




Next steps:
    - dont run collector all of the time. Make it be triggered after like 5 allocations
        - slows program down a lot
        - or maybe multi threaded??!!?!?!?
    - do thorough testing with EVERYTHING to make sure it all works
    - returns should take ownership
    - merge to main!!!
    
    DONE / FIXED
    - add defaultTransience and "persisent" and "transient"
    - Many programs (like class.x) are broken!
    - Constructors are broken!
        rc_collect discards __this__ before end of function
        DONT just remove the rc_collect from the end of the compiler (in case the compiler calls other functions which WILL call rc_collect
        Instead, give it a temporary owner like on a local variable
        rc_collect won't discard it, and after the return should be the assignation to an actual owner
        Fix this and the comment below about __rule.
    - Make sure that function do the same thing as Constructors
    - nested structs dont take ownership. See formats.x
*/

// __rule defaultTransience true;

Person format
{
    .age u32;
    .name p8;
}

entry function<> -> u32
{
    create bob <- {1,2,3};
    create nina <- Person<age:17,name:"Nina">;
    create i <- 0;
    while(i <: 100)
    {
        nina <- Person<age:17,name:"Nina">;
        i <- i + 1;
    }
    nina <- 123;
}