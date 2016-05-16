#include <stdlib.h>
#include <stdio.h>
#include "matrices.h"
#include "errors.h"

#define MAX_NAME_SZ 5000

char *input = NULL;

int** GetMatrixByName(char *str, int size, int allocate)
{
	int **matrixPtr = NULL;
	if (strcmp(str, "MAT_A") == 0)
	{
		if (MAT_A == NULL && allocate)
			MAT_A = allocateMatrix(size);
		matrixPtr = MAT_A;
	}
	else
	if (strcmp(str, "MAT_B") == 0)
	{
		if (MAT_B == NULL && allocate)
			MAT_B = allocateMatrix(size);
		matrixPtr = MAT_B;
	}
	else
		if (strcmp(str, "MAT_C") == 0)
		{
			if (MAT_C == NULL && allocate)
				MAT_C = allocateMatrix(size);
			matrixPtr = MAT_C;
		}
	else
		if (strcmp(str, "MAT_D") == 0)
		{
			if (MAT_D == NULL && allocate)
				MAT_D = allocateMatrix(size);
			matrixPtr = MAT_D;
		}
		else
			if (strcmp(str, "MAT_E") == 0)
			{
				if (MAT_E == NULL && allocate)
					MAT_E = allocateMatrix(size);
				matrixPtr = MAT_E;
			}
			else
			if (strcmp(str, "MAT_F") == 0)
			{
				if (MAT_F == NULL && allocate)
					MAT_F = allocateMatrix(size);
				matrixPtr = MAT_F;
			}
			else
		{
			matrixPtr = NULL;
		}

	return matrixPtr;
}

int add_mat_input_parameters(char *pch, int size)
{

	int **add_A = GetMatrixByName(pch, size, 0);
	if (add_A == NULL)
		return MARIX_ADD_FIRST_MATRIX_PARAMETER_IS_INCORRECT;

	pch = strtok(NULL, " ");

	int **add_B = GetMatrixByName(pch, size, 0);
	if (add_B == NULL)
		return MARIX_ADD_SECOND_MATRIX_PARAMETER_IS_INCORRECT;;

	pch = strtok(NULL, " ");

	// we need to allocate if needed
	int **add_C = GetMatrixByName(pch, size, 1);
	if (add_C == NULL)
		return MARIX_ADD_RESULT_MATRIX_PARAMETER_IS_INCORRECT;

	add_C = matrix_add(add_A, add_B, add_C, size);

	return OK;
}
int print_mat_input_parameters(char *pch, int size)
{
	readMatrixPtr = GetMatrixByName(pch, size, 0);
	if (readMatrixPtr == NULL)
		return MATRIX_NOT_INITIALIZE;
	print_matrix(readMatrixPtr, size);

	return OK;
}
int sub_mat_input_parameters(char *str, int size)
{

	return -1;
}
int mult_mat_input_parameters(char *str, int size)
{

	return -1;
}
int transpose_mat_input_parameters(char *str, int size)
{

	return -1;
}
int mult_scalar_input_parameters(char *str, int size)
{

	return -1;
}
int stop_input_parameters(char *str, int size)
{

	return -1;
}


int read_mat_input_parameters(char *pch, int size)
{
	int i = 0;
	int j = 0;
	long value;
	int count = 0;

	readMatrixPtr = GetMatrixByName(pch, size, 1);
	if (readMatrixPtr == NULL)
		return MATRIX_NAME_NOT_FOUND;
	
	init_matrix(readMatrixPtr, size, 0);
	pch = strtok(NULL, " ");

	while (pch != NULL)
	{
		if (count == (size * size))
			break;
		//printf("%s ", pch);
		if (checkNumber(pch, &value) == 0)
		{
			return INVALID_INPUT_NUMBER;
		}
		count++;
		// here we need to fill the matrix with those tokens
		if (i == size)
		{
			j++;
			i = 0;
			readMatrixPtr[i][j] = (int)value;
		}
		else {
			readMatrixPtr[i][j] = (int)value;
		}
		i++;
		pch = strtok(NULL, " ");
	}
	return OK;
}

int(*functionParameters[8])(char *str, int size) = { 0 };

int InitializeParser()
{
	if (input == NULL)
	{
		/* Allocate memory and check if okay. */
		input = malloc(MAX_NAME_SZ);
		if (input == NULL) {
			printf("No memory\n");
			return 0;
		}
	}

	functionParameters[0] = &read_mat_input_parameters;
	functionParameters[1] = &add_mat_input_parameters;
	functionParameters[2] = &print_mat_input_parameters;
	functionParameters[3] = &sub_mat_input_parameters;
	functionParameters[4] = &mult_mat_input_parameters;
	functionParameters[5] = &transpose_mat_input_parameters;
	functionParameters[6] = &mult_scalar_input_parameters;
	functionParameters[7] = &stop_input_parameters;


	return 1;
}
int getCommandInputID(char *command)
{
	if (strcmp(command, "read_mat") == 0)
	{
		return 0;
	} else 
	if (strcmp(command, "print_mat") == 0)
	{
		 return 2;
	}
	if (strcmp(command, "add_mat") == 0)
	{
		return 1;
	}
	else
	if (strcmp(command, "sub_mat") == 0)
	{
		return 4;
	}
	else
	if (strcmp(command, "mul_mat") == 0)
	{
		return 0;
	}
	else
	if (strcmp(command, "trans_mat") == 0)
	{
		return 0;
	}
	else
	if (strcmp(command, "mul_scalar") == 0)
	{
		return 0;
	}
	else
	if (strcmp(command, "stop") == 0)
	{
		return 7;
	}
	else {
		return -1;
	}
	 
 
}
 
void CloseParser()
{
	if (input != NULL)
		free(input);
	input = NULL;
}

int ReadUserInput()
{
	int r;
	char * pch;
	/* Get the name, with size limit. */
	fgets(input, MAX_NAME_SZ, stdin);

	/* Remove trailing newline, if there. */
	if ((strlen(input)>0) && (input[strlen(input) - 1] == '\n'))
		input[strlen(input) - 1] = '\0';

	pch = strtok(input, " ");

	int index = 0;
	int functionId = -1;
	while (pch != NULL)
	{
		//printf("%s ", pch);
		if (index == 0)
		{
			functionId = getCommandInputID(pch);
			if (functionId == -1)
			{
				return COMMAD_NOT_FOUND;
			}
			if (functionId == 7)
				return STOP_PROGRAM;
		} else 		
		if (index == 1)
		{
			if ((r = functionParameters[functionId](pch, matrix_dim)) < 0)
			{
				return r;
			}
			else {
				return functionId;
			}
		}
		pch = strtok(NULL, " ");
		index++;
	}
	return functionId;
}

