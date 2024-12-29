/* Pretty sure its fixed, issue was "sub" was taking ownership */

entry function<> -> u32
{
    create arr <- {{1,2,3},{4,5,6},{7,8,9}};
    
    forEach(sub in arr)
    {
        print_(sub);
    }

}