# <img src="https://github.com/FISHARMNIC/proglan2/assets/73864341/9a5327b9-ffcc-425a-b927-ad829415715b" width="20px"> HAM' Language
# What sets HAM' apart from other languages?
HAM' (HAM prime) is a fully compiled programming language that runs on Linux. HAM is an acronym for “Hard as You Make It”, and permits the programmer to pick and choose the complexity of their program in terms of how high-level they may want it to be. With things such as pointers and optional typing, it seeks to provide a similar amount of control that C gives to the user. However, it also comes with more simplified features such as easy string/number concatenation, classes, and automatic allocation/deallocation.  

Detailed documentation can be viewed [here](https://fisharmnic.github.io/docs)

## Massive Update!
- Math is now evaluated in the proper order!
    - Currenty, this is only for integer math
    - Adding this for floats very soon
- old big update stuff:
    - Automatic garbage collection is here! After some tweaks from my [original design](https://github.com/FISHARMNIC/RollCall/tree/main) the garbage collection system is now fully working (and rather fast)! All data is now allocated globally unless specified (see the documentation).
    - ftos and itos
        - convert floats and integers to strings
    - Multiple strings can now be added together using "+"
        - Any numbers will be automatically converted to strings like: ("bob " + 123) becomes "bob 123"
        - Any formats will automatically has their method "toString" called
    - Big IDE update! (See below)
    - Fixed segfault with GFX lib

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
    - Comparison: ==, !=, <:, :>, <=, >=, ||, &&
	- While loops
- I/O
	- Uses C printf and scanf
	- WIP easy `print_` function
- Debugger
	- Traces back to faulty line in source file
	- Works best on IDE (see below)
- Graphics
	- Expose/mouse/keyboard events
	- Rendering simple shapes
- Strings
    - Easy concatenation
    - Automatic conversion from formats and numbers
    - Easy comparison using normal comparison signs
- Math
    - GMP for bignums
    - Built in floats

Currently working on / not implemented yet:
- Operator overloading (currently implemented, but math engine wont do it, see below)
- Rewriting the math engine (which is from my old language and its pretty bad)
    - this will fix:
        - operators not being called
        - Order of operations
- private properties
- easier built-in array features (push,pop,forEach,etc.)
- Lamdba functions
- inline assembly

#### differences from the first compiler
* Much better optimization
* Stack allocation / variables
* Recursion
* Standard calling convention (cdecl)
* No more corner cases where certain things won't work
* Parenthesis math 
* Seamless C inclusion
* Automatic memory management
* And much, much more!

# Features a new IDE
The updated IDE now shows you what each line compiles into assembly. Simply click on the line and the window on the right will jump to its portion of code. After compiling, you can click the bug icon to check if there are any segmentation issues, and the IDE will display both the problematic line and assembly instruction. The smart highlighting system will not working until after you have compiled a program, which can be done with either the checkmark button (just compile), or the arrow (compile and run).

<p align="center">
<img width="500" alt="ide_1" src="https://github.com/user-attachments/assets/ad9c5a09-92ae-46dd-967e-efdbef06e778">
<img width="500" alt="ide_2" src="https://github.com/user-attachments/assets/00797139-0ad3-4eea-a723-a849b0f94eef">
</p>
Note: This is still being worked on, and editing still has some issues. This was more of a side project that I will finish when I am done with the compiler.


# Interesting examples
* [Class](#Formats-as-classes)
* [Strings](#Strings)
* [Variadics](#Variadics)
* [C Inclusion](#C-Inclusion)
* [Graphics](#Graphics)
* [Floats](#Floats)

### Formats as classes
```C
/*
Example linked list format. In my opinion, this is a good demo on how simple HAM can be
* Notice how seamless things like adding a new element, or removing one
* Compare it to something like C. No mallocs, frees, pointer confusion, etc.
*/

Linked format 
{
    .current u32;
    .next Linked;
    
    .Linked constructor<u32 value>
    {
        this.current <- value;
        this.next <- 0;
    }
    
    .findLast method<> -> Linked:borrowed
    {
        create reference <- borrow this;
        while(reference.next != 0)
        {
            reference <- borrow reference.next;
        }
        
        return reference;
    }
    
    .find method<u32 index> -> Linked:borrowed
    {
        create reference <- borrow this;
        create i <- 0;
        
        while(i <: index)
        {
            if(reference.next == 0)
            {
                return null;
            }
            reference <- borrow reference.next;
            i <- i + 1;
        }
        return reference;
    }
    
    .index method<u32 index> -> u32
    {
        create ref <- this.find(index);
        return(ref.current);
    }
    
    .add method<u32 value> -> u32
    {
        create end <- borrow this.findLast();
        
        create newAddr <- Linked(value);
        end.next <- newAddr;
    }
    
    .remove method<u32 index> -> u32
    {
        if(index <: 1)
        {
            this <- this.next;
        }
        else
        {
            create previous <- this.find(index - 1);
            
            if(previous == 0) /* could not find */
            {
                print_("Index " + index + " does not exist!\n");
                return 0;
            } 
            elif(previous.next == 0) /* Last item */
            {
                print_("Index " + index + " out of range!\n");
            }
            else
            {
                previous.next <- previous.next.next;
            }
        }
    }
    
    .replace method<u32 index, u32 value> -> u32
    {
        create reference <- this.find(index);
        reference.current <- value;
    }
    
    .toString method<> -> string
    {
        create reference <- borrow this;
        create build <- "[";
        while(reference.next != 0)
        {
            build <- build + reference.current + "->";
            reference <- borrow reference.next;
        }
        build <- build + reference.current + "]";
        return build;
    }
}

entry function<> -> u32
{
    create myList <- Linked(1);
    
    myList.add(2);
    myList.add(3);
    
    print_(myList);
 
    myList.remove(0);
    myList.add(5);
    myList.replace(2,4);
    
    print_(myList);
    
    myList.remove(1);
    myList.add(8);
    myList.add(16);
    myList.add(32);
    myList.remove(4);
    
    print_(myList);
    
    printf("There should be an error below this...\n---> ");
    myList.remove(10);
   
    return 0;
}
```

### Strings
```C
User format
{
    .name string;
    .age u32;

    .toString method<> -> string
    {
        create out <- this.name + " (age " + this.age + ")";
        return out;
    }
}

entry function<> -> u32
{
    create me <- User<name:"Nico",age:18>;

    create awesomePerson <- "Nina";
    create age <- 123.456;

    print_("Hello " + me + " and " + awesomePerson + "! I am " + age + " years old");

    if(me.name == "Nico")
    {
        print_("Hey! My name is also Nico!");
    }

    return 0;
}
```

### Variadics
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

### C inclusion
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

### Graphics
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

### Floats

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
## Dependencies
* NodeJS
* If on MacOS
    * LimaVM
    * XQuartz (only if you are planning to use the graphics library)
* gcc multilib (`sudo apt-get install gcc-multilib`)
* gmp (needed if using bignums) (`sudo apt-get install libgmp3-dev`)
* 32bit x11 (needed if using graphics)
    * `dpkg --add-architecture i386; sudo apt-get update; sudo apt-get install libx11-dev:i386`
* *Note: if on mac, these should be installed in Lima. otherwise just install these normally*

## Installing
* Clone [this](https://github.com/FISHARMNIC/HAMprimeC2/tree/main) repository

## Compiling
* Cd into `compiler`
* Run `node main.js <file name in test/working directory>`
    * For example: `node main.js arrays.x`
    * This creates an assembly file in `compiled/out.s`

## Running (no graphics)
* MacOS
    * Enter Lima shell
    * If running for first time, run `./scripts/BUILD.sh`
    * Run `./scripts/assemble.sh`
* Linux
    * If running for first time, run `./scripts/BUILD.sh`
    * Run `./scripts/assemble.sh`

## Running (with graphics)

* Compile graphics library (one time only)
    * Run `./libs/gfx/compile.sh`
    * If on MacOS, make suret do this in the Lima shell
* MacOS
    * Run `./scripts/lima_x11.sh`
* Linux
    * Run `.compiler/scripts/internal/assemble_x11.sh`