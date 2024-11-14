#ifndef RC_H

#define RC_H

#include <assert.h>
#include <string.h>

#define FALSE (0)
#define TRUE (1)

#define BYTES_PER_GC   4096 // For testing use like 32. Should be 128
#define BYTES_FORCE_GC 65536

#ifdef _DEBUG
#define dbgprint(...)  printf(__VA_ARGS__);
#else
#define dbgprint(...)  
#endif

/// @brief Allocate data that can be automatically freed by the garbage collector
/// @param size_bytes Bytes to be allocated
/// @param restricted Restrict ownership
/// @return Pointer to allocated data
void *__rc_allocate__(int size_bytes, int restricted);

/// @brief Allocate data but give it a temporary owner so that it does not get freed 
/// @attention This is only meant to be used for cases where you are assigning an owner 
/// almost immediatley after, but there might be a collection somewhere between those lines.
/// This *CANNOT* serve as a permanent owner for any allocation
/// @param size_bytes Bytes to be allocated
/// @param restricted Restrict ownership
/// @return Pointer to allocated data
void *__rc_allocate_with_tempowner__(int size_bytes, int restricted);

/// @brief Free all garbage data
void __rc_collect__();

/// @brief Free all allocated data regardless of if it's garbage or not
void __rc_free_all__();

/// @brief 
/// @param dest Memory address of destination
/// @param src  Source pointer
/// @return destination
int* __copydata__(int* dest, int* src);

/// @brief Allocates a new buffer and copies the source buffer into the new one
/// @param src buffer to be duplicated
/// @return new duplicated buffer
int* __duplicate__(int* src);

/// @brief Request owner
/// @param allocation pointer to allocated data
/// @param newOwner address of the new owner
void __rc_requestOwnership__(void* allocation, void* newOwner);

/// @brief Similar to exit(code) but frees all allocated data first
/// @param code exit code
void quit(int code);

extern int ___TEMPORARY_OWNER___;

typedef struct roster_entry_t
{
    void *owner;
    int restricted;
    int size;
    void *pointer;
} roster_entry_t;

typedef struct described_buffer_t
{
    // This struct doesn't have a defined size as the size of data varies
    roster_entry_t *entry_reference;
    int data[]; // This is NOT a pointer. the actual data exists right here
} described_buffer_t;

#define likely(c) __builtin_expect((c), 1)
#define unlikely(c) __builtin_expect((c), 0)

#endif