D=$(dirname "$0")
gcc $D/../../compiled/out.s $D/../libs/garbage/bin/garbage_chunks.o $D/../libs/globals.s $D/../libs/gcollect.s $D/../libs/strings/bin/strings.o $D/../libs/garbage/bin/garbage_linked.o $D/../libs/garbage/bin/garbage_rollcall.o -o $D/../../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables -lm # -lpthread
$D/../../compiled/out "$@"