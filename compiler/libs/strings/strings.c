void *__rc_allocate__(int, int);
int sprintf(char*, const char*, ...);

// BSD strlen implementation
int strlen(char *str)
{
    char *s;
    for (s = str; *s; ++s);
    return (s - str);
}

char* strjoinmany(int numberOfStrings, ...)
{
    asm volatile("pusha");
    char** stringsbase = (char**)(&numberOfStrings + 1);
    int totalAllocationSize = 0;

    int i = 0;
    for(; i < numberOfStrings; i++)
    {
        totalAllocationSize += strlen(stringsbase[i]);
    }

    char* allocatedBufferOrigin = __rc_allocate__(totalAllocationSize + 1, 0);
    char* allocatedBuffer = allocatedBufferOrigin;

    for(i = 0; i < numberOfStrings; i++)
    {
        char* wp = stringsbase[i];
        //printf("adding: %s\n", stringsbase[i]);
        while(*wp != 0)
        {
            *allocatedBuffer = *wp;
            allocatedBuffer++;
            wp++;
        }
    }
    *allocatedBuffer = 0;
    //printf("concat: %s\n", allocatedBufferOrigin);

    asm volatile("popa");
    return allocatedBufferOrigin;
}

char* ftos(float num)
{
    static char obuff[35];
    int len = sprintf(obuff, "%f", num) + 1;
    char* o = __rc_allocate__(len, 0);
    while(len >= 0)
    {
        o[len] = obuff[len];
        len--;
    }
    return o;
}

char* itos(int num)
{
    static char obuff[11];
    int len = sprintf(obuff, "%i", num) + 1;
    char* o = __rc_allocate__(len, 0);
    while(len >= 0)
    {
        o[len] = obuff[len];
        len--;
    }
    return o;
}