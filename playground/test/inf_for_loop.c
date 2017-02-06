#include <stdio.h>

int main() {
        int asd[10], i;

        for (i = 0; i < 11; i++) { // stack smashed
                asd[i] = 0;

                printf("lol");
        }

        return 0;
}
