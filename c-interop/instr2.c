
#include <stdio.h>

extern int loop(int times, int increment);

int main(int argc, char** argv) {

	printf("loop(3, 2): %d \n", loop(3, 2));
	printf("loop(4, 3): %d \n", loop(4, 3));
	printf("loop(0, 0): %d \n", loop(0, 0));
	printf("loop(1, 1): %d \n", loop(1, 1));


	return 1;
}
