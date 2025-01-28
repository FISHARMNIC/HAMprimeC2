#include sys cfiles

iofile format
{
    .fptr p32;

    .iofile constructor<conststr name>
    {
        this.fptr <- fopen(name, "wb+");
        printf("testing: %p\n", this.fptr);
    }

    .isOpen method<> -> u8
    {
        return(this.fptr != 0);
    }
}

entry function<> -> u32
{
    create myFile <- iofile("test.txt");

    printf("MYFILE IS::::: %p\n", myFile);
    if(myFile.isOpen() == 0)
    {
        print_("Could not open file!");
        quit(1);
    }

    return 0;
}