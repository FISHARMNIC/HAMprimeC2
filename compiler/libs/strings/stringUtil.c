#include "sinc.h"

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
            printf("[substr]: %i (end) is less than or equal to %i (start)\n", end, start);
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

char* strpush(char** src, char letter)
{
    asm volatile("pusha");

    int len = strlen(*src);
    char* dest = __rc_allocate__(len + 2, 0);
    memcpy(dest, *src, len);
    dest[len] = letter;
    dest[len + 1] = 0;
    __rc_requestOwnership__(dest, src);
    *src = dest;

    return dest;
    asm volatile("popa");
}

char strpop(char** src)
{
    asm volatile("pusha");

    int len = strlen(*src);
    char* dest = __rc_allocate__(len, 0);
    char last = (*src)[len - 1];
    memcpy(dest, *src, len - 1);
    dest[len] = 0;

    __rc_requestOwnership__(dest, src);
    *src = dest;

    return last;
    asm volatile("popa");
}