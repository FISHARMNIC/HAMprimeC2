Shape format
{
    .area method<> -> u32
    {
        return 0;
    }
}

Rectangle format overloads Shape
{
    .width  u32;
    .height u32;

    .area method<> -> u32
    {
        return(this.width * this.height);
    }
}

entry function<> -> u32
{
    create someShape <- Shape<>;

    someShape <- Rectangle<width:10,height:10>;

    // NOT COMPILE TIME, checks ptr to see if its storing a parent property.
    someShape.area();

}