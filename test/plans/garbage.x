/*
IMPORTANT
    Many programs (like class.x) are broken!
    Fix this and the comment below about __rule.

Next steps:
    - instead make one called "transient", which forces data to be local instead
    - do thorough testing with EVERYTHING to make sure it all works
    - returns should take ownership
    - merge to main!!!
    
    DONE
    - add defaultTransience and "persisent" and "transient"
*/

/* breaks compiler: __rule defaultTransience true; */

Person format
{
    .age u32;
    .name p8;
}

entry function<> -> u32
{
    create bob <- {1,2,3};
    create nina <- Person<age:17,name:"Nina">;
    nina <- 123;
}