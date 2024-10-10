entry function<> -> u32
{
    create buff <- string[10];
    buff[0] <- "hi";
    buff[1] <- ("john" + "bob");
    print_(buff[0]);
    print_(buff[1]);
}