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

        const SDL_Rect rect = { .x = 0, .y = 0, .w = 1600, .h = 900 };

        SDL_RenderClear(window_renderer); // clear render

        SDL_SetRenderDrawColor(window_renderer, 255, 0, 0, 255);
        SDL_RenderDrawRect(window_renderer, &rect);
        SDL_RenderFillRect(window_renderer, &rect);

        SDL_RenderPresent(window_renderer); // draw render
    
        sleep(5);

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
