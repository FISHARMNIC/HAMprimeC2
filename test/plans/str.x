entry function<> -> u32
{
    create str <- string:("hello");
    // also add default itoa/ftoa for adding numbers to strings

    str <- (str + string:(" jon ") + string:("and bob"));

    printf("output: %s\n", str);
    return 0;
}