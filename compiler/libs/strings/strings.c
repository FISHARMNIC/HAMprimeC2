void *__rc_allocate__(int, int);
void *__rc_allocate_with_tempowner__(int, int);

int sprintf(char *, const char *, ...);
int printf(const char *, ...);
void *memcpy(void *, void *, int);
extern int ___TEMPORARY_OWNER___;
extern int *__this__;

typedef char* fn_toString_t(void);

//const char *__PRINT_TYPE_INT__ = "%i\n";


#include <stdio.h>

// BSD strlen implementation
int strlen(char *str)
{
    char *s;
    for (s = str; *s; ++s)
        ;
    return (s - str);
}

char *strjoinmany(int numberOfStrings, ...)
{
    asm volatile("pusha");
    // printf("STRING JOIN %i\n", numberOfStrings);
    char **stringsbase = (char **)(&numberOfStrings + 1);
    int totalAllocationSize = 0;

    int i = 0;
    for (; i < numberOfStrings; i++)
    {
        // printf("LENGTHING %i\n", i);
        // fflush(stdout);
        totalAllocationSize += strlen(stringsbase[i]);
        // printf("\t%i\n", totalAllocationSize);
    }

    // printf("STRJOIN ALLOCATING\n");
    char *allocatedBufferOrigin = __rc_allocate__(totalAllocationSize + 1, 0);
    // printf("ALLOCATED\n");
    // fflush(stdout);
    char *allocatedBuffer = allocatedBufferOrigin;

    for (i = 0; i < numberOfStrings; i++)
    {
        char *wp = stringsbase[i];
        //printf("adding: %s\n", stringsbase[i]);
        while (*wp != 0)
        {
            *allocatedBuffer = *wp;
            allocatedBuffer++;
            wp++;
        }
    }
    *allocatedBuffer = 0;
    // printf("concat: %s\n", allocatedBufferOrigin);

    asm volatile("popa");
    return allocatedBufferOrigin;
}

char *ftos(float num)
{
    asm volatile("pusha");
    static char obuff[35];
    int len = sprintf(obuff, "%f", num) + 1;
    char *o = __rc_allocate__(len, 0);
    while (len >= 0)
    {
        o[len] = obuff[len];
        len--;
    }
    asm volatile("popa");
    return o;
}

void __rc_requestOwnership__(void *, void *);

char *itos(int num)
{
    asm volatile("pusha");
    static char obuff[11];
    int len = sprintf(obuff, "%i", num) + 1;
    // printf("SPRINTED %s\n", obuff);

    char *o = __rc_allocate__(len, 0);
    while (len >= 0)
    {
        o[len] = obuff[len];
        len--;
        // printf("MOVING\n");
    }
    //__rc_requestOwnership__(o, &___TEMPORARY_OWNER___);
    // printf("RETURNING %s\n", o);
    asm volatile("popa");
    return o;
}

char *cptos(const char *str)
{
    asm volatile("pusha");
    int strlen = *(((int *)str) - 1); // length is stored in int right before str
    char *o = __rc_allocate_with_tempowner__(strlen, 0);
    memcpy(o, (char *)str, strlen);
    asm volatile("popa");
    return o;
}

void print_arr32(int size, int *arr)
{
    size /= 4;

    if (size == 0)
    {
        printf("[]\n");
        return;
    }
    else if (size == 1)
    {
        printf("[%i]\n");
        return;
    }

    printf("[%i,", arr[0]);
    int i = 1;
    for (; i < size - 1; i++)
    {
        printf("%i,", arr[i]);
    }
    printf("%i]\n", arr[i]);
}

void print_arr16(int size, short *arr)
{
    size /= 2;

    if (size == 0)
    {
        printf("[]\n");
        return;
    }
    else if (size == 1)
    {
        printf("[%i]\n");
        return;
    }

    printf("[%i,", arr[0]);
    int i = 1;
    for (; i < size - 1; i++)
    {
        printf("%i,", arr[i]);
    }
    printf("%i]\n", arr[i]);
}

void print_float_noPromo(float f)
{
    printf("%f\n", f);
}

void print_formatArr(fn_toString_t * toStringFn, int size, int **arr)
{
    size /= 4;

    // if (size == 0)
    // {
    //     printf("[]\n");
    //     return;
    // }
    // else if (size == 1)
    // {
    //     // todo
    //     printf("[%i]\n");
    //     return;
    // }

    __this__ = arr[0];
    printf("[%p,", toStringFn());
    // int i = 1;
    // for (; i < size - 1; i++)
    // {
    //     printf("%i,", arr[i]);
    // }
    // printf("%i]\n", arr[i]);
}