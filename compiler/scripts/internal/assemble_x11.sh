D=$(dirname "$0")
gcc $D/../../../compiled/out.s $D/../libs/strings/bin/strings.o $D/../../libs/gfx/bin/gfx.o $D/../../libs/garbage/bin/garbage_linked.o $D/../../libs/garbage/bin/garbage_rollcall.o -lX11 -o $D/../../../compiled/out -g -no-pie -m32 -fno-asynchronous-unwind-tables
$D/../../../compiled/out
#gcc $D/../../compiled/out.s -o $D/../../compiled/out.o -g -no-pie -m32 -fno-asynchronous-unwind-tables
#ld -m elf_i386 $D/../../compiled/out.o $D/../libs/gfx/bin/gfx.o -lX11 -o $D/../../compiled/out