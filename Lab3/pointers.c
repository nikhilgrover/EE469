//Nikhil Grover, Harry Cheng, Ishana Sharma
//Lab 2: C Program
//EE469: James Peckol

#include <stdio.h> // Standard I/O

int main()
{
	// Declare and initialize integer variables
	int A, B, C, D, E;
	A = 25;
	B = 16;
	C = 7;
	D = 4;
	E = 9;
	int result;

	// Declare pointer variables
	int * APtr;
	int * BPtr;
	int * CPtr;
	int * DPtr;
	int * EPtr;
	APtr = &A;
	BPtr = &B;
	CPtr = &C;
	DPtr = &D;
	EPtr = &E;

	// Perform computation ((A - B) * (C + D)) / E
	// Refer to variables through their pointers
	result = ((*APtr - *BPtr) * (*CPtr + *DPtr)) / (*EPtr);

	// Print result
	printf("Result = %i\n", result);

	return 0;
}