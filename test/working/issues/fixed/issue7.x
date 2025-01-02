create glob <- "hello";

entry function<>
{
    /* 2 issues:
        * glob doesn't take ownership
        * glob is created read by the compiler as a conststr, resulting in it being addressed when it shouldn't
    */
    print_(glob + " world " + glob);
}