entry function<> -> u32
{
    /* below, maybe issue that compiler thinks that indexing string arr returns char?? */
    create buff <- string[10];
    buff[0] <- "hi";
    buff[1] <- ("john" + "bob");
    print_(buff[0]);
    print_(buff[1]);

    /* TODO add autocast here form conststr to str */
    create str <- buff[1];
    str <- "hi";
    /* Also, before fixing that, why is this throwing 1byte < 4byte warn */
    /* Uh oh, somewhere something is modifying the .pointer to false on the original type */
    str <- buff[1];
}