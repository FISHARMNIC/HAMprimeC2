#include "sinc.h"
#include <string.h>
#include <assert.h>

void quit(int code); // move to sinc.h

char *substr(char *src, int start, int end)
{
    assert(src != 0);

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
            quit(0);
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

    return buffer;
}

char* strpush(char** src, char letter)
{
    int len = strlen(*src);
    char* dest = __rc_allocate__(len + 2, 0);
    memcpy(dest, *src, len);
    dest[len] = letter;
    dest[len + 1] = 0;
    __rc_requestOwnership__(dest, src);
    *src = dest;

    return dest;
}

char strpop(char** src)
{
    int len = strlen(*src);
    char* dest = __rc_allocate__(len, 0);
    char last = (*src)[len - 1];
    memcpy(dest, *src, len - 1);
    dest[len] = 0;

    __rc_requestOwnership__(dest, src);
    *src = dest;

    return last;
}

char** strtoarr(char* str)
{
    /* hasn't been checked yet, and no prototype in strings.xh */
    assert(str != 0);

    int len = strlen(str);
    char** allocedArr = __rc_allocate__(sizeof(char*) * len, 0);

    for(int chnum = 0; chnum < len; chnum++)
    {
        char* singleStr = __rc_allocate__(2,0);

	 singleStr[0] = str[chnum];
        singleStr[1] = 0;

        allocatedArr[chnum] = singleStr;
    }

    return allocedArr;
}

int strcount(char* str, char ch)
{
    assert(str != 0);

    int count = 0;
    while(*str != 0)
    {
        if(*str == ch)
        {
            count++;
        }
        str++;
    }

    return count;
}

char** strsplitchr(char* str, char delim)
{
    assert(str != 0);

    int count = strcount(str, delim) + 1;
    char** allocedArr = __rc_allocate__(sizeof(char*) * count, 0);

    int index = 0; 

    int notFinished = 1;
    while(notFinished)
    {

        char* end;
        if(index == count - 1)
        {
            end = strchr(str, 0);
            notFinished = 0;
        }
        else
        {
            end = strchr(str, delim);
        }

        int subLen = end - str;

        allocedArr[index++] = substr(str, 0, subLen);
        str += subLen + 1;
    }

    return allocedArr;
}

char* strinsert(char* dest, char* intermediate, int insertIndex)
{
    assert(dest != 0 && intermediate != 0 && insertIndex >= 0);
    int atIndex = 0;

    int destlen = strlen(dest);
    int interlen = strlen(intermediate);

    char* outbuf = __rc_allocate__(destlen + interlen, 0);

    memcpy(outbuf, dest, insertIndex);
    memcpy(&outbuf[insertIndex], intermediate, interlen);
    memcpy(&outbuf[insertIndex + interlen], &dest[insertIndex], destlen - insertIndex);

    return outbuf;
}

char* strjoin(char* first, char* second)
{
    assert(first != 0 && second != 0);

    int firlen = strlen(first);
    int seclen = strlen(second);

    char* outbuf = __rc_allocate__(firlen + seclen, 0);

    memcpy(outbuf, first, firlen);
    memcpy(&outbuf[firlen], second, seclen + 1);

    return outbuf;

}