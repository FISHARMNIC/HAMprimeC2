// forward move function<any buff, any arr, u32 bSize>;

entry function<> -> u32
{
    create arr <- u32[3];
    arr[0] <- 1;
    arr[1] <- 2;
    arr[2] <- 3;

    /*
        todo, implement this function in assembly.
            Third arg should be automatically passed by the compiler
            Indicates size of elements

        Move should:
            1. Attempt ownership transfer to first arg
            2. Copy buffer from first arg to second arg
            3. Return second arg
    */

    // [0] getting corrupted. And maybe make it easier to grow arrs?
    arr <- copy(u32[4], arr);

    printf("%i %i %i\n", arr[0], arr[1], arr[2]);
}