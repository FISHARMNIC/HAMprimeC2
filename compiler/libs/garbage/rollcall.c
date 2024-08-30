#include "rollcall.h"
#include "linked.h"

__linked_t *Roster = 0;
static int allocated_bytes = 0;

void *__rc_allocate__(int size_bytes, int restricted)
{
    // Note, here using malloc which also stores size.
    // In compiler use mmap2

    // automatic allocation done at over BYTES_PER_GC bytes allocated
    if(allocated_bytes > BYTES_PER_GC)
    {
        //printf("trigger\n");
        __rc_collect__();
        allocated_bytes = 0;
    }
    allocated_bytes += sizeof(roster_entry_t) + sizeof(roster_entry_t *) + size_bytes;

    // old
    //roster_entry_t *roster_entry = malloc(sizeof(roster_entry_t));
    //described_buffer_t *described_buffer = malloc(sizeof(roster_entry_t *) + size_bytes);

    //Better, only one malloc call and one free
    roster_entry_t *roster_entry = malloc(sizeof(roster_entry_t) + sizeof(roster_entry_t *) + size_bytes);
    described_buffer_t *described_buffer = (described_buffer_t *) (((char*)roster_entry) + sizeof(roster_entry_t));

    assert(roster_entry != 0);

    described_buffer->entry_reference = roster_entry;

    roster_entry->owner = 0;
    roster_entry->restricted = restricted;
    roster_entry->size = size_bytes;
    roster_entry->pointer = &(described_buffer->data);

    __linked_add(&Roster, roster_entry);

    //printf("Allocated Roster[%i] {%i} @%p\n", __linked_getSize(Roster), size_bytes, &(described_buffer->data));

    return roster_entry->pointer;
}

void __rc_collect__()
{
    //printf("/------Collecting-----\\\n");
    __linked_t *list = Roster;

    int index = 0;
    while (list != 0)
    {
        roster_entry_t *roster_entry = list->item;
        assert(roster_entry != 0);

        int **owner_reference = (int **)roster_entry->owner;
        int *owner_points_to = 0;
        if(owner_reference != 0)
        {
            owner_points_to = *((int **)roster_entry->owner);
        }
        int *owner_should_point_to = (int *)roster_entry->pointer;

        //printf("Checking [@%p]: %p vs %p\n", roster_entry, owner_points_to, owner_should_point_to);
        if (owner_points_to != owner_should_point_to)
        {
            //printf("|- Discarding Roster[%i] @%p\n", index, owner_should_point_to);
            list = __linked_remove(&Roster, index);
        }
        else
        {
            list = list->next;
            index++;
        }
    }

    //printf("\\---------------------/\n");
}