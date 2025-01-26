#include "rollcall.h"
#include "linked.h"

#include "chunks.h"
extern linked_chunks_t* __chunkStack;


// #include <stdio.h>
// #include <string.h>

static linked_t *lastPtr = (linked_t *) 0;

void __linked_add(linked_t **list_db, roster_entry_t *item, linked_t* listItem)
{
    linked_t* list = *list_db;

    if(UNLIKELY(list == 0)) // empty
    {
        list = listItem;
        *list_db = list;

        listItem->item = item;
        listItem->next = 0;

        lastPtr = listItem;
    } 
    else 
    {
        list = lastPtr;
        list->next = listItem;

        listItem->item = item;
        listItem->next = 0;

        lastPtr = listItem;
    }

    if(LIKELY(__chunkStack != 0))
    {
        (__chunkStack->size)++;
    }
}

linked_t* __linked_remove(linked_t **list_db, linked_t *previous, linked_t *curr)
{
    linked_t *nextPtr = curr->next;
    
    int allocated_bytes = curr->item->size;


    //full_malloc_t* fm = (full_malloc_t*) curr;
    //void* tbfree = fm->section_rosterEntry.pointer;

    // printf("\t ^- Clearing %i bytes from %p\n", allocated_bytes, curr->item->pointer); //tbfree);
    
    // for(int i = 0; i < allocated_bytes; i++)
    // {
    //     printf("\t\t: [%i] is %c\n", i, i[(char*)curr->item->pointer]);
    // }


    memset(curr->item->pointer, 0, allocated_bytes);
    __rc_total_allocated_bytes__ -= GET_ALLOC_SIZE(allocated_bytes);
    //printf("-- : %i => %i\n", sizeof(full_malloc_t) + allocated_bytes, __rc_total_allocated_bytes__);
    free(curr);

    if(LIKELY(__chunkStack != 0))
    {
        (__chunkStack->size)--;
    }

    if (LIKELY(previous != (linked_t*)0)) // if not the beginning
    {   
        previous->next = nextPtr;

        if(nextPtr == (linked_t*)0) // deleting last item
        {
            lastPtr = previous; // last to previous
        }
        
        return nextPtr;
    }
    else // if the beginning
    {
        *list_db = nextPtr;

        if(nextPtr == (linked_t*)0) // deleting last item
        {
            lastPtr = 0; // last to previous
        }

        return nextPtr;
    }
}