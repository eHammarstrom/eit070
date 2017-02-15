# http://cs.lmu.edu/~ray/notes/gasexamples/
# https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf
# https://www.cs.cmu.edu/~fp/courses/15213-s07/misc/asm64-handout.pdf
# http://ref.x86asm.net/coder32.html
# https://sourceware.org/binutils/docs/as/Pseudo-Ops.html
# https://docs.oracle.com/cd/E26502_01/html/E28388/eoiyg.html
# http://unixwiz.net/techtips/x86-jumps.html

    .text
    .globl is_binary_symmetric
is_binary_symmetric:
    xor     %r11d, %r11d            # set 0
    xor     %r12d, %r12d            # set 0
    mov     %edi, %r10d             # move input parameter to r10d
    mov     $16, %r14b              # use %r14b as counter = 16
    mov     and_bin(%rip), %r13d    # use r13d as 0b100000000000... AND shifter to single out target bit
    mov     $31, %cl                # use cl to shift to symmetrical point (32 bits mirrored at 16 bits to check if symmetrical)

loopy:
    cmp     $0, %r14b               # when 16 - 0 = 0, ZF = 1
    jz      end                     # if ZF = 1, jump to end tag

    mov     %r10d, %r11d            # move input (r10d) to temp (r11d)
    and     %r13d, %r11d            # use r13d (AND shifter) to single out target bit
    shr     %cl, %r11d              # shift target bit 31 ( - 2 per loop ) steps to the right
    addl    %r11d, %r12d            # add bit to total

    shr     $1, %r13d               # prepare AND shifter for next bit
    sub     $2, %cl                 # prepare cl for next symmetric shift
    sub     $1, %r14b               # counter -= 1
    jmp     loopy                   # jump back up to loopy
end:

    and     clean_bin(%rip), %r10d  # if input if 0xFFFFFFFF we want only 0x0000FFFF to compare with our calculated register (hopefully also 0x0000FFFF)
    cmp     %r10d, %r12d            # compare ANDED input with calculation

    setz    %al                     # if ZF = 1 then set %al to 1 (r10d and r12d had equal values)
    ret

clean_bin:
    .long 0x0000FFFF                # 16 zeros followed by 16 ones

and_bin:
    .long 0x80000000                # (0b10000...)
