// function showing different ways to make things global
thing function<> -> u32
{

    // impemented
    create myArrA <- persistent {1,2,3};
    create myArrB <- {4,5,6};
    // todo: copies array to global scope
    return(globalize myArrB);
}