#include <stdio.h>
#include <inttypes.h>

// http://stackoverflow.com/questions/12120426/how-to-print-uint32-t-and-uint16-t-variables-value

extern uint64_t asm_func();
// extern uint8_t is_symmetric(uint32_t);
extern uint32_t is_symmetric(uint32_t);

int main() {
        // printf("%" PRIu64 "\n", asm_func());

        // printf("%" PRIu8 "\n", is_symmetric(0x000FF000));
        // printf("%" PRIu8 "\n", is_symmetric(0xFF0FF000));
        // printf("%" PRIu8 "\n", is_symmetric(0x11011011));

        printf("0x11011011 %" PRIu32 "\n", is_symmetric(0x11011011));

        printf("0xFF0FF000 %" PRIu32 "\n", is_symmetric(0xFF0FF000));

        printf("0x12344321 %" PRIu32 "\n", is_symmetric(0x12344321));

        return 0;
}
