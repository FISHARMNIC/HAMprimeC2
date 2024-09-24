entry function<> -> u32
{
    create jon <- "bob";

    printf("%i\n", "bob" == jon);             // Equality
    printf("%i\n", "abc" <: "bac");           // Lexographical comparison
    printf("%i\n", p8:("bob") == p8:("bob")); // Pointer comparison
}