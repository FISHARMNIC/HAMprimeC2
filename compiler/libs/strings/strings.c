#include "sinc.h"
#include "stringUtil.c"

char *__rc_allocate_str__(int slen)
{
    int alen = slen << 2;
    char* allocation = __rc_allocate_with_tempowner__(alen, 0);
    //printf("::%d\n", ALLOC_ACCESS_SZ(allocation));

    return allocation;
}

char *strjoinmany(int numberOfStrings, ...)
{
    asm volatile("pusha");
    // printf("STRING JOIN %i\n", numberOfStrings);
    char **stringsbase = (char **)(&numberOfStrings + 1);

    int neededAllocSize = 0;
    int givenAllocSize = 0;
    char* givenAllocPtr = 0;

    int i = 0;
    for (; i < numberOfStrings; i++)
    {
        // printf("LENGTHING %i\n", i);
        // fflush(stdout);
        char *str = stringsbase[i];
        int strsz   = ALLOC_ACCESS_USZ(str);
        int strtype = ALLOC_ACCESS_FLG(str);

        printf("\t%10s uses: %i\n", str, strsz);
        if(strtype == ALLOC_FLG_DYNAMIC)
        {
            int allocsz = ALLOC_ACCESS_ASZ(str);
            if(allocsz > givenAllocSize)
            {
                givenAllocSize = allocsz;
                givenAllocPtr = str;
            }
            neededAllocSize += strsz;
            printf("\t\t  > has: %i\n", allocsz);
        }
        else if(strtype == ALLOC_FLG_STATIC)
        {
            neededAllocSize += strsz;
        }
        else
        {
            printf("[STRINGS ERROR] Bad type flag, got %x\n", strtype);
        }
    }

    printf("-- needed space is: %i\n", neededAllocSize);
    printf("-- given  space is: %i\n", givenAllocSize);

    char *allocatedBuffer;
    if(givenAllocSize > neededAllocSize)
    {
        allocatedBuffer = givenAllocPtr;
    }
    else
    {
        allocatedBuffer = __rc_allocate__(neededAllocSize + 1, 0);
    }
    char *allocatedBufferOrigin = allocatedBuffer;

    for (i = 0; i < numberOfStrings; i++)
    {
        char *wp = stringsbase[i];
        int sz = ALLOC_ACCESS_USZ(wp) - 1;
        printf(">>> copying: %s %i\n", wp, sz);
        fflush(stdout);
        allocatedBuffer = memcpy(allocatedBuffer, wp, sz);
        allocatedBuffer += sz;
    }
    *allocatedBuffer = 0;
    printf("concat: %s\n", allocatedBufferOrigin);

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
    char *o = __rc_allocate_str__(len);
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
    char *o = __rc_allocate_str__(2);
    o[0] = ch;
    o[1] = 0;
    asm volatile("popa");
    return o;
}

char *itos(int num)
{
    asm volatile("pusha");
    static char obuff[11];

    int len = sprintf(obuff, "%i", num); // remove \0. doesnt do anything
    //printf("%i\n", len);

    char *o = __rc_allocate_str__(len);

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
    int strlen = *((int*)(str) - 1); // length is stored in int right before str
    char *o = __rc_allocate_str__(strlen);
    memcpy(o, (char *)str, strlen);
    asm volatile("popa");
    return o;
}

char *__sinc_loadStringArray(char* destArr, int numberOfStrings, ...)
{
    asm volatile("pusha");

    char **sourceStrings = (char **)(&numberOfStrings + 1);

    for(int i = 0; i < numberOfStrings; i++)
    {
        char* string = sourceStrings[numberOfStrings - 1 - i];
        //printf("--- %s --> %i\n", string, 4 * i);
        int strlen = *(((int *)string) - 1); // length is stored in int right before str
        char *o = __rc_allocate_str__(strlen);
        memcpy(o, string, strlen);
        __rc_requestOwnership__(o, destArr + (4 * i));
    }

    asm volatile("popa");
    return destArr;
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
        printf("[%i]\n", arr[0]);
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

// todo, I think in the future just pass type as param
void print_arrf32(int size, float *arr)
{
    size /= 4;

    if (size == 0)
    {
        printf("[]\n");
        return;
    }
    else if (size == 1)
    {
        printf("[%f]\n", arr[0]);
        return;
    }

    printf("[%f,", arr[0]);
    int i = 1;
    for (; i < size - 1; i++)
    {
        printf("%f,", arr[i]);
    }
    printf("%f]\n", arr[i]);
}

// todo later just pass a %i, %f, etc
void print_stringArr(int size, char **arr)
{
    size /= 4;
    //printf("buffer: %p -- size: %i\n\n", arr, size);

    if (size == 0)
    {
        printf("[]\n");
        return;
    }
    else if (size == 1)
    {
        printf("[\"%s\"]\n", arr[0]);
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
        printf("[%i]\n", arr[0]);
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