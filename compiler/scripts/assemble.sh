D=$(dirname "$0")
gcc $D/../../compiled/out.s $D/../libs/globals.s $D/../libs/gcollect.s $D/../libs/strings/bin/strings.o $D/../libs/garbage/bin/garbage_linked.o $D/../libs/garbage/bin/garbage_rollcall.o $D/../libs/garbage/bin/garbage_chunks.o -o $D/../../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables # -lpthread
time $D/../../compiled/out "$@"