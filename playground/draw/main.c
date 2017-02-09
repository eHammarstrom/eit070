#include <stdlib.h>
#include <unistd.h>

#include <SDL2/SDL.h>

void print_err(const char *);
SDL_Window *window_setup(const char*, int, int);

int main() {
        SDL_Window *window = window_setup("Main", 1600, 900);
        SDL_Renderer *window_renderer;

        if (window == NULL) {
                print_err(SDL_GetError());
                return EXIT_FAILURE;
        }

        window_renderer = SDL_CreateRenderer(
                        window, -1, SDL_RENDERER_ACCELERATED);

        if (window_renderer == NULL) {
                print_err(SDL_GetError());
                return EXIT_FAILURE;
        }
    
        sleep(2);

        SDL_DestroyWindow(window);
        SDL_Quit();
        return EXIT_SUCCESS;
}

void print_err(const char *msg) {
        printf("Error: %s\n", *msg);
}

SDL_Window *window_setup(const char *title, int width, int height) {
        SDL_Window *window;

        if (SDL_Init(SDL_INIT_VIDEO) != 0) {
                SDL_Log("Unabled to initialize SDL: %s\n", SDL_GetError());
                return NULL;
        }

        window = SDL_CreateWindow(
                        title,
                        SDL_WINDOWPOS_UNDEFINED,
                        SDL_WINDOWPOS_UNDEFINED,
                        width,
                        height,
                        SDL_WINDOW_OPENGL);

        return window;
}
