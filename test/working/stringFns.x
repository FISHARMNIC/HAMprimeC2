#include sys strings

entry function<> -> u32
{
    create word <- "abcdefg";
    
    print_(substr(word, 2, 5));
    print_(strpush(word, 'h'));
    print_(strpop(word));
}