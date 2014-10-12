#include <stdio.h>

#define UPPER_BOUND 999

int natural_sum(max)
{
  return max * (max + 1) / 2;
}

int multiple_sum(int multiple)
{
  int threshold;

  threshold = UPPER_BOUND / multiple;
  return multiple * natural_sum(threshold);
}

int main()
{
  int answer;

  answer = multiple_sum(3) + multiple_sum(5) - multiple_sum(15);
  printf("Sum of multiples of 3 or 5 below 1000: %d\n", answer);
}
