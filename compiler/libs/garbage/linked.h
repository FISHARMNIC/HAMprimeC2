#ifndef linked_H
#define linked_H

#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

typedef struct __linked_t
{
    roster_entry_t* item;
    struct __linked_t* next;
} __linked_t;

typedef struct
{
    __linked_t section_linked;
    roster_entry_t section_rosterEntry;
    described_buffer_t section_describedBuffer;
} full_malloc_t;

//__linked_t* __linked_readIndex(__linked_t* list, int index);
//__linked_t* __linked_getLast(__linked_t* list);
//int __linked_getSize(__linked_t* list);
//__linked_t* __linked_remove(__linked_t** list, int index);
//int __linked_itemExists(__linked_t* list, roster_entry_t* _item);

void __linked_add(__linked_t **list_db, roster_entry_t *item, __linked_t* listItem);
__linked_t* __linked_remove(__linked_t **list_db, __linked_t *previous, __linked_t *curr);

#endif