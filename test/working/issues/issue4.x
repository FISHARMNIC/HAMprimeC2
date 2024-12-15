// I THINK its fixed

entry function<> -> u32
{
    create arr <- {{1,2,3},{4,5,6},{7,8,9}};
    
    forEach(sub in arr)
    {
        print_(sub);
    }
    
}