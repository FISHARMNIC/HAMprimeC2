add function<u32 a, u32 b, u32 c>
{
    return(a + b + c);
}

entry function<>
{
    print_(`AAA ${add(1,2,3)} BBB`);
}