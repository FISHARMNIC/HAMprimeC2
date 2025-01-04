#include sys staticLL
#include sys dynamicLL

entry function<>
{
    create linkedList <- StaticLL();

    linkedList.push(1);
    linkedList.push(2);
    linkedList.push(3);
    linkedList.pushFront(0);

    print_(linkedList.popFront());
    print_(linkedList.pop());

    print_(`Empty? ${linkedList.empty()}`);

    print_("Removing 2 elements...");
    linkedList.pop();
    linkedList.pop();

    print_(`Empty? ${linkedList.empty()}`);

    linkedList <- DynamicLL(); 

    linkedList.push("apples");
    linkedList.push("oranges");
    linkedList.push("peaches");

    //print_(linkedList.pop());
    //print_(linkedList.popFront());
    //print_(linkedList.popFront());

    /* 
    //Un comment to check leaks with valgrind
    linkedList <- 0;
    __rc_collect__();
    exit(0);
    */
}