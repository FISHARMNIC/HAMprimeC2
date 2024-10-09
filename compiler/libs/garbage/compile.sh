D=$(dirname "$0")
mkdir -p $D/bin
gcc -m32 -c $D/linked.c   -o $D/bin/garbage_linked.o
gcc -m32 -c $D/rollcall.c -o $D/bin/garbage_rollcall.o