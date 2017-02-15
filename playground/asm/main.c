#include <stdio.h>
#include <inttypes.h>

extern uint64_t asm_func();
extern uint8_t is_binary_symmetric(uint32_t);

int main() {
        printf("0xFF0FF000 %" PRIu8 "\n", is_binary_symmetric(0xFF0FF000)); // false
        printf("0x11011011 %" PRIu8 "\n", is_binary_symmetric(0x11011011)); // false
        printf("0x000FF000 %" PRIu8 "\n", is_binary_symmetric(0x000FF000)); // true
        printf("0x80000001 %" PRIu8 "\n", is_binary_symmetric(0x80000001)); // true

        return 0;
}
