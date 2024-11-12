D=$(dirname "$0")
mkdir -p $D/bin
gcc -O2 -Werror -Wall -m32 -c $D/linked.c   -o $D/bin/garbage_linked.o -g
gcc -O2 -Werror -Wall -m32 -c $D/rollcall.c -o $D/bin/garbage_rollcall.o -g