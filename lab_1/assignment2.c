#include <stdio.h>

int b;

int main() {
        b = 9;

        while (1) {
                if (b < 10) {
                        b--;
                } else {
                        break;
                }
        }

        printf("%d", b);
}
