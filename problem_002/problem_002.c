#include <stdio.h>

#define UPPER_BOUND 4000000

int main()
{
  int sum = 0;
  int first = 1, second = 1;
  int third = first + second;

  while (third < UPPER_BOUND) {
    sum = sum + third;
    first  = second + third;
    second = first  + third;
    third  = first  + second;
  }

  printf("%d\n", sum);
  return 0;
}
