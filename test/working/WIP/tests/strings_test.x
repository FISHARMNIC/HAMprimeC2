forward __rc_allocate_str__ function<u32 sz> -> p32;

entry function<>
{
    create someStr <- "HELLO ";
    create something <- someStr + "ABC " + 123 + " BOB " + 123.456;
    print_(something);

    // __rc_allocate_str__(32);
}