#include sys dynamicLL

entry function<>
{
    create linkedList <- DynamicLL(); 

    linkedList.push("apples");

    print_(string:(linkedList.popFront()));
    
    printf("---\n%p\n%p\n%p\n---", linkedList.start,linkedList.end,linkedList.secondLast);

    linkedList <- 0;
    __asm__ "movw $0, ___TEMPORARY_OWNER___"; // can't modify the var normally since the compiler treats sets to it differently
    __asm__ "movw $0, __gc_dontClear__";
    __rc_collect__();
    __rc_collect__();
    exit(0);
    
}