/*
 *Braden Licastro
 *Computer Science 210
 *Lab 5 - Fall Semester 2011-12
 *Problem 2
 */

/*
 * Variable dictionary
 * TEN - 10
 * f - stores a number to be arithmetically evaluated
 * g - stores a number to be arithmetically evaluated
 * h - stores a number to be arithmetically evaluated
 * a - array of numbers
 */

#include <stdio.h>

#define TEN 10

main()
{  
  int f; int g = 8; int h = 4;
  int a[] = {5, 4, 3, 2, 1};
  f = g - a[3] - h + TEN;
  printf("g:\t%d\nh:\t%d\na:\t%d\nAns:\t%d\n", g, h, a[3], f);
}
