/* Assumes same methods in main list file */

List format
{
    .buffer array;

    .List operator("+")<u32 rhs> -> List
    {
        this.push(rhs);
        return this;
    }

    .List operator("+")<List rhs> -> List
    {
        /* join the two buffers */
    }

    .List operator("set-index")<int index, int value> -> List
    {
        this.buffer[index] <- value;
    }

    .List operator("get-index")<List rhs> -> List
    {
        /* join the two buffers */
    }
}