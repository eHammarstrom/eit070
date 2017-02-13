#include <stdio.h>
#include <inttypes.h>

// http://stackoverflow.com/questions/12120426/how-to-print-uint32-t-and-uint16-t-variables-value

extern uint64_t asm_func();
extern uint32_t is_symmetric(uint32_t);

int main() {
        printf("%" PRIu64 "\n", asm_func());

        printf("%" PRIu32 "\n", is_symmetric(0x000FF000));

        return 0;
}
