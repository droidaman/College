/*
 *Braden Licastro
 *Computer Science 210
 *Lab 3 - Fall Semester 2011-12
 *Problem 3
 */

/*
 * x -> Returned
 * y -> N bits
 * p -> Begin at this position
 * n -> Set to this number of rightmost bits.
 */

#include <stdio.h>

#define ZERO 0

main()
{
  int x, p, n, y, k;
  x = p = n = y = k = ZERO;
  
  printf("What value for x would you like? ");
  scanf("%x", &x);
  printf("\nWhat value for y would you like? ");
  scanf("%x", &y);
  printf("\nWhat value for p would you like? ");
  scanf("%d", &p);
  printf("\nWhat value for n would you like? ");
  scanf("%d", &n);

  k = setbits(x, y, p, n);

  printf("\nsetbits(%x, %x, %d, %d) = %x\n", x, y, p, n, k);
}

setbits(int x, int y, int p, int n)
{
  return (x&~(~(~0<<n)<<(p+1-n))|((y&~(~0<<n))<<(p+1-n)));
}
