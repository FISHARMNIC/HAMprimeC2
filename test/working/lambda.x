doOperation function<u32 a, u32 b, any operation> -> auto
{
    return(call operation(a,b) -> string);
}

entry function<> -> u32
{
    print_(doOperation(4,5,
        lambda<u32 pa, u32 pb> -> auto {
            create c <- 1;
            while(c <= pa)
            {
                print_(`pb * ${c} = ${pb * c}`);
                c <- c + 1;
            }
            return `Lambda called with ${pa} and ${pb}`;
        }
    ));
    return 0;
}