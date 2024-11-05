/*
modifystr function<string src, string:reference dest> -> none
{
    dest <- src;
    print_(dest);
}
*/

modifyint function<u32:reference num> -> none
{
    num <- 123;
}

modifych function<u8:reference num> -> none
{
    num <- u8:('B');
}

entry function<> -> u32
{
    //create mystr <- "123";
    //modifystr("bob", mystr);

    //create mynum <- 456;
    //modifyint(mynum);

    create mych <- u8:('A');
    modifych(mych);

    __rc_collect__();

    //print_(mystr);
    //print_(mynum);
    printf("%c\n", mych);
}