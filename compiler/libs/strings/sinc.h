#ifndef SINC_H
#define SINC_H

// #define ALLOC_ACCESS_ER(x) *((roster_entry_t **)((int*)(x) - 1))
// #define ALLOC_ACCESS_PT(x) *((void **)((int*)(x) - 2))
// #define ALLOC_ACCESS_USZ(x) *(((int*)(x) - 3))
// #define ALLOC_ACCESS_ASZ(x) *(((int*)(x) - 4))
// #define ALLOC_ACCESS_RT(x) *(((int*)(x)   - 5))
// #define AALOC_ACCESS_OW(x) *((void **)((int*)(x) - 6))

// for strings
#define ALLOC_ACCESS_USZ(x) *(int*)(x - 4)
#define ALLOC_ACCESS_FLG(x) *(int*)(x - 8)
#define ALLOC_ACCESS_ASZ(x) *(int*)(x - 12)

#define ALLOC_FLG_DYNAMIC 0xD1E9
#define ALLOC_FLG_STATIC  0xDA8A

void *__rc_allocate__(int, int);
void *__rc_allocate_with_tempowner__(int, int);
void __rc_requestOwnership__(void *, void *);

int sprintf(char *, const char *, ...);
int printf(const char *, ...);
//void *memcpy(void *, void *, int);
//int strlen(char*);

void exit(int);

extern int ___TEMPORARY_OWNER___;
extern int *__this__;

typedef char* fn_toString_t(void);

//const char *__PRINT_TYPE_INT__ = "%i\n";

#include <stdio.h>

#endif