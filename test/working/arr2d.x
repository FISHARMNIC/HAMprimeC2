entry function<> -> u32
{
    create arr <- {{1,2,3},{4,5,6},{7,8,9}};
    
    arr[2] <- {3,2,1};

    arr[0][2] <- 7;
    arr[1][1] <- 7;
    arr[2][0] <- 7;

    forEach(sub in arr)
    {
        print_(sub);
    }
}