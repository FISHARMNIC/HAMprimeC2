#include "rollcall.h"
#include "linked.h"

__linked_t *Roster = 0;
int __rc_total_allocated_bytes__ = 0;
 
int __disable_gc__ = 0;
void* __gc_dontClear__ = (void*)-1;

/*
// int bob = 0;
// moved to assembly in gcollect.s, no idea what was going on AT ALL
// Switch to asm seemed to work
void __rc_quick_check__()
{
    asm volatile("pusha");

    if((__rc_total_allocated_bytes__ > BYTES_PER_GC) && (__disable_gc__ == 0))
    {
        //dbgprint("trigger\n");
        //printf("hi\n");
        __rc_collect__();
        // Commenting this breaks it
        // Why???????????
        bob = 100;
    }

    asm volatile("popa");
}
*/

void *__rc_allocate__(int size_bytes, int restricted)
{
    //asm volatile("pusha");
    // Note, here using malloc which also stores size, maybe switch to mmap2

    if(__rc_total_allocated_bytes__ >= BYTES_FORCE_GC)
    {
        __rc_collect__();
    }

    int actualAllocSize = sizeof(full_malloc_t) + size_bytes;

    dbgprint(":::: Attempting malloc of with inner data of size %i\n", size_bytes);

    full_malloc_t *allocation = malloc(actualAllocSize);
    assert(allocation != 0);

    //printf("++ : %i => %i\n", actualAllocSize, __rc_total_allocated_bytes__);
    __rc_total_allocated_bytes__ += actualAllocSize;

    __linked_t *listEntry = (__linked_t*) allocation;
    roster_entry_t *roster_entry = &(allocation->section_rosterEntry);
    described_buffer_t *described_buffer = &(allocation->section_describedBuffer);

    described_buffer->entry_reference = roster_entry;

    roster_entry->owner = 0;
    roster_entry->restricted = restricted;
    roster_entry->size = size_bytes;
    roster_entry->pointer = &(described_buffer->data);

    dbgprint("ATTEMPTING ADD TO ROSTER\n");
    __linked_add(&Roster, roster_entry, listEntry);

    //asm volatile("popa");
    return roster_entry->pointer;
}

void *__rc_allocate_with_tempowner__(int size_bytes, int restricted)
{
    void* allocation = __rc_allocate__(size_bytes, restricted);
    __rc_requestOwnership__(allocation, &___TEMPORARY_OWNER___);
    return allocation;
}

void __rc_collect__()
{
    dbgprint("------Collecting-----\n");
    __linked_t *list = Roster;
    __linked_t *previous = (__linked_t*)0;
    
    while (list != 0)
    {
        roster_entry_t *roster_entry = list->item;
        assert(roster_entry != 0);

        int **owner_reference = (int **)roster_entry->owner;
        int *owner_points_to = 0;

        if(likely(owner_reference != 0))
        {
            owner_points_to = *((int **)roster_entry->owner);
        }

        int *owner_should_point_to = (int *)roster_entry->pointer;

        dbgprint("|- Checking %p vs %p and %p\n", owner_should_point_to, owner_points_to, __gc_dontClear__);
        if ((owner_points_to != owner_should_point_to) && (__gc_dontClear__ != owner_should_point_to))
        {
            dbgprint("\t ^- Discarding item was %p now %p\n", owner_should_point_to, owner_points_to);
            list = __linked_remove(&Roster, previous, list);
        }
        else
        {
            dbgprint("\t ^- Skipped \n");
            previous = list;
            list = list->next;
        }
    }

    dbgprint("\\---------------------/\n");
}

void __rc_free_all__()
{
    __linked_t * list;
    
    if(Roster == (__linked_t*)0)
        return;
    
    list = Roster->next;

    free(Roster);

    while(list != (__linked_t*)0)
    {
        __linked_t * nextPtr = list->next;
        free(list);
        list = nextPtr;
    }

   // __rc_total_allocated_bytes__ = 0;
}

int* __copydata__(int* dest, int* src)
{
    // get size of destination in bytes
    described_buffer_t* srcBuffer = (described_buffer_t*)(src - 1);
    described_buffer_t* destBuffer = (described_buffer_t*)(dest - 1);
    int srcSize = srcBuffer->entry_reference->size;
    int destSize = destBuffer->entry_reference->size;

    dbgprint("::: attempting mov %i\n", (srcSize < destSize? srcSize : destSize));
    memcpy(dest, src, (srcSize < destSize? srcSize : destSize));

    return dest;
}

int* __duplicate__(int* src)
{
    described_buffer_t* srcBuffer = (described_buffer_t*)(src - 1);
    int srcSize = srcBuffer->entry_reference->size;

    int* dest = __rc_allocate__(srcSize, 0);
    memcpy(dest, src, srcSize);
    return dest;
}

void quit(int code)
{
    __gc_dontClear__ = (void*) -1;
    __rc_free_all__();
    exit(code);
}