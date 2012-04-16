/*
 *Braden Licastro
 *Computer Science 210
 *Lab 5 - Fall Semester 2011-12
 *Problem 3
 */

/*
 * Variable dictionary
 * f - stores a number to be arithmetically evaluated
 * g - stores a number to be arithmetically evaluated
 * h - stores a number to be arithmetically evaluated
 * a - array of numbers
 */

#include <stdio.h>

main()
{  
  int f; int g = 5; int h = 7; int k = 2;
  int a[] = {6, 5, 4, 3, 2, 1};
  f = g + h - a[k];
  printf("g:\t%d\nh:\t%d\na:\t%d\nAns:\t%d\n", g, h, a[k], f);
}
