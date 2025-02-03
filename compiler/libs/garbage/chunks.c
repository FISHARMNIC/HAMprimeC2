/*

issue must be something involving reading chunk pointer after data it was pointing to was freed in prior run

*/

// #define _DEBUG

#include "chunks.h"

#define CHUNK_EXIT_FREE()                                                    \
    if (UNLIKELY(chunk_index > MAX_PREALLOCED_CHUNKS))                       \
    {                                                                        \
        free(save);                                                          \
    }                                                                        \
    else                                                                     \
    {                                                                        \
        save->address = 0;                                                   \
        save->next = 0;                                                      \
        save->size = 0;                                                      \
    }                                                                        \
                                                                             \
    __ChunkStack = __ChunkStack->next;                                       \
/*                                                                           \
Malloc on enter chunk is super expensive. Maybe pre-alloc circular or smth?? \
*/

// pointer to chunk pointers, which are just LL ptrs
// so really an array where each item points to a part of the LL
linked_chunks_t *__ChunkStack = (linked_chunks_t *)0;

extern linked_t *__Roster;
extern void *__gc_dontClear__;
extern int __disable_gc__;

int chunk_index = 0;

static linked_chunks_t linked_chunks_prealloc[MAX_PREALLOCED_CHUNKS];

void __rc_enterChunk__()
{
    linked_chunks_t *newItem;
    
    if (LIKELY(chunk_index < MAX_PREALLOCED_CHUNKS))
    {
        newItem = &linked_chunks_prealloc[chunk_index];
    }
    else
    {
        newItem = malloc(sizeof(linked_chunks_t));
        if(UNLIKELY(newItem == 0))
        {
            perror("[ROLL CALL] Malloc failed!");
            exit(1);
        }
    }

    chunk_index++;

    newItem->address = __Roster;
    newItem->size = 0;
    newItem->next = __ChunkStack;

    __ChunkStack = newItem;

    dbgprint(">>> Entering chunk %p\n", newItem);
}

void __rc_exitChunk__(int **old_frame_ebp, int **old_frame_esp)
{
    linked_chunks_t *save = __ChunkStack;
    dbgprint(">>> Reading chunk %p\n", save);

    chunk_index--;

    if (save == 0 || save->size == 0 || __disable_gc__)
    {
        dbgprint("Empty or null chunk\n");
        if (LIKELY(save != 0))
        {
            CHUNK_EXIT_FREE();
        }
        return;
    }

    dbgprint("||| - Old frame is between %p -> %p [%i?]\n", old_frame_esp, old_frame_ebp, old_frame_esp <= old_frame_ebp)

    // assert(old_frame_esp <= old_frame_ebp);

    linked_t *end = save->address;
    linked_t *list = __Roster;
    linked_t *previous = (linked_t *)0;

    dbgprint("Chunk has %d bytes\n", save->size);

    while (list != end && list != 0)
    {
        roster_entry_t *roster_entry = list->item;
        // assert(roster_entry != 0);

        int **owner_reference = (int **)roster_entry->owner;
        int *owner_points_to = 0;

        if (owner_reference != 0)
        {
            owner_points_to = *owner_reference;
        }

        int *owner_should_point_to = (int *)roster_entry->pointer;

        dbgprint("|- Checking %p vs %p\n\t> dontClear is %p\n\t> Allocation is %p\n\t> Going to GC because in scope?: %d\n\t> Owner's address is %p\n\t> Roster entry is %p\n", owner_should_point_to, owner_points_to, __gc_dontClear__, list, owner_reference <= old_frame_ebp && owner_reference >= old_frame_esp, owner_reference, roster_entry);

        // if the datas owner now points to a different address, this data is considered "lost"
        // __gc_dontClear__ is used in allocation-on-return. It's similar to a temporary owner

        if (((owner_points_to != owner_should_point_to) || (owner_reference <= old_frame_ebp && owner_reference >= old_frame_esp)) && (__gc_dontClear__ != owner_should_point_to))
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

    CHUNK_EXIT_FREE();
}