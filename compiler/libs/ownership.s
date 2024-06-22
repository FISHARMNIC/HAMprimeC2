.data

# mot here. Use linked lists? 

.text

.macro __OWNERSHIP_throw_conflict_MACRO__
    # Todo. For now it just purposely segfaults
    # Should just throw an error saying that the data already has an owner and needs to be disowned
    # Should stop the program
    mov %eax, 0
.endm

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
__OWNERSHIP_request_transer__: # expects two parameters
    /*
    Parameters:
         8(%esp): Address
        12(%esp): 
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
