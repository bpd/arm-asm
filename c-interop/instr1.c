
#include <stdio.h>

extern int add(int a, int b);
extern int maybe_add(int a, int b);

int main(int argc, char** argv) {

	printf("add(1, 2): %d \n", add(1, 2));
	printf("maybe_add(1, 2): %d \n", maybe_add(1,2));
	printf("maybe_add(2, 1): %d \n", maybe_add(2,1));

	return 1;
}
