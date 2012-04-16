/*
 * Braden Licastro
 * Computer Science 210
 * Lab 6 - Fall Semester 2011-12
 * Problem 1
 * C Lab
 * Takes in an integer and this integer is compared to EACH value in the array. If the integer is larger than each item in the array return 1 otherwise return -1.
 */

/*
 * VARIABLE DICTIONARY
 * ZERO - Initial/Reset value
 * i - Universal counter
 * k - Represents the integer to be tested
 * l - Represents the size of the array
 * m - The array itself
 */

#include <stdio.h>

#define ZERO 0

main()
{
  int i, k, l;
  i = k = l = ZERO;

  printf("Please input the integer to be tested: ");
  scanf("%d", &k);
  printf("Enter the size of the array: ");
  scanf("%d", &l);

  printf("What are the contents of the array? One at a time, hit return after each value: ");

  int m[l];

  while(i < l)
    {
      scanf("%d", &m[i]);
      i++;
    }

  i = ZERO;

  printf("\nThe inputs to be used are:\nk: %d\nl: %d\nArray: ", k, l);
  while(i < l)
    {
      printf("%d ", m[i]);
      i++;
    }

  i = isGreater(k, l, m);

  printf("\n\nThe numbers in the array ");
  if(i > ZERO)
    printf("are all less than the number %d.\n", k);
  else
    printf("aren't all less than the number %d.\n", k);
}

int isGreater(int k, int l, int m[])
{
  int i;
  i = ZERO;

  while(i < l)
    {
      if(k > m[i])
	i++;
      else
	  return -1;
    }
      return 1;
}
