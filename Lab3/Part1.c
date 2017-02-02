//Nikhil Grover, Harry Cheng, Ishana Sharma
//Lab 3: Working with pointers
//EE469: James Peckol

#include <stdio.h> // Standard I/O

int main()
{
	// 1. Declare variables
	// int a, b;
	int a, b;
	float x, y;
	char dank, memes;

	// 2. Declare pointer variables
	int *intPtr;
	float *floatPtr;
	char *charPtr;

	// 3. 4. 5. Assign addresses, print out values
	intPtr = &a;
	printf("Value: %i\n", a);
	intPtr = &b;
	printf("Value: %i\n", b);
	floatPtr = &x;
	printf("Value: %f\n", x);
	floatPtr = &y;
	printf("Value: %f\n", y);
	charPtr = &dank;
	printf("Value: %c\n", dank);
	charPtr = &memes;
	printf("Value: %c\n", memes);
}