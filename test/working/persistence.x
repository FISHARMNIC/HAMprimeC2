// global arrays

genArrs function<> -> p32
{
    create rarr <- persistent {1,2,3};
    return rarr;
}

entry function<> -> p32
{
    create result <- genArrs();
    printf("%i", result[1]);
    
    return 0;
}


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