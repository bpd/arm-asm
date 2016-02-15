
#include <stdio.h>

extern int my_func(int argc);

int main(int argc, char* argv[]) {

	printf("my_func(3): %d \n", my_func(3));

	return 1;
}

int some_func(int arg1, int arg2) {

  printf("some_func(%d, %d) \n", arg1, arg2);
  return 7;
}

