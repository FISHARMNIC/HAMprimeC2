#include "rollcall.h"
#include "linked.h"

// #include <stdio.h>
// #include <string.h>

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

__linked_t *__linked_getLast(__linked_t *list)
{
    while (list->next != 0)
    {
        //printf("%p %p\n", list, list->next);
        list = list->next;
    }
    return list;
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

void __linked_add(__linked_t **list_db, roster_entry_t *item, __linked_t* listItem)
{
    __linked_t* list = *list_db;

    if(list == 0)
    {
        list = listItem;
        *list_db = list;
        list->item = item;
        list->next = 0;
    } else {
        list = __linked_getLast(list);
        list->next = listItem;
        list->next->item = item;
        list->next->next = 0;
    }
}

// __linked_t *__linked_remove(__linked_t **list_db, int index)
// {
//     __linked_t * list = *list_db;
//     //printf("Removing %p, %i\n", list_db, index);
//     if (index != 0)
//     {
//         list = __linked_readIndex(list, index - 1);
//         //printf("\tIndex addr: %p, %p\n", list, list->next); // WHY NIL? 
//         __linked_t *save_link = list->next->next;
//         //printf("\tSave_link: %p\n", save_link);
//         // test for zeroing out garbage
//         memset(list->next->item->pointer, 0, list->next->item->size);
//         //printf("\tFreeing: %p\n", list->next);
//         free(list->next);
//         list->next = save_link;
//         return list->next;
//     }
//     else
//     {
//         __linked_t *save_link = list->next;
//         // test for zeroing out garbage
//         //memset(list->item->pointer, 0, list->item->size);
//         free(list);
//         list = save_link;
//         *list_db = list;
//         return list;
//     }
//     //return list;
// }

__linked_t* __linked_remove(__linked_t **list_db, __linked_t *previous, __linked_t *curr)
{
    __linked_t* list = *list_db;
    
    if (previous != (__linked_t*)0)
    {
        __linked_t *nextPtr = curr->next;
        memset(curr->item->pointer, 0, curr->item->size);
        
        //free(curr->item);
        free(curr);

        previous->next = nextPtr;
        
        return nextPtr;
    }
    else
    {
        __linked_t *nextPtr = list->next;
        memset(list->item->pointer, 0, list->item->size);
        
        //free(list->item);
        free(list);
        
        *list_db = nextPtr;

        return nextPtr;
    }
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