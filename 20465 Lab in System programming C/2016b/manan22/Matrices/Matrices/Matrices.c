// Matrices.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#pragma warning(disable:4996)

int **allocateMatrix(int matrixDim)
{
	int  **matrix = (int**)malloc(matrixDim*sizeof(int*));
	for (int i = 0; i<matrixDim; i++)
	{
		matrix[i] = (int*)malloc(matrixDim * sizeof(int));
	}
	return matrix;
}

int **matrix_sum(int  **matrixA, int  **matrixB, int ** matOutput, int matrixDim)
{
	 
	for (int i = 0; i < matrixDim; i++)
		for (int j = 0; j < matrixDim; j++)
	{
		matOutput[i][j] = matrixA[i][j] + matrixB[i][j];
	}
	return matOutput;
}

int **matrix_sub(int  **matrixA, int  **matrixB, int ** matOutput, int matrixDim)
{	

	for (int i = 0; i < matrixDim; i++)
		for (int j = 0; j < matrixDim; j++)
		{
			matOutput[i][j] = matrixA[i][j] - matrixB[i][j];
		}
	return matOutput;
}

void init_matrix(int **A, int dimSize, int value)
{
	for (int i = 0; i < dimSize; i++)
		for (int j = 0; j < dimSize; j++)
		{
			A[i][j] = value;
		}
}

void print_matrix(int **S, int size)
{
	for (int i = 0; i < size; i++)
	{
		for (int j = 0; j < size; j++)
		{
			printf("%d ", S[i][j]);
		}
		printf("\n");
	}
}

void free_matrix(int **A, int size)
{
	for (int i = 0; i < size; i++)
	{
		free(A[i]);
	}
	free(A);
}

void matrix_mult(int **A, int **B, int **S, int size)
{

	int count;
	for (int i = 0; i < size; i++)
	{
		count = 0;
		for (int j = 0; j < size; j++)
			count += A[i + j][i] * B[i + j][j];

		printf("count = %d\n" , count);
	}
}

void read_mat(int** matrix)
{
	/* Maximum name size + 1. */
	#define MAX_NAME_SZ 256
	/* Allocate memory and check if okay. */
	char *input = malloc(MAX_NAME_SZ);
	if (input == NULL) {
		printf("No memory\n");
		return 1;
	}
		
	/* Get the name, with size limit. */
	fgets(input, MAX_NAME_SZ, stdin);

	/* Remove trailing newline, if there. */
	if ((strlen(input)>0) && (input[strlen(input) - 1] == '\n'))
		input[strlen(input) - 1] = '\0';

	char * pch;	
	pch = strtok(input, " ");
	while (pch != NULL)
	{
		printf("%s ", pch);

		// here we need to fill the matrix with those tokens

		pch = strtok(NULL, " ,.-");
	}
	/* Free memory and exit. */
	free(input);
}
int main(int argc, char* argv[])
{
	

	int **MAT_A = allocateMatrix(4);
	read_mat(MAT_A);
	return 1;
	
	int ** A = allocateMatrix(3);
	int ** B = allocateMatrix(3);
	int ** S = allocateMatrix(3);

	init_matrix(A, 3, 1);
	init_matrix(B, 3, 1);

	S = matrix_sum(A, B, S, 3);
	print_matrix(S, 3);

	matrix_sub(A, B, S, 3);
	print_matrix(S, 3);

	free_matrix(A,3);
	free_matrix(B,3);
	free_matrix(S,3);

	int ** X = allocateMatrix(2);
	int ** Y = allocateMatrix(2);
	int ** R = allocateMatrix(2);

	matrix_mult(X, Y, R , 2);

	free_matrix(X, Y, R);
	

	return 0;
}

