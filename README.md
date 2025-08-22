# <img src="https://github.com/FISHARMNIC/proglan2/assets/73864341/9a5327b9-ffcc-425a-b927-ad829415715b" width="20px"> HAM' Language
# About Ham
HAM' (HAM prime) is a fully compiled 32-bit programming language. HAM is an acronym for “Hard as You Make It”, and permits the programmer to pick and choose the complexity of their program in terms of how high-level they may want it to be. With things such as pointers and optional typing, it seeks to provide a similar amount of control that C gives to the user. However, it also comes with more simplified features such as easy string/number concatenation, classes, and automatic memory management.  
<br>

## Addendum
I have decided to stop working on this project. I built this in highschool as more of an exercise to see how hard it would be to compile a high level language directly to x86 assembly (which HAM' does) without using LLVM nor C as middlemen. It is more of a toy language, and is not built with memory safety in mind and lacks any type enforcement.

---

<details>
<summary><b>Recent Update Log</b></summary>

## Recent Update Log
- Added method overloads!
- Added bitwise and (&), or (|), xor (^) and shift operations << and >>
- Improved garbage collector model!
    - Much more incremental
    - Destroys lost references quicker by checking for data that was owned by things on old stack scopes
    - Works by "chunking" the roster into smaller pieces that are split by function scopes
    - Seems to be a lot faster in some things, a bit slower in others
- Added some builting libraries which can now be used with `#include`
    - See examples under `libs-xxx`
    - New libraries are:
        - linked lists
        - queues
        - flexible arrays (like cpp vectors)
- Lambdas and certain types not longer need to be called using the `call` keyword
    - Only works for params/variables of type: `any` and the a new type: `fn`
- Added new type
- Added function overloads! 
    - And added supportive overloads for functions only currently
    - see `test/working/functions-supports.x` or `test/working/functions-support2.x` for an explanation
- Added `break` and `continue` for loops
- Added new type `dyna` which is the same as `any:dynamic`
- Array length can be get with `len(arr)`
- `something function<> -> auto {...}` is no longer needed.
    * Now you can just do `something function<> {...}`
    * Works for lambdas, methods, and operators too
- `print_` now supports arrays of formats (see `test/working/uses-print_.x`)
- **Big Update**
    * Added lambdas! see `test/working/lambda-simple.x`
    * Must be passed as type `any`
    * Must be called using `call` keyword
- Added `JS_EVAL "any javascript code to be run at compile time"` (for debug)
- Added `__asm__ "any assembly code"`
- Reworked `call` keyword. Now `call some_function(params) -> some_type`
- Statements can now be broken up into multiple lines
    - Like: 
    ```
    myFunction(
        123,
        456
    )
    ```
- Removed `return_new`!
    - Compiler now automatically handles returning un-owned data
- Improved untyped variables
- Format properties can now be untyped
    - assume type of first value that they get assigned
- Added linking multiple files
    - see `test/working/link-example/howto.txt`
- Added reference type annexing
    - Similar to c++ pass by reference
    - see `test/working/classes-fileIO.x` shr overloads
- Added multiple overloads per operator per class
    - Ex. now the same class can have 2 overloads for "+", one accepts a string and one accepts an int
- Added string interpolation! See strings example below or `test/working/strings-interpolation.x`
- Added `forEach` (See `test/working/loops-forEach.x`. Basic support, more coming soon) 
- Added writing into memory address specified by pointer (still WIP, many cases don't work)
- Operator overloads addded!
    - Currently only support the four main math functions (+-/*), shifting, and array set/get
    - See [math overload example](#Class-Example-2) or [array overload example](#Operator-Overloads) below
- Math is now evaluated in the proper order! (now for floats too)
- old big update stuff:
    - Automatic garbage collection is here! After some tweaks from my [original design](https://github.com/FISHARMNIC/RollCall/tree/main) the garbage collection system is now fully working (and rather fast)! All data is now allocated globally unless specified (see the documentation).
    - ftos and itos
        - convert floats and integers to strings
    - Multiple strings can now be added together using "+"
        - Any numbers will be automatically converted to strings like: ("bob " + 123) becomes "bob 123"
        - Any formats will automatically have their method "toString" called
    - Big IDE update! (See below)
    - Fixed segfault with GFX lib

</details>

<details>
<summary><b>Whats new/works so far?</b></summary>

# What is working so far?
All of the things below work. Scroll down for examples or click [here](https://github.com/FISHARMNIC/HAMprimeC2/tree/main/test/working).
**Detailed documentation can be viewed [here](https://fisharmnic.github.io/docs)**

- Variables
	- Implicit and forced typing
    - Garbage collection
        - note: the GC is currently set to trigger rather often as a form of debugging possible issues. this can be changed by modifying `BYTES_PER_GC` in `compiler/libs/garbage/rollcall.h`
	- Stack and global scope
	- Pointers and addressing
	- External variables
	- Arrays, strings, formats, floats, etc.
    - Casting
- Formats
	- Nested formats
	- Creating instances
	- Property reading and setting
    - Methods
    - Constructors
    - Operator overloading
    - Privates and publics
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
	- C printf and scanf
	- Easy `print_` function
        - Automatically prints arrays, formats, floats, ints, strings
        - *Currently doesn't work for format arrays*
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
    - Floats and ints 
    - Support for GMP (look at `bignums` in `test/working`)
- Lambdas
    - Capture scoped variables by reference (very much WIP, may be buggy!)

Currently working on / roadmap / issues:
- **Global arrays are broken**
    - if you wish to use a global array, create a typed variable on a global scope, and allocate data for it in a function
- Supportive overloads for methods, constructors, etc
- Lambda capturing parameters
- Char literals being treated as ints leading to a mess of casting if you use char type
- Nested arrays have a lot of issues, it's sort of a big mess that I have to fix soon
- cant use operator "+" with string parameter (tries calling `.toString` instead)
- easier built-in array features (push,pop,forEach,etc.)
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
* And much more!

# Features a new IDE
The updated IDE now shows you what each line compiles into assembly. Simply click on the line and the window on the right will jump to its portion of code. After compiling, you can click the bug icon to check if there are any segmentation issues, and the IDE will display both the problematic line and assembly instruction. The highlighting system will not work until after you have compiled a program, which can be done with either the checkmark button (just compile), or the arrow (compile and run).

<p align="center">
<img width="500" alt="ide_1" src="https://github.com/user-attachments/assets/ad9c5a09-92ae-46dd-967e-efdbef06e778">
<img width="500" alt="ide_2" src="https://github.com/user-attachments/assets/00797139-0ad3-4eea-a723-a849b0f94eef">
</p>  

Note: This is still being worked on, and editing still has some issues. This was more of a side project that I will finish when I am done with the compiler. Unfortunately the assembly tracing and line highlighting are somewhat broken for the moment due to changes that have to do with how lines are counted. Hopefully I will fix this soon. Currently it they only work correctly in simple files like `floats.x`

</details>

<details>
<summary><b>How to install?</b></summary>

Open `install.md` for information

</details>

<details>
<summary><b>Documentation</b></summary>

[documentation](https://fisharmnic.github.io/docs)

Please note that it may be outdated, as I have not been focusing on the documentation recently
</details>

# Examples
* [Supportive Overloads](#Supportive-Overloads)
* [Class](#Formats-as-classes)
* [Class(2)](#Class-Example-2)
* [Type Inference](#Type-inference-example)
* [Overloads](#Operator-Overloads)
* [Overloads(2)](#More-Overloads)
* [Lambdas](#Lambda-Captures)
* [Strings](#Strings)
* [Variadics](#Variadics)
* [C Inclusion](#C-Inclusion)
* [Graphics](#Graphics)
* [Floats](#Floats)

(excuse the poor highlighting)

### Supportive Overloads
```Dart
/* See "test/working/functions-supports2.x" for an explanation on why this is needed */
map function supports (
    <any:array arr, fn operation> -> none,
    <dyna:array arr, fn operation> -> none
)
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- operation(arr[i]);
        i <- i + 1;
    }
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};
    create ages <- {1,2,3,4};

    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    map(ages, lambda<u32 value> {
        return (value * value);
    });

    print_(family);
    print_(ages);

    return 0;
}
```

### Formats as classes
```Dart
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
        create node <- borrow this;
        while(node.next != 0)
        {
            node <- borrow node.next;
        }
        
        return node;
    }
    
    .find method<u32 index> -> Linked:borrowed
    {
        create node <- borrow this;
        create i <- 0;
        
        while(i <: index)
        {
            if(node.next == 0)
            {
                return null;
            }
            node <- borrow node.next;
            i <- i + 1;
        }
        return node;
    }
    
    .index method<u32 index> -> u32
    {
        create ref <- this.find(index);
        return(ref.current);
    }
    
    .add method<u32 value> -> u32
    {
        create end <- this.findLast();
        
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
                print_(`Index ${index} does not exist!`);
                return 0;
            } 
            elif(previous.next == 0) /* Last item */
            {
                print_(`Index ${index} is out of range!`);
            }
            else
            {
                previous.next <- previous.next.next;
            }
        }
    }
    
    .replace method<u32 index, u32 value> -> u32
    {
        create node <- this.find(index);
        node.current <- value;
    }
    
    .toString method<> -> string
    {
        create node <- borrow this;
        create build <- "[";
        while(node.next != 0)
        {
            build <- build + node.current + "->";
            node <- borrow node.next;
        }

        build <- build + node.current + "]";
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

### Type inference example
```dart
/*
Showcase for inherited typing
Rules
    - No auto parameters
    - Cannot pass uninitialized untyped variables to functions
    - Once on an untype variable has been initialized, if it assumes another type a warning will be thrown 
        - the variable will then be converted to that type
        - plans to maybe remove this warning for untyped variables
*/

Person format
{
    .name;
    .age;

    .Person constructor<string n, u32 age>
    {
        this.name <- n;
        this.age  <- age;
    }

    /* Same as saying ".toString method<> -> auto" */
    .toString method<>
    {
        return(`${this.name} is ${this.age} years old`);
    }
}

entry function<>
{
    create me <- Person("Nico", 18);
    print_(me);

    return 0;
}
```

### Class Example 2
```Dart
/*
Example for something similar to Java ArrayList/C++ vector class
*/

List format {
    .buffer array;
    .length u32;
    
    /* Constructor */
    .List constructor<>
    {
        this.buffer <- 0;
        this.length <- 0;
    }
    
    /* Constructor overloading */
    .List constructor<u32 size, ...>
    {
        this.buffer <- u32[size];
        this.length <- size;
        
        create i <- 0;
        while(i <: size)
        {
            this.buffer[i] <- __arguments[i + 1];
            i <- i + 1;
        }
    }

    /* Method */
    .push method<u32 element> -> u32
    {
        this.length <- (this.length + 1);
        if(this.length == 1)
        {
            /*Not the most efficient way, but its meant to show that it can allocate and reallocate just fine*/
            this.buffer <- u32[1];
        }
        else 
        {
            this.buffer <- copy(u32[this.length], this.buffer);
        }
        this.buffer[this.length - 1] <- element;
        return(this.length);
    }

    .pop method<> -> u32 
    {
        this.length <- (this.length - 1);
        create retValue <- this.buffer[this.length];

        this.buffer <- copy(u32[this.length], this.buffer);
        return retValue;
    }

    .every method<fn iterator> -> u32 
    {
        create i <- 0;
        while(i <: this.length)
        {
            iterator(this.buffer[i]);
            i <- (i + 1);
        }
    }
    
    .toString method<> -> string
    {
        create build <- "[";
        create i <- 0;
        while(i <: (this.length - 1))
        {
            build <- build + this.buffer[i] + ",";
            i <- i + 1;
        }
        build <- build + this.buffer[i] + "]";
        return build;
    }

    .List operator(add)<u32 rhs> -> List
    {
        create dupe <- duplicate(this);
        dupe.push(rhs);
        return dupe;
    }
}

putint function<u32 i> 
{
    printf("Printing: %i\n", i);
}

entry function<> -> u32
{
    /* instancing */
    create myList <- List();

    /* calling methods */
    myList.push(123);
    myList.push(456);
    printf("[%i,%i]\n", myList.buffer[0], myList.pop());
    myList.push(321);
    myList.every($putint);
    
    /* constructor overloading */
    create secondList <- List(3, 1, 2, 3);

    /* operator overloading, see ".List operator(add)" */
    create thirdList <- (secondList + 4 + 5);
    print_(thirdList);
    
    return 0;
}
```

### Operator Overloads
```Dart
MapEntry format
{
    .key string;
    .value u32;
    
    .next MapEntry;

    .MapEntry constructor<string k, u32 v>
    {
        this.key <- k;
        this.value <- v;

        this.next <- 0;
    }
}

Map format 
{   
    privates;

    .head MapEntry;
    .rlast MapEntry;

    .kneErr method<string k> -> u32
    {
        print_("Error:: key<" + k + "> does not exist. Exiting program.");
        quit(0);
    }

    publics;
    
    .Map constructor<>
    {
        this.head <- 0;
    }
    
    .find method<string k> -> MapEntry:borrowed
    {
        if(this.head == 0)
        {
            print_("Map empty");
            return null;
        }

        create reference <- borrow this.head;

        while(reference.key != k)
        {
            if(reference.next == 0)
            {
                this.rlast <- reference; /* won't take ownership since reference is borrowed */
                return null;
            }
            reference <- borrow reference.next;
        }
        return reference;
    }
    
    .remove method<string k> -> u32
    {
        if(this.head.key == k)
        {
            this.head <- this.head.next;
            return 0;
        }

        if(this.head.next == 0)
        {
            this.kneErr(k);
        }

        create reference <- borrow this.head;

        while(reference.next.key != k)
        {
            reference <- borrow reference.next;
            if(reference.next == 0)
            {
                this.kneErr(k);
            }
        }

        reference.next <- reference.next.next;
    }

    .set method<string k, u32 val> -> u32
    {
        if(this.head == 0)
        {
            this.head <- MapEntry(k,val);
            return 0;
        }
        else
        {
            create reference <- this.find(k);

            if(reference == 0)
            {
                this.rlast.next <- MapEntry(k,val);
            }
            else
            {
                reference.value <- val;
            }
        }
    }

    .get method<string k> -> u32
    {
        create found <- this.find(k);
        if(found == 0)
        {
            this.kneErr(k);
            return 0;
        }
            
        return(this.find(k).value);
    }

    .Map operator(index_set)<string k, u32 v>
    {
        this.set(k,v);
    }

    .Map operator(index_get)<string k> -> any
    {
        return(this.get(k));
    }
}

entry function<> -> u32
{
    create map <- Map();

    map["bob"] <- 123;
    print_(map["bob"]);

    map["bob"] <- 456;
    print_(map["bob"]);

    map["jon"] <- 789;
    print_(map["jon"]);

    map["mike"] <- 321;
    print_(map["mike"]);

    map["joe"] <- 654;
    print_(map["joe"]);
}
```

### More Overloads
```Dart
#include sys cfiles

iofile format
{
    .fptr p32;

    .iofile constructor<>
    {
        this.fptr <- 0;
    }

    .iofile constructor<conststr name>
    {
        this.fptr <- fopen(name, "wb+");
    }

    .open method<conststr name>
    {
        this.fptr <- fopen(name, "wb+");
    }

    .openMode method<conststr name, conststr mode>
    {
        this.fptr <- fopen(name, mode);
    }

    .isOpen method<> -> u8
    {
        return(this.fptr != 0);
    }

    .close method<> -> none
    {
        fclose(this.fptr);
    }

    .rewind method<> -> none
    {
        rewind(this.fptr);
    }

    .seekg method<u32 address> -> u32
    {
        return(fseek(this.fptr, address, 0));
    }

    .write method<string buffer> -> none
    {
        fwrite(buffer, 1, strlen(buffer), this.fptr);
    }

    .getTo method<u8 character> -> string
    {
        create outString <- "";

        create curChar <- fgetc(this.fptr);
        while((curChar != character) && (curChar != -1))
        {
            outString <- outString + curChar;
            curChar <- fgetc(this.fptr);
        }

        return outString;
    }

    .getLine method<> -> string
    {
        return(this.getTo(10));
    }

    .iofile operator(shl)<string buffer> -> iofile
    {
        this.write(buffer);
        return this;
    }

    .iofile operator(shl)<u32 number> -> iofile
    {
        this.write(itos(number));
        return this;
    }

    .iofile operator(shr)<string:reference buffer> -> iofile
    {
        buffer <- this.getLine();
        return this;
    }

    .iofile operator(shr)<u32:reference outnum> -> iofile
    {
        outnum <- atoi(this.getLine());
    }

}

entry function<> -> u32
{
    create myFile <- iofile("test.txt");
    myFile << "Rio is the best dog!\n" << 123 << "\nHello \n" << 456789 << " Bye!";
    
    myFile.rewind();
    
    create string output;
    create u32 onum;

    myFile >> output;
    print_(output);

    myFile >> onum;
    print_(onum);

    print_(myFile.getLine());
    print_(myFile.getLine());

    myFile.close();

    return 0;
}
```

### Lambda Captures
```Dart
doOperation function<u32 a, u32 b, fn operation> -> auto
{
    operation(a,b);
}

entry function<> -> u32
{
    create someVar <- 123;
    create otherVar <- 456;

    /* someVar and otherVar can be read and modified within the lambda */
    doOperation(4,5, 
        lambda<u32 pa, u32 pb> -> auto {
            print_(`someVar is ${someVar}`);
            print_(`setting someVar to: ${pa} + ${pb} + ${someVar} = ${pa + pb + someVar}`); 
            someVar <- pa + pb + someVar;
        }
    );

    /* should be 132 now */
    print_(`someVar is now ${someVar}`);
    return 0;
}
```

### Strings
```Dart
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

    create awesomePerson <- "Rio";
    create age <- 123.456;

    print_("Hello " + me + " and " + awesomePerson + "! I am " + age + " years old");
    
    /* HAM also supports string interpolation */
    print_(`Hello ${me} and ${awesomePerson}! And in 1 year I will be ${age + 1} years old`);

    if(me.name == "Nico")
    {
        print_("Hey! My name is also Nico!");
    }

    return 0;
}
```

### Variadics
```Dart
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
```Dart
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
```Dart
/* make sure compiling with -lpthread */
forward pthread_create function<p32 a, u32 b, fn c, u32 d>;
forward pthread_exit function<u32 a>;
forward write function<u32 a, conststr b, u32 c>;

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
    pthread_create($(tid), 0, $thread, 0);
    
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
```Dart
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

```Dart
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
        explicit type: create f32 sum <- 0.0;
        explicit cast: create sum <- f32:(0.0);
    */
    create sum <- 0.0;

    while(sum_index <: sum_end)
    {
        sum <- sum + 1.0 / factorial(sum_index);
        sum_index <- sum_index + 1;
    }

    print_(sum);

    return 0;
}
```
