D=$(dirname "$0")
mkdir -p $D/bin
gcc -O2 -Werror -Wall -Wextra -m32 -c $D/linked.c   -o $D/bin/garbage_linked.o -g
gcc -O2 -Werror -Wall -Wextra -m32 -c $D/rollcall.c -o $D/bin/garbage_rollcall.o -g
gcc -O2 -Werror -Wall -Wextra -m32 -c $D/chunks.c -o $D/bin/garbage_chunks.o -g
# gcc -O2 -Werror -Wall -Wextra -m32 -c -S $D/rollcall.c -o $D/bin/rollcall_asmdbg_broken.s -g