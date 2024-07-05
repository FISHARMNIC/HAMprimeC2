# HAM prime
#### Compiler 2

---
This is a the second compiler that I have developed for HAM prime. So far it lacks many features that existed in the original HAM prime compiler. However, this new compiler is much more optimized and has less bugs than the original

### Main differences
* Much better optimization
* Full inclusion of stack allocation
* Recursion
* Standard calling convention
* No more corner cases where certain things won't work
* Parenthesis math 
* Seamless C inclusion

### New IDE
<img width="1249" alt="Screen Shot 2024-06-17 at 12 21 11 PM" src="https://github.com/FISHARMNIC/HAMprimeC2/assets/73864341/4434942e-023f-4092-8913-dfc529c500a7">

### Whats working
* Variables
* Arrays
* Format declaration and allocation (no accessing yet)
* Functions
* NEW: Function prototypes
* NEW: Variadics
* Math (no floats yet)
* see `test/working` for working programs

### Examples
**Basic demo**
```C
getNum function<u32 n> -> u32
{
    return(n);
}

entry function<p8 args, u32 argv> -> u32
{
    create x <- 0;
    create y <- 9;
    while(x <: getNum(3))
    {
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