#include sys cfiles

iofile format
{
    .fptr p32;

    .iofile constructor<>
    {
        this.fptr <- 0;
    }

    .iofile constructor<conststr name>
    {
        this.fptr <- fopen(name, "wb+");
    }

    .open method<conststr name>
    {
        this.fptr <- fopen(name, "wb+");
    }

    .openMode method<conststr name, conststr mode>
    {
        this.fptr <- fopen(name, mode);
    }

    .isOpen method<> -> u8
    {
        return(this.fptr != 0);
    }

    .close method<> -> none
    {
        fclose(this.fptr);
    }

    .rewind method<> -> none
    {
        rewind(this.fptr);
    }

    .seekg method<u32 address> -> u32
    {
        return(fseek(this.fptr, address, 0));
    }

    .write method<string buffer> -> none
    {
        fwrite(buffer, 1, strlen(buffer), this.fptr);
    }

    .getTo method<u8 ch> -> string
    {
        create outString <- "";

        create curChar <- fgetc(this.fptr);
        while((curChar != ch) && (curChar != -1))
        {
            outString <- outString + curChar;
            curChar <- fgetc(this.fptr);
        }

        return outString;
    }

    .getLine method<> -> string
    {
        return(this.getTo(10));
    }

    .iofile operator(shl)<string buffer> -> iofile
    {
        this.write(buffer);
        return this;
    }

    .iofile operator(shl)<u32 number> -> iofile
    {
        this.write(itos(number));
        return this;
    }

    .iofile operator(shr)<string:reference buffer> -> iofile
    {
        buffer <- this.getLine();
        return this;
    }

    .iofile operator(shr)<u32:reference outnum> -> iofile
    {
        create joe <- this.getLine();
        outnum <- atoi(joe);
        return this;
    }

    .iofile operator(shr)<char:reference outch> -> iofile
    {
        outch <- char:(this.getLine()[0]);
        return this;
    }

}

entry function<> -> u32
{
    create myFile <- iofile("test.txt");

    if(myFile.isOpen() == 0)
    {
        print_("Could not open file!");
        quit(1);
    }

    myFile << "Rio is the best dog!\n" << 123 << "\nC\nHello ";
    myFile << 456789 << " Bye!"
    
    myFile.rewind();
    
    create string output;
    create u32    onum;
    create char   och;

    myFile >> output >> onum;
    myFile >> och;
    
    print_(`Read 1: ${output}`);
    print_(`Read 2: ${onum}`);
    print_(`Read 3: ${och}`);

    print_(myFile.getLine());

    myFile.close();

    return 0;
}