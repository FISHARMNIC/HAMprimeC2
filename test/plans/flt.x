create flt <- 123.456;

entry function<> -> u32
{
    create fltB <- 456.789;
    printf("%f\n", (flt + fltB + 5 + 789.123));
}