/*
https://stackoverflow.com/questions/5092134/whats-the-difference-between-generational-and-incremental-garbage-collection
Look at answer by Bernd Elkemann

Plans:
    create a defragger: https://www.cs.cornell.edu/courses/cs312/2003fa/lectures/sec24.htm


*/

// #define _DEBUG

#include "rollcall.h"
#include "linked.h"
#include "chunks.h"

linked_t *__Roster = 0;
int __rc_total_allocated_bytes__ = 0;
extern linked_chunks_t *__ChunkStack;

int __disable_gc__ = 0;
void *__gc_dontClear__ = (void *)-1;

void *__rc_allocate__(int size_bytes, int restricted)
{
    // trigger collection on allocation limit (higher than rc_collect limit)
    // more of a backup system, incase the user is allocating a lot of data inside a loop without any function calls
    if (__rc_total_allocated_bytes__ >= BYTES_FORCE_GC)
    {
        // printf("overflow\n");
        __rc_collect_overflow__();
    }

    // size_bytes += 32;
    int actualAllocSize = GET_ALLOC_SIZE(size_bytes);

    dbgprint("|- Attempting malloc of with inner data of size %i\n", size_bytes);

    // Note, here using malloc which also stores size, maybe switch to mmap2
    full_malloc_t *allocation = malloc(actualAllocSize);
    if (UNLIKELY(allocation == 0))
    {
        perror("[ROLL CALL] Malloc failed!");
        exit(1);
    }

    __rc_total_allocated_bytes__ += actualAllocSize;

    // All memory is grouped into one allocation, so split it up into its individual components
    roster_entry_t *roster_entry = &(allocation->section_rosterEntry);
    described_buffer_t *described_buffer = &(allocation->section_describedBuffer);

    described_buffer->entry_reference = roster_entry;
    //described_buffer->size = size_bytes;

    roster_entry->owner = 0;
    roster_entry->restricted = restricted;
    roster_entry->size = size_bytes;
    roster_entry->pointer = &(described_buffer->data);

    dbgprint(" \\- Allocated address at %p, data is at %p\n", allocation, roster_entry->pointer);

    // dbgprint("ATTEMPTING ADD TO ROSTER\n");
    __roster_add(allocation);

    return roster_entry->pointer;
}

void *__rc_allocate_with_tempowner__(int size_bytes, int restricted)
{
    void *allocation = __rc_allocate__(size_bytes, restricted);
    __rc_requestOwnership__(allocation, &___TEMPORARY_OWNER___);

    return allocation;
}

void __rc_collect__()
{
    //__rc_exitChunk__();
    if (UNLIKELY(__disable_gc__))
    {
        return;
    }
    // return;

    dbgprint("------Collecting-----\n");

    linked_t *list = __Roster;
    linked_t *previous = (linked_t *)0;

    // for each item in __Roster
    while (list != 0)
    {
        roster_entry_t *roster_entry = list->item;

        assert(roster_entry != 0);

        int **owner_reference = (int **)roster_entry->owner;
        int *owner_points_to = 0;

        // only deref if not null
        if (owner_reference != 0)
        {
            owner_points_to = *owner_reference;
        }

        int *owner_should_point_to = (int *)roster_entry->pointer;

        dbgprint("|- Checking %p vs %p (dontClear is %p) [Allocation is %p], owner is %p\n", owner_should_point_to, owner_points_to, __gc_dontClear__, list, owner_reference);

        // if the datas owner now points to a different address, this data is considered "lost"
        // __gc_dontClear__ is used in allocation-on-return. It's similar to a temporary owner
        if ((owner_points_to != owner_should_point_to) && (__gc_dontClear__ != owner_should_point_to))
        {
            dbgprint("\t ^- Discarding item was %p now %p\n", owner_should_point_to, owner_points_to);
            list = __roster_remove(previous, list);
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

void __rc_collect_overflow__()
{
    //__rc_exitChunk__();
    if (UNLIKELY(__disable_gc__))
    {
        return;
    }
    // return;

    dbgprint("------Collecting-----\n");

    linked_t *list = __Roster;
    linked_t *previous = (linked_t *)0;

    // for each item in __Roster
    while (list != 0)
    {
        roster_entry_t *roster_entry = list->item;

        assert(roster_entry != 0);

        int **owner_reference = (int **)roster_entry->owner;
        int *owner_points_to = 0;

        // only deref if not null
        if (owner_reference != 0)
        {
            owner_points_to = *owner_reference;
        }
        else
        {
            dbgprint("SKIP\n");
            previous = list;
            list = list->next;
            // goto skip;
        }

        int *owner_should_point_to = (int *)roster_entry->pointer;

        dbgprint("|- Checking %p vs %p (dontClear is %p) [Allocation is %p], owner is %p\n", owner_should_point_to, owner_points_to, __gc_dontClear__, list, owner_reference);

        // if the datas owner now points to a different address, this data is considered "lost"
        // __gc_dontClear__ is used in allocation-on-return. It's similar to a temporary owner
        if ((owner_points_to != owner_should_point_to) && (__gc_dontClear__ != owner_should_point_to))
        {
            dbgprint("\t ^- Discarding item was %p now %p\n", owner_should_point_to, owner_points_to);
            list = __roster_remove(previous, list);
        }
        else
        {
            // skip:
            dbgprint("\t ^- Skipped \n");
            previous = list;
            list = list->next;
        }
    }

    dbgprint("\\---------------------/\n");
}

void __rc_free_all__()
{
    //__rc_exitChunk__(); // remove when done testing

    chunk_index -= MAX_PREALLOCED_CHUNKS;

    while (chunk_index > 0 && __ChunkStack != (linked_chunks_t *)0)
    {
        linked_chunks_t *nextPtr = __ChunkStack->next;
        free(__ChunkStack);
        __ChunkStack = nextPtr;
        chunk_index--;
    }
    while (__Roster != (linked_t *)0)
    {
        linked_t *nextPtr = __Roster->next;
        free(__Roster);
        __Roster = nextPtr;
    }
}

int *__copydata__(int *dest, int *src)
{
    // get size of destination in bytes
    described_buffer_t *srcBuffer = (described_buffer_t *)(src - 1);
    described_buffer_t *destBuffer = (described_buffer_t *)(dest - 1);
    int srcSize = srcBuffer->entry_reference->size;
    int destSize = destBuffer->entry_reference->size;

    dbgprint("::: attempting mov %i\n", (srcSize < destSize ? srcSize : destSize));
    memcpy(dest, src, (srcSize < destSize ? srcSize : destSize));

    return dest;
}

int *__duplicate__(int *src)
{
    described_buffer_t *srcBuffer = (described_buffer_t *)(src - 1);
    int srcSize = srcBuffer->entry_reference->size;

    int *dest = __rc_allocate__(srcSize, 0);
    memcpy(dest, src, srcSize);
    return dest;
}

void quit(int code)
{
    __gc_dontClear__ = (void *)-1;
    __rc_free_all__();
    exit(code);
}