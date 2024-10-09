D=$(dirname "$0")
mkdir -p $D/bin
gcc -m32 -c $D/strings.c   -o $D/bin/strings.o