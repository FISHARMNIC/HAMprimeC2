/*
Unit test example

Capturing stdout and comments, credit to "tedtanner" on stackoverflow (https://stackoverflow.com/questions/11214498/capture-stdout-to-a-string-and-output-it-back-to-stdout-in-c)
*/

#include sys cpipes;

testOutput function<string testName, any fn, string expected> -> u32
{
    print_(`[ RUN      ] : ${testName} `);

    /* Flush stdout first if you've previously printed something */
    fflush(stdout);

    /* Save stdout so it can be restored later */
    create tmpout <- dup(fileno(stdout));
    
    /* Redirect stdout to a new pipe */
    create pipes <- u32[2];
    pipe(pipes);
    dup2(pipes[1], fileno(stdout));
    
    /* This part is captured, and make sure to terminate with 0 */
    call fn();
    printf("%c", 0);
    
    /* Restore stdout */
    fflush(stdout);
    close(pipes[1]);
    dup2(tmpout, fileno(stdout));
    
    /* Read the captured output */
    create char c <- 1; 
    create ostr <- "";
    while (c != 0)
    {
        read(pipes[0], $(c), 1);
        ostr <- ostr + c;
    }

    if(ostr == expected)
    {
        print_(`[     PASS ] : ${testName}`);
        return 0;
    }
    else
    {
        print_(`[  FAILED  ] : ${testName}`);
        print_(`------------\n*** Expected:\n\t ${expected} \n*** But got:\n\t ${ostr}\n------------\n`);
        return 1;
    }
}

entry function<> -> u32
{
    testOutput("first", 
        lambda<> {
            print_("hello");
        }, 
        "hello\n"
    );

    testOutput("second",
        lambda<> {
            print_("apples");
        },
        "bananas\n"
    );
    
}