#include sys bignums

create zflt bigNum_a <- 123456789.987654321;
create zflt bigNum_b <- 123456789.987654321;

entry function<> -> u32
{

    bigNum_a <- (bigNum_a * bigNum_b);
    zflt_print(bigNum_a);
    
    /* 
    this wont work since answers have to be stored somewhere
    print_zflt(bigNum_a * bigNum_b);
    */
    return 0;
}