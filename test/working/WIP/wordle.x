#include sys strings

create CGREEN  <- "\x1B[42m ";
create CYELLOW <- "\x1B[43m ";
create CGRAY   <- "\x1B[40m ";
create CRESET  <- " \x1B[0m";

printColor function<string color, char c>
{
    printf("%s", color + c + CRESET);
}
 
create answer <- "canoe";

tryWord function<string word>
{
    printf("║");
    create i <- 0;
    while(i <: 5)
    {
        create letter <- word[i];
        if(strincludes(answer, letter))
        {
            if(letter == answer[i])
            {
                printColor(CGREEN, letter);
            }
            else
            {
                printColor(CYELLOW, letter);
            }
        }
        else
        {
            printColor(CGRAY, letter);
        }
        i <- i + 1;
    }

    print_("║");

    //return(word == answer);
}
entry function<>
{
    print_("\nWelcome to Wordle!\n\n╔═══════════════╗");
    tryWord("hello");
    tryWord("adore");
    tryWord("canes");
    tryWord("canoe");
    tryWord("-----");
    print_("╚═══════════════╝");
}
