D=$(dirname "$0")

gcc $D/../../compiled/out.s -o $D/../../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables # -lpthread
$D/../../compiled/out