#include <stdio.h>
#include <stdlib.h>

#define NUM_COLS 1920
#define NUM_ROWS 1080

typedef unsigned char uint8;

struct pixel {
        uint8 red;
        uint8 green;
        uint8 blue;
        uint8 alpha;
};

int main() {
        struct pixel **matrix = malloc(NUM_ROWS * sizeof(struct pixel*));
        for (int i = 0; i < NUM_ROWS; i++) {
                matrix[i] = malloc(NUM_COLS * sizeof(struct pixel));
        }

        for (int i = 0; i < NUM_ROWS; i++) {
                for (int j = 0; j < NUM_COLS; j++) {
                        struct pixel p = {
                                .red = 255,
                                .green = 255,
                                .blue = 255,
                                .alpha = 255
                        };

                        matrix[i][j] = p;
                }
        }

        free(matrix);

        return 0;
}
