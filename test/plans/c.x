// C code
@begin c

int my_C_function(int a, char* b)
{
    printf("testing c function %i %s\n", a,b);
    return 123;
}

@end

// Declare prototype for the function declared in C
forward my_C_function function<u32 a, p8 b>;

entry function<p8 args, u32 argv> -> u32
{
    my_C_function(456, "Hello C!");
    return 0;
}