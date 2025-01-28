#include sys strings

// ignore the warnings. Chars are still broken.

entry function<> -> u32
{
    create word <- "abcdefg";
    
    print_(substr(word, 2, 5));
    print_(strpush(word, 'h'));
    print_(strpop(word));

    print_(strsplitchr("nico,jon,bob", ','));

    print_(strinsert("Hello World!", "to this amazing ", 6));

    print_(strjoin("abc","123"));

    print_(strsplit("rio"));
}