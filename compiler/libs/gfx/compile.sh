D=$(dirname "$0")
mkdir -p $D/bin
gcc -m32 -c $D/gfx.c -o $D/bin/gfx.o