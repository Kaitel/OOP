#include "errors.h"
void printError(int id)
{
	switch (id)
	{

		case COMMAD_NOT_FOUND:
			printf("Command not found\n");
		break;
		case MATRIX_NAME_NOT_FOUND:
			printf("Matrix name not found\n");
			break;
		case INVALID_INPUT_NUMBER:
			printf("Invalid input number \n");
		break;
		case MATRIX_NOT_INITIALIZE:
			printf("matrix not initialized\n");
		break;
	}


}