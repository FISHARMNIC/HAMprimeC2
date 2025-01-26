# New GC model

* Each object has a reference count
* At the end of each scope check everything that needs to be destroyed
    * Formats need to have a destructor, which checks all of its properties
    * Same as arrays, which need to check if each entry is an allocation

Possible ways of checking for leaked data
* Just check for 0 refs in all allocations
OR
* Each scope open creates a new allocation "frame"
    * The end of the scope just destroy everything with 0 refs
    * Obviously need "dontFree" and temp owners