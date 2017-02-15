# http://cs.lmu.edu/~ray/notes/gasexamples/
# https://cs.brown.edu/courses/cs033/docs/guides/x64_cheatsheet.pdf
# https://www.cs.cmu.edu/~fp/courses/15213-s07/misc/asm64-handout.pdf

# RAX - return integer value address
# add   source, destination
# addQ, Q = QUADWORD (8byte, 64bit)
# $ apparently indicates an integer value (NICE!)

    .text
    .globl asm_func
asm_func:
    addq    $1000, %rax
    ret

# sal / shl k, D Left shift destination by k bits
# sar k, D Arithmetic right shift destination by k bits
# shr k, D Logical right shift destination by k bits
# mov S, D !!MUST HAVE SAME REGISTER LENGTH!!

# http://ref.x86asm.net/coder32.html
# https://sourceware.org/binutils/docs/as/Pseudo-Ops.html
# https://docs.oracle.com/cd/E26502_01/html/E28388/eoiyg.html
# http://unixwiz.net/techtips/x86-jumps.html

    # AND:a ut första biten
    # Flytta första biten 31 steg
    # AND:a ut andra biten
    # Flytta andra biten 29 steg
    # För varje AND och FLYTT, addera resultat i ett register
    # Repetera 8 gånger
    # AND:a bort den gamla halvan
    # Se om både start register och slutregister samma värde, isåfall symmetrisk input
    # Då sätts ZF = 1 och vi kan sätta EAX = ZF och returnera

    .globl is_symmetric
is_symmetric:
    xor     %r11d, %r11d            # set 0
    xor     %r12d, %r12d            # set 0
    mov     %edi, %r10d             # move input parameter to r10d
    mov     $16, %r14b              # use %r14b as counter = 31
    mov     and_bin(%rip), %r13d    # use r13d as 0b100000000000... AND shifter

    mov     $31, %cl                # use cl to shift to symmetrically

loopy:
    cmp     $0, %r14b               # 16 - 0 > 0 ... 16 - 16 = 0, ZF = 1
    jz      end                     # if SF = 1, jump to end

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

    xor     %rax, %rax              # set ALL return bits to 0
    setz    %al                     # if ZF = 0 then set %al to 1 (r10d and r12d had equal values)
    # mov     %r10d, %eax
    # mov     %r12d, %eax
    # mov     %r13d, %eax
    # mov     and_bin(%rip), %eax
    ret

clean_bin:
    .long 0x0000FFFF

and_bin:
    .long 0x80000000

# 0x11011011 has a binary representation of 0b10001000000010001000000010001
# we are interested in mirroring leftmost 16 bits to 0b0001000000010001
# clearing 16 first bits in input so that it also has value of 0b0001000000010001
# comparing these will set ZF = 1 which we will return, otherwise return 0

# with 0x11011011
# r10d = 4113 = 0b0001000000010001
# r12d = 32904 = 0b1000000010001000
# r12d should be equal to r10d in this case

# <initiumdoeslinux> Hello, I am trying to learn gas assembly and need some help. What is the preferred code paste in here?
# <Jester01> whichever you like
# <Jester01> as long as it has line numbers
# <roxfan> and not full of ads/js
# <Jester01> http://paste.debian.net/
# <initiumdoeslinux> http://paste.debian.net/914241/
# <initiumdoeslinux> Line 10 does not go through
# <initiumdoeslinux> My idea is that I AND %r11d with clean_bin and it stores back to %r11d
# <Jester01> that's an ADD not an AND though ;)
# <GeDaMo> Is there an error message?
# <initiumdoeslinux> Long day, it doesn't go through adding clean_bin to %r11d
# <initiumdoeslinux> relocation R_X86_64_32S against `.text' can not be used when making a shared object; recompile with -fPIC
# <initiumdoeslinux> compiling with -fPIC throws same message
# <Jester01> let me guess, MAC ?
# <initiumdoeslinux> if I uncomment Line 10, it works
# <initiumdoeslinux> linux
# <Jester01> then you have PIE enabled by default
# <Jester01> anyway
# <Jester01> addl    clean_bin(%rip), %r11d
# <Jester01> magic
# <initiumdoeslinux> What is PIE?
# <Jester01> Position Independent Executable
# <Jester01> or you may just be building a shared library really :)
# <initiumdoeslinux> I'll read up on that. Does clean_bin(%rip) store clean_bin in a register before adding?
# <Jester01> no
# <Jester01> it just uses a relative offset to the instruction pointer as opposed to an absolute address
# <Jester01> hence it will be position independent
# <initiumdoeslinux> If a shared library means executing the functions in C, then yes.
# <Jester01> nope
# <initiumdoeslinux> I see
# <Jester01> it's just a PIE then probably
# <Jester01> it's getting more common due to security nowadays
# <initiumdoeslinux> ASLR?
# <Jester01> yes
# <initiumdoeslinux> Thanks for the help

# <initiumdoeslinux> if cmp %edx, %ecx < 0 will SF = 1?
# <Jester01> ?
# <initiumdoeslinux> I am trying to figure out how to make a "for-loop"
# <Jester01> yes, if the result is negative SF=1, and that happens if ecx<edx
# <kikero> Hello!
# <GeDaMo> Hi kikero :)
# <initiumdoeslinux> http://paste.debian.net/914250/
# <kikero> How are you, GeDaMo?
# <GeDaMo> Not too bad, you?
# <initiumdoeslinux> the behaviour i want from this is an infinite loop
# <GeDaMo> Note that 'loop' is an opcode
# <initiumdoeslinux> Okay, will have to change that
# <initiumdoeslinux> the problem right now is that it is passing my 'loop' while my idea is that it should run infinitely
# <Jester01> addl    $31, %ecx
# <Jester01> we don't know what's in ecx initially
# <Jester01> did you mean mov?
# <initiumdoeslinux> i assumed it was 0, my bad
# <initiumdoeslinux> move will overwrite, correct?
# <GeDaMo> Yes
# <Jester01> yes
# <initiumdoeslinux> can I compare with an immediate value without using the %edx register? it feels unecessary
# <GeDaMo> Yes
