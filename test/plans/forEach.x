entry function<> -> u32
{
    create arr <- {1,2,3};

    // Two different ways
    // 1: lambdas
    // arr.forEach(lambda<u32 item> -> u32 {print_(item);})

    // 2: java-like
    // implement this first, much easier because have to implement lambdas eventually (ahhhh)
    forEach(item in arr)
    {
        print_(item)
    }

    // 3: for of (for each index)
    forEach(i of arr)
    {
        print_(arr[i]);
    }

}