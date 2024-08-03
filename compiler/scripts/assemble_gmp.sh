D=$(dirname "$0")

gcc $D/../../compiled/out.s $D/../libs/bignum/bin/bignum.o -lgmp -o $D/../../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables
$D/../../compiled/out