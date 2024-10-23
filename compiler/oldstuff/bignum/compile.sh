D=$(dirname "$0")
mkdir -p $D/bin
gcc -m32 -c $D/bignum.c -o $D/bin/bignum.o