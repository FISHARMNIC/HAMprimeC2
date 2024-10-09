/* Assumes same methods in main list file */

List format
{
    .buffer array;

    .List operator(+)<u32 rhs> -> List
    {
        create new <- duplicate(this);
        new.push(rhs);
        return new;
    }

    .List operator(+)<List rhs> -> List
    {
        /* join the two buffers */
    }

    .List operator(set_index)<int index, int value> -> List
    {
        this.buffer[index] <- value;
    }

    .List operator(get_index)<List rhs> -> List
    {
        /* join the two buffers */
    }
}