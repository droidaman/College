/*
 *Braden Licastro
 *Computer Science 210
 *Lab 5 - Fall Semester 2011-12
 *Problem 1
 */

/*
 * Variable dictionary
 * CNSTNT   5
 * NUM1   2
 * NUM2   6
 * NUM3 - 10
 * f - stores a number to be arithmetically evaluated
 * g - stores a number to be arithmetically evaluated
 * h - stores a number to be arithmetically evaluated
 */

#include <stdio.h>

#define CNSTNT 5
#define NUM1 2
#define NUM2 6
#define NUM3 10

main()
{  
  int f = NUM1; int g = NUM2; int h = NUM3;
  printf("f:\t%d\n", f);
  f = f + g - h * (f + CNSTNT);
  printf("g:\t%d\nh:\t%d\nAns:\t%d\n", g, h, f);
}
