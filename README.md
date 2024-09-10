# <img src="https://github.com/FISHARMNIC/proglan2/assets/73864341/9a5327b9-ffcc-425a-b927-ad829415715b" width="20px"> HAM' Language (New Compiler)
A new compiler for my 32-bit compiled programming language HAM\` (HAM prime). (UPDATE: now featuring floats!). Besides including numerous new features, this new compiler is much more optimized and has less bugs than the original.
# What sets HAM' apart from other languages?
HAM' is a fully compiled programming language that runs on Linux. When completed, it will provide a mixed experience that can be tailored to any programmer’s needs. HAM is an acronym for “Hard as You Make It”, and permits the programmer to pick and choose the complexity of their program in terms of how high-level they may want it to be. With the incorporation of pointers, it seeks to provide the control of C. Furthermore, it also comes with several built-in features like dynamically sized arrays and implicit typing.  


## Massive Update!
 - Automatic garbage collection is here! After some tweaks from my original design (which can be viewed [here](https://github.com/FISHARMNIC/RollCall/tree/main)), the garbage collection system is now fully working (and super fast!). All data is now allocated globally unless specified (see the documentation).
 - ftos and itos
    - convert floats and integers to strings
 - Multiple strings can now be added together using "+"
    - Any numbers will be automatically converted to strings like: ("bob " + 123) becomes "bob 123"
    - Any formats will automatically has their method "toString" called
 - Big IDE update! (See below)

# Documentation 
The documentation can be viewed [here](https://fisharmnic.github.io/docs)
# What is working so far?
All of the things below work. See examples [here](https://github.com/FISHARMNIC/HAMprimeC2/tree/main/test/working).
- Variables
	- Implicit and forced typing
    - Garbage collection
	- Stack and global scope
	- Pointers and addressing
	- External variables
	- Arrays and strings
    - Casting
- Formats
	- Nested formats
	- Creating instances
	- Property reading and setting
    - Methods and Constructors
- Functions
	- Variadic functions
	- Forward declarations
	- Seamless callee/caller C-functions
    - Calling from pointers/addresses
- Control flow
	- Nested If/elif/else statements
	- While loops
- I/O
	- Uses C printf and scanf
- Debugger
	- Traces back to faulty line in source file
- Graphics
	- Expose/mouse/keyboard events
	- Rendering simple shapes
- Strings
    - Easy concatenation
- Math
    - GMP for bignums
    - Built in floats
#### differences from the first compiler
* Much better optimization
* Stack allocation / variables
* Recursion
* Standard calling convention (cdecl)
* No more corner cases where certain things won't work
* Parenthesis math 
* Seamless C inclusion

# Features a new IDE
The updated IDE now shows you what each line compiles into assembly. Simply click on the line and the window on the right will jump to its portion of code. After compiling, you can click the bug icon to check if there are any segmentation issues, and the IDE will display both the problematic line and assembly instruction. The smart highlighting system will not working until after you have compiled a program, which can be done with either the checkmark button (just compile), or the arrow (compile and run).

<p align="center">
<img width="500" alt="ide_1" src="https://github.com/user-attachments/assets/ad9c5a09-92ae-46dd-967e-efdbef06e778">
<img width="500" alt="ide_2" src="https://github.com/user-attachments/assets/00797139-0ad3-4eea-a723-a849b0f94eef">
</p>
Note: This is still being worked on, and editing still has some issues. This was more of a side project that I will finish when I am done with the compiler.


# Interesting examples
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

**Formats as classes**
```C
/*
Example for a Java ArrayList-like class
*/
List format {
    .buffer p32;
    .length u32;
    
    .List constructor<...> {
        this.buffer <- 0;
        this.length <- 0;
    }

    .push method<any element> -> p32
    {
        this.length <- (this.length + 1);
        if(this.length == 1)
        {
            this.buffer <- malloc(4);
        }
        else 
        {
            this.buffer <- realloc(this.buffer, (this.length * 4));
        }
        this.buffer[this.length - 1] <- element;
        return this.buffer;
    }

    .pop method<> -> any {
        this.length <- (this.length - 1);
        create returnValue <- this.buffer[this.length];
        this.buffer <- realloc(this.buffer, (this.length * 4));
        return returnValue;
    }

    .every method<p32 iterator> -> u32 {
        create i <- 0;
        while(i <: this.length)
        {
            call iterator(this.buffer[i]);
            i <- (i + 1);
        }
    }
}

putint function<u32 i> {
    printf("Printing: %i\n", i);
}


entry function<> -> u32
{
    create myList <- List();
    myList.push(123);
    myList.push(456);
    printf("[%i,%i]\n", myList.buffer[0], myList.pop());
    myList.push(321);
    myList.every($putint);
    return 0;
}
```

**Strings**
```C
User format
{
    .name string;
    .ID u32;

    .toString method<> -> {
        return(this.name + this.ID);
    }
}

entry function<> -> u32
{
    create me <- User<name:"Nico",ID:123>;

    create awesomePerson <- "Nina";
    create age <- 123.456;

    create out <- ("Hello " + me + " and " + awesomePerson + "! I am " + age + " years old.");

    printf("output: %s\n", out);

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

**Graphics**
```C
/* Assemble with scripts/lima_x11.sh */

#include sys x11;

/* 
* __ccalled__ specifies that the function will be called from C 
    * By default, HAM` optimizes if registers should be saved before a function call
    * Without this, any registers that should be preserved by the callee might not be
*/
__ccalled__ render function<u32 event> -> u32
{
    gfx_clear();
    /* Draw a rectangle at the mouse */
    gfx_rect((gfx_mouse_x - 10),(gfx_mouse_y - 10),20,20);
}

entry function<> -> u32
{
    gfx_setup(500, 360);
    gfx_begin($render);
}
```

**Floats**

```C
factorial function<u32 n> -> u32
{
    if(n >= 1)
    {
        return (n * factorial(n - 1));
    }
    return 1;
}

entry function<> -> u32
{
    create sum_index <- 0;
    create sum_end <- 10;

    /* 
    Decimal number forces a float
    These also work:
        explicit type: create f32 sum <- 0;
        explicit cast: create sum <- f32:(0);
    */
    create sum <- 0.0; 

    while(sum_index <: sum_end)
    {
        sum <- (sum + (1.0 / (factorial(sum_index))));
        sum_index <- (sum_index + 1);
    }

    printf("%f", sum);
}
```

### How to run
* Dependencies
    * NodeJS
    * Needed if on MacOS
        * LimaVM
        * XQuartz (only if you are planning to use the graphics library)
* To compile a program
    * run `node compiler/main.js <file name in test/working directory>`
        * This creates an assembly file in `compiled/out.s`
* To run your program (normal)
    * MacOS
        * Enter `limactl`
        * Run `.compiler/scripts/assemble.sh`
    * Linux
        * Run `.compiler/scripts/assemble.sh`
* To run your program (with graphics)
    * Compile graphics library (one time only)
        * Run `./compiler/libs/gfx/compile.sh`
          * If on MacOS, add `limactl shell debian` before this on the same line
    * MacOS
        * Run `.compiler/scripts/lima_x11.sh`
    * Linux
        * Run `.compiler/scripts/internal/assemble_x11.sh`
