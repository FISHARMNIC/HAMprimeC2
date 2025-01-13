#include "chunks.h"

// pointer to chunk pointers, which are just LL ptrs
// so really an array where each item points to a part of the LL  
linked_chunks_t* __chunkStack = (linked_chunks_t*) 0;

extern linked_t *Roster;
extern void* __gc_dontClear__;

void __rc_enterChunk__()
{
    linked_chunks_t* newItem = malloc(sizeof(linked_chunks_t));

    newItem->address = Roster;
    newItem->size = 0;
    newItem->next = __chunkStack;

    __chunkStack = newItem;
}

void __rc_exitChunk__()
{
    linked_chunks_t* save = __chunkStack;
    linked_t* end = save->address;

    linked_t* list = Roster;
    linked_t *previous = (linked_t*)0;

    while(list != end && list != 0)
    {
        roster_entry_t *roster_entry = list->item;

        assert(roster_entry != 0);

        int **owner_reference = (int **)roster_entry->owner;
        int *owner_points_to = 0;

        if(LIKELY(owner_reference != 0))
        {
            owner_points_to = *((int **)roster_entry->owner);
        }

        int *owner_should_point_to = (int *)roster_entry->pointer;

        dbgprint("|- Checking %p vs %p (dontClear is %p) [Allocation is %p]\n", owner_should_point_to, owner_points_to, __gc_dontClear__, list);

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

    __chunkStack = __chunkStack->next;
    free(save);
}