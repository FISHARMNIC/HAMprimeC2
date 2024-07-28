List format {
    .buffer p32;

    .append method<u32 item > -> u32
    {
        realloc(this.buffer,(size(this) + 1));
        this[size(this)] = item;
    }
}

create listA -> List<>;

entry function<> -> u32
{
    listA.append(123);
}