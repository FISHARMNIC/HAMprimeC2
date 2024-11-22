/* not like Java generics */

Person format
{
    .name string;
    .age u32;

    .toString method<> -> auto
    {
        return(`name: ${this.name}, age: ${this.age}`);
    }
}

/* 
Works, but todos are:
    * Function overloads finally
    * maybe do like "support"
        * clones functions as overloads

Example:

map function supports
    <any:dynamic:array arr, any operation>
    <any:static:array arr, any operation>
{
...
}


Notes:
* any:dynamic is any dynamic type
* any:static  is any static type (or just any)

* any:dynamic:array is any type that is an array of dynamics

*/

map function<any:dynamic:array arr, any operation>
{
    create i <- 0;
    create size <- len(arr);

    while(i <: size)
    {
        arr[i] <- (call operation(arr[i]) -> any:dynamic);
        i <- i + 1;
    }
}

entry function<>
{
    create family <- {"Dad", "Mom", "Dog", "Cat"};
    
    create jon <- Person[2];
    jon[0] <- Person<name:"Joe",age:123>;
    jon[1] <- Person<name:"Jim",age:456>;

    /* calls first map function */
    map(family, lambda<string value> {
        return (`I love my ${value}`);
    });

    map(jon, lambda<Person value> {
        value.age <- 1;
        
        return value;
    });

    print_(family);
    print_(jon);

    return 0;
}