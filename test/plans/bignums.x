enable bignums;

create zflt bigNum_a <- 123456789.987654321;
create zflt bigNum_b <- 123456789.987654321;

entry function<> -> u32
{
    print_zflt(bigNum_a * bigNum_b);
    return 0;
}