Person format
{
    .age u32;
    .name p8;
}

entry function<> -> u32
{
    create bob <- persistent {1,2,3};
    create nina <- persistent Person<age:17,name:"Nina">;
    nina <- 123;
}