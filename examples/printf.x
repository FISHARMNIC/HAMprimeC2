// things that current compiler is missing
// - arrays
// - put_stuff
// - throw
hamPrintf function<p8 format, ...> -> {
    create i <- 0;
    create argnum <- 1;
    while(format[i] != 0)
    {
        if(format[i] == '%')
        {
            create specifier <- format[i + 1];
            if(specifier == 's')
            {
                put_string(__arguments[argnum]);
            }
            elif(specifier == 'd')
            {
                put_integer(__arguments[argnum]);
            } elif(specifier == 'f')
            {
                put_float(__arguments[argnum]);
            } else
            {
                throw("Unknown specifier");
            }
            argnum = (argnum + 1);
        }
    }
    i = (i + 1);
}