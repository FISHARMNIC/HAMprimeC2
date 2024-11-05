#include "sinc.h"

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

#include "sinc.h"

// #region conversion functions

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

char *ctos(char ch)
{
    asm volatile("pusha");
    char *o = __rc_allocate__(2, 0);
    o[1] = 0;
    o[0] = ch;
    asm volatile("popa");
    return o;
}

char *itos(int num)
{
    asm volatile("pusha");
    static char obuff[11];

    int len = sprintf(obuff, "%i\0", num) + 1;
    //printf("%i\n", len);

    char *o = __rc_allocate__(len, 0);

    o[len] = 0;
    len--;
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

// #endregion

// #region util functions

char *substr(char *src, int start, int end)
{
    asm volatile("pusha");

    int len = strlen(src);

    if (end <= start)
    {
        if (end == -1)
        {
            end = len;
        }
        else
        {
            printf("[sslice]: %i (end) is less than or equal to %i (start)\n", end, start);
            exit(0);
        }
    }

    char *buffer = __rc_allocate__(end - start + 1, 0);

    int index = start;
    int writeIndex = 0;
    while (index < end)
    {
        buffer[writeIndex] = src[index];
        writeIndex++;
        index++;
    }

    buffer[writeIndex] = 0;

    asm volatile("popa");

    return buffer;
}

char* strapp(char** src, char letter)
{
    asm volatile("pusha");

    int len = strlen(*src);
    char* dest = __rc_allocate__(len + 2, 0);
    memcpy(dest, *src, len);
    *(short*)(*src + len) = ((short) letter) << 1 | 0;
    __rc_requestOwnership__(dest, src);

    return *src;
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

// #endregion