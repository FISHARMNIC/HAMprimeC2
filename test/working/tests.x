/*
Unit test example

Capturing stdout and comments taken from https://stackoverflow.com/questions/11214498/capture-stdout-to-a-string-and-output-it-back-to-stdout-in-c
*/

import p32 stdout;

forward fflush function<p32 f> -> none;
forward fileno function<p32 f> -> u32;
forward dup    function<u32 fno> -> u32;
forward dup2   function<u32 a, u32 b> -> u32;
forward pipe   function<u32:array f> -> u32;
forward write  function<u32 p, conststr s, u32 i> -> u32;
forward read   function<u32 fno, p32 b, u32 nb> -> u32;
forward close  function<u32 fno> -> u32;

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
        "bannanas\n"
    );
    
}