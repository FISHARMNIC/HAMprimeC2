#include sys staticQueue

entry function<>
{
    /* issue is that it wont let you import from an imported file */
    create queue <- StaticQueue();

    queue.push(123);
    queue.push(456);
    queue.push(789);

    print_(queue.pop());
    print_(queue.pop());
    print_(queue.pop());
}