#include "rollcall.h"
#include "linked.h"

// #include <stdio.h>
// #include <string.h>

static __linked_t *lastPtr = (__linked_t *) 0;

void __linked_add(__linked_t **list_db, roster_entry_t *item, __linked_t* listItem)
{
    __linked_t* list = *list_db;

    if(unlikely(list == 0)) // empty
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
    
    free(curr);

    if (likely(previous != (__linked_t*)0)) // if not the beginning
    {
        //memset(curr->item->pointer, 0, curr->item->size);
        
        previous->next = nextPtr;

        if(nextPtr == (__linked_t*)0) // deleting last item
        {
            lastPtr = previous; // last to previous
        }
        
        return nextPtr;
    }
    else // if the beginning
    {
        //memset(list->item->pointer, 0, list->item->size);
        
        *list_db = nextPtr;

        if(nextPtr == (__linked_t*)0) // deleting last item
        {
            lastPtr = 0; // last to previous
        }

        return nextPtr;
    }
}

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