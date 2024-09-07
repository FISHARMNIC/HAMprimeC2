entry function<> -> u32
{
    create nameA <- "Nico";
    create nameB <- "Nina";

    create out <- ("Hello " + nameA + " and " + nameB + "!");

    printf("output: %s\n", out);
    return 0;
}