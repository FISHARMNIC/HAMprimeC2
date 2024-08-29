/*
========================================
    This program is currently broken
========================================
*/

// custom print functions here
// printf just used as an example
put_integer function<u32 n> -> u32
{
    printf("%i", n);
}

put_string function<p8 s> -> u32
{
    printf("%s", s);
}

put_char function<u8 c> -> u32
{
    printf("%c", c);
}

hamPrintf function<p8 format, ...> -> u32
{
    create i <- 0;
    create argnum <- 1;
    while(format[i] != 0)
    {
        //printf("Checking %c\n", format[i]);
        if(format[i] == '%')
        {
            create specifier <- format[i + 1];
            //printf("yes: %c\n", specifier);
            if(specifier == 's')
            {
                put_string(__arguments[argnum]);
            }
            elif(specifier == 'd')
            {
                put_integer(__arguments[argnum]);
            } else
            {
                //throw("Unknown specifier");
            }
            argnum = (argnum + 1);
            i <- (i + 1);
        } else 
        {
            put_char(format[i]);
        }
        i <- (i + 1);
    }
}

entry function<> -> u32
{
    // something is wrong. No idea
    hamPrintf("Hello %s: %d", "World", 123);
    return 0;
}