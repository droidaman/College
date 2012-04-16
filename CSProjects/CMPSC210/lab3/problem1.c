
/*
 *Braden Licastro
 *Computer Science 210
 *Lab 3 - Fall Semester 2011-12
 *Problem 1
 */

/*
 * MAXSIZE: Maximum array length.
 * ZERO: Number 0.
 * c: holds the current character
 * i: universal counter
 * length: the length of the array
 * array: the array used to hold the string
 */


#include<stdio.h>

#define MAXSIZE 1000
#define ZERO 0

int arrlen(int []);
int reverse(int [], int);

main()
{
  int c, i = ZERO, length = ZERO;
  int array[MAXSIZE];

  printf("Input: \n");

  while((c=getchar()) != EOF)
    {
	  array[i++] = c; /*Read them into an array*/
	  putchar(c);
    }

  array[i] = '\0'; /* terminate the array */
  
  length = arrlen(array);

  reverse(array, length);
}

//Returns the length of the array.
int arrlen(int array[])
{
  int i;

  for(i=ZERO;array[i] != '\0';++i);
  
  return i;
}

reverse(int array[], int length)
{
  int i = ZERO, c, l = length;
  while (i < (length-1) && i != (length-1))
    {
      c = array[i];
      array[i] = array[(length - 1)];
      array[(length - 1)] = c;
      i++;
      length--;
    }

  printf("\nReversed:\n");
  for(i=ZERO;i<l;++i)
    {
      putchar(array[i]);
    }
  printf("\n");
}
