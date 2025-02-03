#include sys strings

forward time function<u32 t> -> u32;

create CGREEN  <- "\x1B[42m ";
create CYELLOW <- "\x1B[43m ";
create CGRAY   <- "\x1B[40m ";
create CRESET  <- " \x1B[0m";

printColor function<string color, char c>
{
    printf("%s", color + c + CRESET);
}
 
create string:array words;
create string answer;

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

    printf("║");
    //return(word == answer);
}

getInput function<> -> string
{
    create str <- char[6];
    scanf("%5s", str);
    /* todo: flush as seen here: https://stackoverflow.com/questions/28297306/how-to-limit-input-length-with-scanf */
    return(string:(str));
}

game function<>
{
    create tries <- 1;

    print_("\nWelcome to Wordle! You have 5 tries to guess the secret word\n");
    
    printf("Enter your starting word: ");
    
    create input <- getInput();

    print_("\n╔═══════════════╗");

    tryWord(input);
    
    while((input != answer) && (tries <: 5))
    {
        printf(" Guess: ");
        input <- getInput();
        tryWord(input);
        tries <- tries + 1;
    }

    print_("\n╚═══════════════╝\n\n");

    if(tries == 1)
    {
        print_("You got it in 1 try!");
    }
    elif(input != answer)
    {
        print_(`You couldn't get it. The word was: ${answer}`);
    }
    else
    {
        print_(`You got it in ${tries} tries!`);
    }
}

entry function<>
{

    words <- ({
        "apple",
        "brave",
        "cloud",
        "drink",
        "eagle",
        "flame",
        "grace",
        "heart",
        "jelly",
        "knife",
        "light",
        "magic",
        "noble",
        "ocean",
        "pride",
        "queen",
        "river",
        "stone",
        "truth",
        "voice",
        "water",
        "yield",
        "zebra",
    });

    srand(time(0)); 

    answer <- words[rand() % len(words)];

    game();
}
