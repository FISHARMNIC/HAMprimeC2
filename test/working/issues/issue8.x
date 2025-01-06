AAA format
{
    .data string;
}

entry function<>
{
    create jon <- AAA<data:"hello world">;
    print_(jon.data);
    jon <- 0;

    __asm__ "movw $0, ___TEMPORARY_OWNER___";
    //__rc_collect__();
    __rc_collect__();
    exit(0);
}