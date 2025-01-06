#include sys staticLL
#include sys dynamicLL

entry function<>
{
    /* for use with things such as ints, floats, etc */
    create linkedList <- StaticLL();

    linkedList.push(1);
    linkedList.push(2);
    linkedList.push(3);
    linkedList.pushFront(0);

    print_(linkedList.popFront());
    print_(linkedList.pop());

    print_(`Empty? ${linkedList.empty()}`);

    linkedList.push(4);

    linkedList.delete(2);
    linkedList.push(5);

    linkedList.forEach(lambda<u32 item>{print_(item);});

    print_("Removing 3 elements...");
    linkedList.pop();
    linkedList.pop();
    linkedList.pop();

    print_(`Empty? ${linkedList.empty()}\n`);

    /* for use with strings, formats, arrays, etc */
    /* note that all methods and features shown below also work for StaticLL */
    linkedList <- DynamicLL(); 

    linkedList.push("apples");
    linkedList.push("oranges");
    linkedList.push("peaches");

    linkedList[1] <- "blueberries";

    print_(string:(linkedList[0]));
    print_(string:(linkedList[1]));
    print_(string:(linkedList[2]));

    print_("----");

    /* can also do lambda<string item, u32 index> if you want */
    /* just make sure to borrow it so you dont accidentally take ownership */
    linkedList.forEach(lambda<string:borrowed item>
    {
        print_(item);
    });

    print_("----");

    print_(string:(linkedList.popFront()));
    print_(string:(linkedList.pop()));
    print_(string:(linkedList.pop()));


    /*
    //Un comment to check leaks with valgrind
    linkedList <- 0;
    __asm__ "movw $0, ___TEMPORARY_OWNER___"; // can't modify the var normally since the compiler treats sets to it differently
    __asm__ "movw $0, __gc_dontClear__";
    __rc_collect__();
    __rc_collect__(); // First time also clears data, so second pass to collect those whos owner is now null
    exit(0);
    */
}