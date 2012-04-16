/*
 * Braden Licastro
 * Computer Science 210
 * Lab 7 - Fall Semester 2011-12
 * Exercise 2
 * String Reverser Using Pointers
 */

/*
 * MAXSIZE: Maximum array length.
 * ZERO: Number 0.
 * c: holds the current character
 * *p1: str1 pointer
 * *p2: str2 pointer
 * str1: the character array used to hold the string
 * str2: the character array used to hold the reversed string
 */

#include <stdio.h>
#include <string.h>

#define MAXSIZE 1000
#define ZERO 0

void main()
{
  char str1[MAXSIZE], str2[MAXSIZE], *p1, c;

  // Make p2 point to the beginning of str2
  p1 = str1;

  printf("Input: \n");

  while((c=getchar()) != EOF)
    {
	  *p1 = c; /*Read them into a character array*/
	  *p1++;
	  putchar(c);
    }

  *p1 = '\0'; //Terminate the array.
  
  reverse(str1, str2);

  printf("\nOutput:\n%s", str2);
}


// Reverse the string using pointers.
reverse(char str1[], char str2[])
{
  //Define the pointers.
  char *p1, *p2;
  
  // Make p1 point to end of str1
  p1 = str1 + strlen(str1) - 1;
  // Make p2 point to the beginning of str2
  p2 = str2;

  while(p1 >= str1)
    *p2++ = *p1--;

  // Null terminate str2
  *p2 = '\0';
}
