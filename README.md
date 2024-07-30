# <img src="https://github.com/FISHARMNIC/proglan2/assets/73864341/9a5327b9-ffcc-425a-b927-ad829415715b" width="20px"> HAM\` Language (New Compiler)
A new compiler for the 32-bit compiled programming language HAM\` (HAM prime). So far, it lacks some features that existed in the [original HAM prime compiler](https://github.com/FISHARMNIC/HAMprime/tree/main) (mainly floats and methods). However, besides including numerous new features, this new compiler is much more optimized and has less bugs than the original.
# What sets HAM\` apart from other languages?
HAM\` is a fully compiled programming language that runs on Linux. When completed, it will provide a mixed experience that can be tailored to any programmer’s needs. HAM is an acronym for “Hard as You Make It”, and permits the programmer to pick and choose the complexity of their program in terms of how high-level they may want it to be. With the incorporation of pointers, it seeks to provide the control of C. Furthermore, it also comes with several built-in features like dynamically sized arrays (missing from this compiler) and implicit typing.
# What is working so far?
With the exception of floating point arithmetic (which *does* work in the first compiler), this compiler currently allows for math expressions, iteration, conditionals, functions, formats, allocation, and more. See examples [here](https://github.com/FISHARMNIC/HAMprimeC2/tree/main/test/working).
- Variables
	- Stack and global scope
	- Implicit and forced typing
	- Pointers an addressing
	- External variables
	- Arrays and strings
- Formats
	- Nested formats
	- Creating instances
	- Property reading (setting coming very soon)
- Functions
	- Variadic functions
	- Forward declarations
	- Seamless callee/caller C-functions
- Control flow
	- Nested If/elif/else statements (UPDATE: recent push broke elif)
	- While loops
* I/O
	* Uses C printf and scanf
- Debugger
	- Traces back to faulty line in source file
- Graphics
	- Expose/mouse/keyboard events
	- Rendering simple shapes
- Math (no floats yet)
#### differences from the first compiler
* Much better optimization
* Stack allocation / variables
* Recursion
* Standard calling convention (cdecl)
* No more corner cases where certain things won't work
* Parenthesis math 
* Seamless C inclusion
# Features a new IDE
<img width="500" alt="IDE" src="https://github.com/FISHARMNIC/HAMprimeC2/assets/73864341/4434942e-023f-4092-8913-dfc529c500a7">


### Interesting examples
**Basic demo**
```C

// functions
getNum function<u32 n> -> u32
{
    return(n);
}

entry function<p8 args, u32 argv> -> u32
{
    // Stack variables
    create x <- 0;
    create y <- 9;

    // Looping
    while(x <: getNum(3))
    {
        // C printf
        printf("%i\n", (x * x));
        x <- (x + 1);
    }
    
    return 0;
}
```

**Variadics**
```C
myVariadic function<u32 numberOfArgs, ...> -> u32
{
    create i <- 1;
    while(i <= numberOfArgs)
    {
        printf("Argument %i: %s\n", i, __arguments[i]);
        i <- (i + 1);
    }
}

entry function<> -> u32
{
    myVariadic(2, "hi", "bye");
    return 0;
}
```

**Formats**
```C
Person format
{
    .age u32;
    .name p8;
}

Student format
{
    .info Person;
    .id u32;
}

entry function<> -> u32
{
    create bob <- Student<id:123,info:Person<age:15,name:"bob">>;
    printf("The student %s (id #%i) is %i years old\n", bob.info.name, bob.id, bob.info.age);
}
```

**C inclusion**
```C
// make sure to assemble with -lpthread
forward pthread_create function<u32 a, u32 b, u32 c, u32 d>;
forward pthread_exit function<u32 a>;
forward sleep function<u32 a>;
forward write function<u32 a, p8 b, u32 c>;

thread function<> -> u32
{
    create i <- 0;
    while(i <: 10)
    {
        write(1, "hello from child\n", 17);
        sleep(1);
        i <- (i + 1);
    }
    return 0;
}

entry function<> -> u32
{
    create tid <- 0;
    pthread_create($tid, 0, thread, 0);
    
    create i <- 0;
    while(i <: 10)
    {
        write(1, "hello from main\n", 16);
        sleep(1);
        i <- (i + 1);
    }

    pthread_exit(0);
    return 0;
}
```
