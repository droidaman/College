/*
 *Braden Licastro
 *Computer Science 210
 *Lab 4 - Fall Semester 2011-12
 *Problem 2
 */

/*
 * x -> Returned
 * p -> Begin at this position
 * n -> Set to this number of rightmost bits.
 * k -> Value to be printed
 * ZERO -> Default Value
 */

#include <stdio.h>

#define ZERO 0

main()
{
  int x, p, n, k;
  x = p = n = k = ZERO;
  
  printf("What value for x would you like? ");
  scanf("%x", &x);
  printf("\nWhat value for p would you like? ");
  scanf("%d", &p);
  printf("\nWhat value for n would you like? ");
  scanf("%d", &n);

  k = invert(x, p, n);

  printf("\ninvert(%x, %x, %d) = %x\n", x, p, n, k);
}

invert(int x, int p, int n)
{
  return x^(~(~0 << n) << p);
}
