# http://cs.lmu.edu/~ray/notes/gasexamples/
# https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf
# https://www.cs.cmu.edu/~fp/courses/15213-s07/misc/asm64-handout.pdf
# RAX - return integer value address
# add   source, destination
# addQ, Q = QUADWORD (8byte, 64bit)

    .text
    .globl asm_func
asm_func:
    addq    $1000, %rax
    ret
