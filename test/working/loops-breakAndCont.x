entry function<> -> u32
{

    print_("while loops: ");

    create count <- 0;
    while(count <: 15)
    {
        count <- count + 1;

        if((count % 2) == 0)
        {
            continue;
        }
        elif(count == 13)
        {
            break;
        }
        else
        {
            print_(count);
        }
    }

    print_("forEach loops:");
    create arr <- {1,2,3,4,5,6};
    forEach(item in arr)
    {
        if(item == 5)
        {
            break;
        }
        elif(item == 3)
        {
            continue;
        }
        else
        {
            print_(item);
        }
    }
}