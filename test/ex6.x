create arrGlobal <- {1,2,9, "chicken"};

entry function<> -> u32
{
create arr <- {4,3,1};
printf("%i %i %i\n", (arr + 8)[0], arrGlobal[1], arr[arrGlobal[0]]);

// this breaks it? Math modifies eax and then some reason we try to access on line 70
// printf("%i %i %i %s\n", (arr + 8)[0], arrGlobal[1], arr[arrGlobal[0]], arrGlobal[1 + 2]);
}