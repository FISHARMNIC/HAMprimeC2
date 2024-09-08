entry function<> -> u32
{
    create nameA <- "Nico";
    create nameB <- "Nina";
    create age <- 123.456;

    create out <- ("Hello " + nameA + " and " + nameB + "! I am " + age + " years old.");

    printf("output: %s\n", out);
    return 0;
}