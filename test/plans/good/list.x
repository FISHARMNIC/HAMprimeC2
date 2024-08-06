List format {
    __rule DynamicArraysAllocateSize false;

    .buffer p32;
    .size;

    .append method<u32 item> -> u32
    {
        realloc(this.buffer,(size(this) + 1));
        this[size(this)] = item;
    }

    __rule DynamicArraysAllocateSize true;
}

create listA -> List<>;

entry function<> -> u32
{
    listA.append(123);
}