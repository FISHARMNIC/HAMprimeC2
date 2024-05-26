Square format
{
    length <- u32;
    color <- p8;
}

Square initializer<u32 len, p8 col>
{
    this.length <- len;
    this.color <- col;
}

Square area method<> -> u32
{
    return # this.length * this.length;
}

Square volume method<u32 height> -> u32
{
    return # height * this.area();
}

entry function<> -> u32
{
    create myRoom <- Square<length:10,color:"blue">;
    create dadsRoom <- Square<20, "red">;
    printf_mini(myRoom.volume(5), "My room cubic feet: %i (should be 500)\n");
    printf_mini(dadsRoom.length, "Dads room square feet: %i (should be 20)\n");
}