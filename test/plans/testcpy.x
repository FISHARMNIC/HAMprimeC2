entry function<> -> u32
{
    create bob <- "bob";
    printf("%p : %s\n", bob, bob);

    create jon <- copy(bob);
    printf("%p : %s\n", jon, jon);

}