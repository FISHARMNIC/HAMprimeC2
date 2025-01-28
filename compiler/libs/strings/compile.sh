D=$(dirname "$0")
mkdir -p $D/bin
gcc -O0 -Wall -Wextra -m32 -c $D/strings.c -o $D/bin/strings.o