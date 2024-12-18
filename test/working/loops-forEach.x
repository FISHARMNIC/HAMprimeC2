entry function<> -> u32
{
    create arr <- {1,2,3};
    forEach(item in arr)
    {
        print_(item);
    }

    /* below does NOT work yet. Only 32bit element types */
    /*
    create strarr <- "hello";
    forEach(e in strarr)
    {
        print_(e);
    }
    */
}