#include "sinc.h"
#include "stringUtil.c"

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
        // printf("adding: %s\n", stringsbase[i]);
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


/*
TODO, a function that tries using a pre allocated buffer until it maxes out
    - then it counts the size of the remaining strings
    - allocates dynamic for all
    - copies current
    - copies rest
*/
/*
char *optimized_strjoinmany(int numberOfStrings, ...)
{
    
    asm volatile("pusha");

    static tempBuffer[100];

    char **stringsbase = (char **)(&numberOfStrings + 1);



    asm volatile("popa"); 
}
*/

// #region conversion functions

char *ftos(float num)
{
    asm volatile("pusha");
    static char obuff[35];
    int len = sprintf(obuff, "%f", num);
    char *o = __rc_allocate__(len, 0);
    while (len >= 0)
    {
        o[len] = obuff[len];
        len--;
    }
    asm volatile("popa");
    return o;
}

char *ctos(char ch)
{
    asm volatile("pusha");
    char *o = __rc_allocate__(2, 0);
    o[0] = ch;
    o[1] = 0;
    asm volatile("popa");
    return o;
}

char *itos(int num)
{
    asm volatile("pusha");
    static char obuff[11];

    int len = sprintf(obuff, "%i\0", num);
    //printf("%i\n", len);

    char *o = __rc_allocate__(len, 0);

    while (len >= 0)
    {
        o[len] = obuff[len];
        len--;
        //printf("MOVING [%i] %i\n", len + 1, o[len + 1]);
    }
    //__rc_requestOwnership__(o, &___TEMPORARY_OWNER___);
    //printf("RETURNING %s\n", o);
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

// First there are X number of sources
// Then there are X numbero of destinations
// TODO
char *__sinc_loadStringArray(char* destArr, int numberOfStrings, ...)
{
    asm volatile("pusha");

    char **sourceStrings = (char **)(&numberOfStrings + 1);

    for(int i = 0; i < numberOfStrings; i++)
    {
        char* string = sourceStrings[numberOfStrings - 1 - i];
        // printf("--- %s --> %i\n", string, 4 * i);
        int strlen = *(((int *)string) - 1); // length is stored in int right before str
        char *o = __rc_allocate__(strlen, 0);
        memcpy(o, string, strlen);
        __rc_requestOwnership__(o, destArr + (4 * i));
    }

    asm volatile("popa");
}

// #endregion

// #region print functions

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

// todo later just pass a %i, %f, etc
void print_stringArr(int size, int *arr)
{
    size /= 4;

    if (size == 0)
    {
        printf("[]\n");
        return;
    }
    else if (size == 1)
    {
        printf("[\"%s\"]\n");
        return;
    }

    printf("[\n   \"%s\",\n", arr[0]);
    int i = 1;
    for (; i < size - 1; i++)
    {
        printf("   \"%s\",\n", arr[i]);
    }
    printf("   \"%s\"\n]\n", arr[i]);
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

void print_formatArr(fn_toString_t *toStringFn, int size, int **arr)
{
    size /= 4;

    __this__ = arr[0];

    if (size == 0)
    {
        printf("[]\n");
        return;
    }
    else if (size == 1)
    {
        // todo
        printf("[%s]\n", toStringFn());
        return;
    }
    else
    {
        printf("[\n   %s,", toStringFn());
        int i = 1;
        for (; i < size - 1; i++)
        {
            __this__ = arr[i];
            printf("\n   %s,", toStringFn());
        }
        __this__ = arr[i];
        printf("\n   %s\n]\n", toStringFn());
    }
}

// #endregion