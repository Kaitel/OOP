// Matrices.cpp : Defines the entry point for the console application.
//

#include <stdlib.h>
#include <stdio.h>
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
		for (int r = 0; r < size; r++)
		{
			S[r][i] = 0;
			for (int j = 0; j < size; j++)
				S[r][i] += A[r][j] * B[j][i];
		}
	}
}

void read_mat(int** matrix, int size)
{
	/* Maximum name size + 1. */
	#define MAX_NAME_SZ 256

	char * pch;
	int i = 0;
	int j = 0;
	long value;
	int count = 0;

	/* Allocate memory and check if okay. */
	char *input = malloc(MAX_NAME_SZ);
	if (input == NULL) {
		printf("No memory\n");
		return 0;
	}
	init_matrix(matrix, size, 0);

	/* Get the name, with size limit. */
	fgets(input, MAX_NAME_SZ, stdin);

	/* Remove trailing newline, if there. */
	if ((strlen(input)>0) && (input[strlen(input) - 1] == '\n'))
		input[strlen(input) - 1] = '\0';

	pch = strtok(input, " ");

	while (pch != NULL)
	{
		if (count == (size * size))
			break;
		//printf("%s ", pch);
		if (checkNumber(pch, &value) == 0)
		{
			printf("Invalid input");
			return 0;
		}
		count++;
		// here we need to fill the matrix with those tokens
		if (i == size)
		{
			j++;
			i = 0;
			matrix[i][j] = (int)value;
		}
		else {
			matrix[i][j] = (int)value;
		}
		i++;
		pch = strtok(NULL, " ,.-");
	}
	/* Free memory and exit. */
	free(input);

	return 1;
}

int checkNumber(char *some_string, long *value)
{
 
	char *endptr;
	*value = strtol(some_string, &endptr, 10);

	if (endptr == some_string)
	{
		// Not a valid number at all
		return 0;
	}
	else if (*endptr != '\0')
	{
		return 0;
	}
	else
	{
		// String is a number
		return 1;
	}
}

void init_identity(int ** matrix, int size)
{
	init_matrix(matrix, size, 0);
	for (int i = 0; i < size; i++)
	{
		matrix[i][i] = 1;
	}

}
int main(int argc, char* argv[])
{
	


	int **MAT_A = allocateMatrix(4);
	int **MAT_B = allocateMatrix(4);
	int **R = allocateMatrix(4);

	read_mat(MAT_A, 4);
	print_matrix(MAT_A, 4);

	init_identity(MAT_B, 4);
	print_matrix(MAT_B, 4);

	matrix_mult(MAT_A, MAT_B, R, 4);
	print_matrix(R, 4);
	
	 
	free_matrix(MAT_A, 4);
	free_matrix(MAT_B, 4);
	free_matrix(R,4);

	
	return 0;
}

