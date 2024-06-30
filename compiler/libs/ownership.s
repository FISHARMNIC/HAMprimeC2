/*
UNFINISHED
Memory Ownership Table
======================
Nicolas Quijano 2024

The MOT is a special protocol that can be used to automatically dispose leaked memory
    * Each allocated block is added to a list
    * Each allocated block must be "owned" by something, like a pointer
    * Any un-owned memory can be discarded at any time
    * Memory can be "disowned" for automatic discarding

Each allocation that was made using __OWNERSHIP_allocate__:
    Contains the following:
        u32 @ -8: Has owner? | boolean
        u32 @ -4: Allocated length (in entries)
    Adds a new entry to the MOT
        Entry is
            u32 @ 0: a pointer to (address - 8)
            u32 @ 4: a pointer to next entry
*/
.data

# Pointer to beginning of circular linked-list
# Once the MOT has been used, this no longer points to the beginning, and can point to any address in the list
__MOT_address__: .4byte 0

.text

.macro __OWNERSHIP_throw_conflict_MACRO__
    # Todo. For now it just purposely segfaults
    # Should just throw an error saying that the data already has an owner and needs to be disowned
    # Should stop the program
    mov %eax, 0
.endm

// #region MOT
# __MOT_setup_ function(u32 starting_entry_count) -> u32 (address: MOT)
# sets up the MOT with starting_entry_count entries
# Returns allocated address which is also now in __MOT_address__
__MOT_setup__:
    push %ebp
    mov %esp, %ebp

    # beginning allocation size
    mov 8(%esp), %eax
    mov %eax, %ebx 

    # must be at least five entries long
    cmp $5, %ebx
    jge 0f
        mov $-1, %eax
        mov %ebp, %esp
        pop %ebp
        ret
    0f:

    dec %ebx       # ebx: size in entries - 1
    shl $3, %eax   # eax: size in bytes
    #   each entry has 8 bytes
    #       +0 address   (.addr)
    #       +4 next link (.next)
    
    # save: size - 1
    push %ebx
    
    # alloc MOT with starting size
    # while the MOT is a linked-list, the starting size can be allocated all at once
    push %eax
    call __allocate__
    add $4, %esp
    mov %eax, __MOT_address__

    # restore: size - 1
    pop %ebx

    1:
        mov %eax, %ecx 
        # mov next address into .next
        add $8, %ecx
        mov %ecx, 4(%eax)
        # advance to next one
        mov %ecx, %eax
        # check if this was the last one
        dec %ebx
        jnz 1b

    # link back to the beginning
    mov %eax, %ebx
    mov __MOT_address__, %eax
    mov %eax, 4(%ebx)

    # return in eax, __MOT_address__
    mov %ebp, %esp
    pop %ebp
    ret

# __MOT_grow__ function() -> u32 (address: new entry)
# grows the MOT by one entry
# returns the address of the new entry
__MOT_grow__:
    push %ebp
    mov %esp, %ebp

    # allocate new entry
    pushl $8
    call __allocate__
    add $4, %esp

    mov __MOT_address__, %ebx
    # save .next
    mov 4(%ebx), %ecx

    # redirect .next to new block
    mov %eax, 4(%ebx)

    # new.next = old .next
    mov %ecx, 4(%eax)

    # returns eax: new block
    mov %ebp, %esp
    pop %ebp
    ret
#
__MOT_purge__:
    push %ebp
    mov %esp, %ebp

    # set starting address
    mov __MOT_address__, %eax

    # access metadata of entry
    mov (%eax), %ebx
    mov (%ebx), %ebx

    cmp $0, %ebx
    jne 0f
        # here, connect last reference with next
    0:

    mov %ebp, %esp
    pop %ebp
    ret

// #endregion


// #region threading
testFN:
    push %ebp
    mov %esp, %ebp

    mov $0, %eax

    mov %ebp, %esp
    pop %ebp
    ret

__thread_clone__:
    push %ebp
    mov %esp, %ebp

    # pthread_t thread
    sub $4, %esp
    mov %esp, %eax

    pushl $0
    pushl $testFN
    pushl $0
    pushl %eax
    call pthread_create

    push $0
    call pthread_exit

    mov %ebp, %esp
    pop %ebp
// #endregion


// #region ownership

__OWNERSHIP_append_ACONV__:
    #address in eax

    ret

# Allocates data that requires owners
__OWNERSHIP_allocate__: # expects one parameter
    push %ebp
    mov %esp, %ebp
    mov 8(%ebp), %ecx # size
    add $8, %ecx # Needs 2 more entries (metadata)
        # 1: Has owner
        # 2: Allocated length

    # allocation
    push %ecx
    push %ebp 
    mov $192, %eax    # mmap2
    xor %ebx, %ebx    # find own spot
    mov $0x7, %edx    # protection: PROT_READ|PROT_WRITE|PROT_EXEC
    mov $0x22, %esi   # flags: MAP_PRIVATE|MAP_ANONYMOUS
    mov $-1, %edi     # fd
    xor %ebp, %ebp    # offset
    int $0x80
    pop %ebp
    pop %ecx
    # allocated address in eax

    # store owner (none) and length
    movl $0, (%eax)
    mov %ecx, 4(%eax)

    # append new address to MOT
    call __OWNERSHIP_append_ACONV__


    # here.....

    # "hide" metadata by returning data in front of it
    add $8, %eax

    mov %ebp, %esp
    pop %ebp
    ret

# Request ownership/disownership of data
__OWNERSHIP_request_transfer__: # expects two parameters
    /*
    Parameters:
         8(%esp): Address
        12(%esp): Transfer type
            if 1, request ownership. If there already is an owner, then throw error
            if 0, request disown. If no owner, then throw error
    */
    push %ebp
    mov %esp, %ebp

    # ownership request type (see above)
    mov 12(%esp), %ecx

    # get metadata:ownership from parameter
    mov 8(%esp), %eax
    mov -8(%eax), %ebx

    # If the data is already owned, and we are requesting an ownership, throw error
    # If the data is not owned, and we are requesting to disown it, throw error
    cmp %ecx, %ebx
    jne 0f
    __OWNERSHIP_throw_conflict_MACRO__ 
    0:

    # set ownership
    movl %ecx, -8(%eax)

    mov %ebp, %esp
    pop %ebp
    ret

# Discard data without owners
__OWNERSHIP_declutter__:
    # todo

// #endregion