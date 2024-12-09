#include sys files

entry function<> -> u32
{
    create myFile <- iofile("test.txt");

    myFile << "Rio is the best dog!\n" << 123 << "\nC\nHello ";
    myFile << 456789 << " Bye!"
    
    myFile.rewind();
    
    create string output;
    create u32    onum;
    create char   och;

    myFile >> output >> onum;
    myFile >> och;
    
    print_(output);
    print_(onum);
    print_(och);

    print_(myFile.getLine());

    myFile.close();

    return 0;
}