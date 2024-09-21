#include "rollcall.h"
#include "linked.h"

//#include <stdio.h>

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

void __linked_add(__linked_t **list_db, roster_entry_t *item)
{
    __linked_t* list = *list_db;

    if(list == 0)
    {
        list = malloc(sizeof(__linked_t));
        *list_db = list;
        list->item = item;
        list->next = 0;
    } else {
        //printf("\t LASTING-----\n");
        list = __linked_getLast(list);
        list->next = malloc(sizeof(__linked_t));
        list->next->item = item;
        list->next->next = 0;
    }
}

__linked_t *__linked_remove(__linked_t **list_db, int index)
{
    __linked_t * list = *list_db;
    if (index != 0)
    {
        // rewrite.
        list = __linked_readIndex(list, index - 1);
        __linked_t *save_link = list->next->next;
        free(list->next); // issue
        list->next = save_link;
        return list->next;
    }
    else
    {
        __linked_t *save_link = list->next;
        free(list);
        list = save_link;
        *list_db = list;
        return list;
    }
    //return list;
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