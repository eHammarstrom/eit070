#include <stdio.h>
#include <stdlib.h>

int main() {
        int *var = malloc(sizeof(int));

        printf("%d\n", var);
        printf("%d\n", *var);

        *var = 5;

        printf("%d\n", var);
        printf("%d\n", *var);

        return 0;
}
