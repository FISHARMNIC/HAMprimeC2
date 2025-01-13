#include "rollcall.h"
#include "linked.h"

#include "chunks.h"
extern linked_chunks_t* __chunkStack;
extern linked_t *Roster;

// #include <stdio.h>
// #include <string.h>

void __roster_add(full_malloc_t* allocation)
{
    linked_t* link = (linked_t*) allocation; //link is first part of alloc
    roster_entry_t* roster_entry = &(allocation->section_rosterEntry);

    link->next = Roster;
    link->item = roster_entry;
    
    Roster = link;

    if(LIKELY(__chunkStack != 0))
    {
        (__chunkStack->size) += roster_entry->size;
    }
}

linked_t* __roster_remove(linked_t *previous, linked_t *curr)
{
    linked_t *nextPtr = curr->next;

    int allocated_bytes = curr->item->size;
    memset(curr->item->pointer, 0, allocated_bytes);

    __rc_total_allocated_bytes__ -= GET_ALLOC_SIZE(allocated_bytes);

    free(curr);

    if(LIKELY(__chunkStack != 0))
    {
        (__chunkStack->size) -= allocated_bytes;
    }

    if (UNLIKELY(previous == (linked_t*)0)) // if the beginning
    {   
        assert(Roster != 0);
        Roster = nextPtr;
    }
    else // if not the beginning
    {
        previous->next = nextPtr;
    }

    return nextPtr;
}