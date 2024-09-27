/*
Working now
*/

// custom print functions here
// printf just used as an example
putint function<u32 n> -> u32
{
    printf("%i", n);
}

putstr function<p8 s> -> u32
{
    printf("%s", s);
}

putcha function<u8 c> -> u32
{
    printf("%c", c);
}

hamPrintf function<conststr format, ...> -> u32
{
    create i <- 0;
    create argnum <- 1;
    while(format[i] != 0)
    {
        if(format[i] == '%')
        {
            create specifier <- format[i + 1];
            if(specifier == 's')
            {
                putstr(__arguments[argnum]);
            }
            elif(specifier == 'd')
            {
                putint(__arguments[argnum]);
            } else
            {
                //throw("Unknown specifier");
            }
            argnum <- (argnum + 1);
            i <- (i + 1);
        } 
        else 
        {
            putcha(format[i]);
        }
        i <- (i + 1);
    }
}

entry function<> -> u32
{
    hamPrintf("Hello %s: %d", "World", 123);
    return 0;
}