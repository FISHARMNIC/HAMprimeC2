#include "rollcall.h"
#include "linked.h"

// #include <stdio.h>
// #include <string.h>

extern linked_t *__Roster;

// #include <stdio.h>
// #include <string.h>

void __roster_add(full_malloc_t* allocation)
{
    linked_t* link = (linked_t*) allocation; //link is first part of alloc
    roster_entry_t* roster_entry = &(allocation->section_rosterEntry);

    link->next = __Roster;
    link->item = roster_entry;
    
    __Roster = link;
}

linked_t* __roster_remove(linked_t *previous, linked_t *curr)
{
    linked_t *nextPtr = curr->next;

    int allocated_bytes = curr->item->size;
    memset(curr->item->pointer, 0, allocated_bytes);

    __rc_total_allocated_bytes__ -= GET_ALLOC_SIZE(allocated_bytes);

    free(curr);

    if (UNLIKELY(previous == (linked_t*)0)) // if the beginning
    {   
        assert(__Roster != 0);
        __Roster = nextPtr;
    }
    else // if not the beginning
    {
        previous->next = nextPtr;
    }

    return nextPtr;
}




/*
static __linked_t *lastPtr = (__linked_t *) 0;

void __linked_add(__linked_t **list_db, roster_entry_t *item, __linked_t* listItem)
{
    __linked_t* list = *list_db;

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
}

__linked_t* __linked_remove(__linked_t **list_db, __linked_t *previous, __linked_t *curr)
{
    __linked_t *nextPtr = curr->next;
    
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


    if (LIKELY(previous != (__linked_t*)0)) // if not the beginning
    {   
        previous->next = nextPtr;

        if(nextPtr == (__linked_t*)0) // deleting last item
        {
            lastPtr = previous; // last to previous
        }
        
        return nextPtr;
    }
    else // if the beginning
    {
        *list_db = nextPtr;

        if(nextPtr == (__linked_t*)0) // deleting last item
        {
            lastPtr = 0; // last to previous
        }

        return nextPtr;
    }
}
*/

/*
__linked_t *__linked_readIndex(__linked_t *list, int index)
{
    while (index > 0)
    {
        assert(list->next != 0);
        list = list->next;
        index--;
    }
    return list;
}

int __linked_itemExists(__linked_t* list, roster_entry_t* _item)
{
    while (list->next != 0)
    {
        if(list->item == _item)
        {
            return TRUE;
        }
        list = list->next;
    }
    return FALSE;
}

int __linked_getSize(__linked_t *list)
{
    int index = 0;
    while (list->next != 0)
    {
        list = list->next;
        index++;
    }
    return index;
}

__linked_t *__linked_getLast(__linked_t *list)
{
    while (list->next != 0)
    {
        //printf("%p %p\n", list, list->next);
        list = list->next;
    }
    return list;
}

*/