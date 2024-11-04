forward fopen  function<string name, conststr perms> -> p32;
forward fclose function<p32 fp> -> none;
forward fwrite function<string buffer, u32 size, u32 count, p32 fp> -> u32;
forward fgets  function<string str, u32 count, p32 fp> -> string;
forward fscanf function<p32 fp, conststr fmtstr, ...> -> u32;
forward fgetc  function<p32 fp> -> u8;
forward rewind function<p32 fp> -> none;
forward fseek  function<p32 fp, u32 offset, u32 whence> -> u32;

iofile format
{
    .fptr p32;

    .iofile constructor<>
    {
        this.fptr <- 0;
    }

    .iofile constructor<conststr name>
    {
        this.fptr <- fopen(name, "r+");
    }

    .open method<conststr name>
    {
        this.fptr <- fopen(name, "r+");
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

    .iofile operator(shl)<string buffer> -> iofile
    {
        this.write(buffer);
        return this;
    }

    .getTo method<u8 character> -> string
    {
        create outString <- "";

        create curChar <- fgetc(this.fptr);
        while(curChar != character)
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

    .iofile operator(shr)<string buffer> -> iofile
    {
        buffer <- this.getLine();
        return this;
    }

}

entry function<> -> u32
{
    create myFile <- iofile("test.txt");
    myFile << "Hello, World! \n" << "Rio is the best dog";
    
    myFile.rewind();
    
    create string output;
    myFile >> output;

    print_(output);
}