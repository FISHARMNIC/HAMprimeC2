#ifndef CHUNKS_H
#define CHUNKS_H

#include "linked.h"
#include "rollcall.h"

void __rc_enterChunk__();
void __rc_exitChunk__(int ** old_frame_ebp, int ** old_frame_esp);

#define MAX_PREALLOCED_CHUNKS 2048

#endif