#ifndef linked_H
#define linked_H

#include <stdlib.h>
#include <assert.h>
#include <stdio.h>

#include "rollcall.h"

typedef struct linked_t
{
    roster_entry_t* item;
    struct linked_t* next;
} linked_t;

typedef struct
{
    linked_t section_linked;
    roster_entry_t section_rosterEntry;
    described_buffer_t section_describedBuffer;
} full_malloc_t;

typedef struct linked_chunks_t
{
    linked_t* address;
    struct linked_chunks_t* next;
    int size;
} linked_chunks_t;

//linked_t* __linked_readIndex(linked_t* list, int index);
//linked_t* __linked_getLast(linked_t* list);
//int __linked_getSize(linked_t* list);
//linked_t* __linked_remove(linked_t** list, int index);
//int __linked_itemExists(linked_t* list, roster_entry_t* _item);

void __roster_add(full_malloc_t *allocation);
linked_t* __roster_remove(linked_t *previous, linked_t *curr);

#endif