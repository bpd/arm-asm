
#include <stdio.h>

extern int my_func(int c);

int main(int argc, char* argv[]) {

    printf("my_func(2): %d \n", my_func(2));
    
    return 1;
}