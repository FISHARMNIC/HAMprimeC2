#include "rollcall.h"
#include "linked.h"

#include <stdio.h>
__linked_t *Roster = 0;
static int allocated_bytes = 0;

int __disable_gc__ = 0;

const int SIZE_ROSTER_AND_ENTRY = (sizeof(roster_entry_t) + sizeof(roster_entry_t *));

void __rc_quick_check__()
{
    asm volatile("pusha");
    if(allocated_bytes > BYTES_PER_GC && __disable_gc__ == 0)
    {
        //printf("trigger\n");
        __rc_collect__();
        allocated_bytes = 0;
    }
    asm volatile("popa");
}

void *__rc_allocate__(int size_bytes, int restricted)
{
    //asm volatile("pusha");
    // Note, here using malloc which also stores size.
    // In compiler use mmap2
    //printf("Malloc %i\n", size_bytes);
    
    // automatic allocation done at over BYTES_PER_GC bytes allocated
    // if(allocated_bytes > BYTES_PER_GC && __disable_gc__ == 0)
    // {
    //     //printf("trigger\n");
    //     __rc_collect__();
    //     allocated_bytes = 0;
    // }
    allocated_bytes += SIZE_ROSTER_AND_ENTRY + size_bytes + 1;

    // old
    //roster_entry_t *roster_entry = malloc(sizeof(roster_entry_t));
    //described_buffer_t *described_buffer = malloc(sizeof(roster_entry_t *) + size_bytes);

    //printf(":::: Attempting malloc of size %i\n", size_bytes);
    //Better, only one malloc call and one free

    // !!!!!!! IMPORTANT. NOT ALLOCATING ENOUGH SPACE HERE OR OVERFLOW.
    //          TRY ALLOC + extra 32 on issue.x
    //          EVEN TRYING +1 WORKS!
    //    TEMP FIX: added +1
    roster_entry_t *roster_entry = malloc(SIZE_ROSTER_AND_ENTRY + size_bytes + 1);
    described_buffer_t *described_buffer = (described_buffer_t *) (((char*)roster_entry) + sizeof(roster_entry_t));

    assert(roster_entry != 0);

    described_buffer->entry_reference = roster_entry;

    roster_entry->owner = 0;
    roster_entry->restricted = restricted;
    roster_entry->size = size_bytes;
    roster_entry->pointer = &(described_buffer->data);

    //printf("ATTEMPTING ADD TO ROSTER\n");
    __linked_add(&Roster, roster_entry);

    //printf("\t\tAllocated Roster[%i] {%i} @%p\n", __linked_getSize(Roster), size_bytes, &(described_buffer->data));
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
    //printf("------Collecting-----\n");
    __linked_t *list = Roster;

    while (list != 0)
    {
        roster_entry_t *roster_entry = list->item;
        assert(roster_entry != 0);

        int **owner_reference = (int **)roster_entry->owner;
        int *owner_points_to = 0;
        if(owner_reference != 0)
        {
            owner_points_to = *((int **)roster_entry->owner);
        }
        int *owner_should_point_to = (int *)roster_entry->pointer;

        //printf("|- Checking %p vs %p\n", owner_should_point_to, owner_points_to);
        if (owner_points_to != owner_should_point_to)
        {
            //printf("\t ^- Discarding item was %s now %p\n", owner_should_point_to, owner_points_to);
            list = __linked_remove(&Roster, list);
        }
        else
        {
            list = list->next;
        }
    }

    //printf("\\---------------------/\n");
}

/*
void __rc_free_allOLD__()
{
    __linked_t *list = Roster;

    int index = 0;
    while (list != 0)
    {
        roster_entry_t *roster_entry = list->item;
        assert(roster_entry != 0);
        //printf("|- Discarding item %p\n", roster_entry->pointer);
        list = __linked_remove(&Roster, list);
    }
}
*/

void __rc_free_all__()
{
    __linked_t * list = Roster->next;
    if(Roster == (void*)0)
        return;

    free(Roster->item);
    free(Roster);

    while(list != (void*) 0)
    {
        __linked_t * nextPtr = list->next;
        free(list->item);
        free(list);
        list = nextPtr;
    }
}

/// @brief 
/// @param dest Memory address of destination
/// @param src  Source pointer
// /// @param elementSize 
/// @return destination
int* __copydata__(int* dest, int* src /*, int elementSize*/)
{
    // get size of destination in bytes
    described_buffer_t* srcBuffer = (described_buffer_t*)(src - 1);
    described_buffer_t* destBuffer = (described_buffer_t*)(dest - 1);
    int srcSize = srcBuffer->entry_reference->size;
    int destSize = destBuffer->entry_reference->size;

    //printf("::: attempting mov %i\n", elementSize * srcSize);
    //memcpy(dest, src, elementSize * (srcSize < destSize? srcSize : destSize));

    //printf("::: attempting mov %i\n", (srcSize < destSize? srcSize : destSize));
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
    __rc_free_all__();
    exit(code);
}