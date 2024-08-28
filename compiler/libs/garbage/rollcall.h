#ifndef RC_H
#define RC_H

#include <assert.h>

#define FALSE (0)
#define TRUE (1)

void *__rc_allocate__(int, int);
void __rc_collect__();

typedef struct roster_entry_t
{
    void *owner;
    int restricted;
    int size;
    void *pointer;
} roster_entry_t;

typedef struct described_buffer_t
{
    roster_entry_t *entry_reference;
    int data[]; // Here exists the array of data
} described_buffer_t;

#define rc_requestOwnership(_owner, _buffer, _type)                         \
    {                                                                       \
        char *temp = (char *)_buffer;                                       \
        roster_entry_t *entry_reference = *((roster_entry_t **)(temp - 4)); \
        if (entry_reference->owner != 0)                                    \
            assert(!entry_reference->restricted);                           \
        entry_reference->owner = (void *)&_owner;                           \
        *(&_owner) = (_type)temp;                                           \
    }

#define rc_create(_type, _owner, _size, _restricted) \
    _type _owner;                                    \
    rc_requestOwnership(_owner, rc_allocate(_size, _restricted), _type);

#endif