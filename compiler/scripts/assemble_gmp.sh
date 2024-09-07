D=$(dirname "$0")

gcc $D/../../compiled/out.s $D/../libs/strings/bin/strings.o $D/../libs/bignum/bin/bignum.o $D/../libs/garbage/bin/garbage_linked.o $D/../libs/garbage/bin/garbage_rollcall.o -lgmp -o $D/../../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables
$D/../../compiled/out