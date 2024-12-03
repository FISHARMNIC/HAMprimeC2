#ifndef SINC_H
#define SINC_H

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