Person format {    
    .age u8;
    .name p8;
}

mf function<u32 a, u32 b, u32 c> -> u32
{
    return (a + b + b);
}

entry function<> -> u32
{
create arr <- {1,mf(1,2,3),Person<age:123,name:"bob">};
printf("%i", arr[1]);
}