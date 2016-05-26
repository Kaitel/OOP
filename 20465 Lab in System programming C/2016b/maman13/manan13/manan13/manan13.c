// manan13.cpp : Defines the entry point for the console application.
//

#include <stdio.h>

#define INVALID_INPUT_NUMBER	   -10
#define INPUT_FILE_NOT_FOUND       -11
#define OUTPUT_APPEND_ERROR        -12


#pragma warning( disable : 4996)

int(*pInputFunc)(void);
int (*pOutputFunc)(char *temp);

typedef int(*call_back) ();

int WriteOutputToScreen(char *str, char *OutputFileName);
int WriteOutputToFile(char *str, char *OutputFileName);
int ReadInputFromUser(call_back pOutputFunc, char *FileName, char *OutputFileName);
int ReadInputFromFile(call_back pOutputFunc, char *FileName, char *OutputFileName);

#define MAX_NAME_SZ 10000
char temp[50];

int WriteOutputToScreen(char *str, char *OutputFileName)
{
	printf("%s\n", temp);

	return 1;
}
int WriteOutputToFile(char *str, char *OutputFileName)
{
	FILE *handle = fopen(OutputFileName, "a+t");
	if (handle == NULL)
		return OUTPUT_APPEND_ERROR;

	fprintf(handle, "%s\n", str);

	fclose(handle);
	return 1;
}

void PerformConversion(int value)
{

	int value1;
	if (value > 19)
	{
		value1 = value - ((int)value / 10 * 10);
		switch ((int)(value / 10))
		{			

			case 2:
				strcpy(temp, "twenty ");
			break;
			case 3:
				strcpy(temp, "thirty ");
			break;
			case 4:
				strcpy(temp, "forty ");
			break;
			case 5:
				strcpy(temp, "fifty ");
			break;
			case 6:
				strcpy(temp, "sixty ");
			break;
			case 7:
				strcpy(temp, "seventy ");
			break;
			case 8:
				strcpy(temp, "eighty ");
			break;
			case 9:
				strcpy(temp, "ninety ");
			break;
		}
	}
	else {
		value1 = value;
	}

	switch (value1)
	{
		case 1:
			strcat(temp, "one");
		break;
		case 2:
			strcat(temp, "two");
		break;
		case 3:
			strcat(temp, "three");
		break;
		case 4:
			strcat(temp, "four");
		break;
		case 5:
			strcat(temp, "five");
		break;
		case 6:
			strcat(temp, "six");
		break;
		case 7:
			strcat(temp, "seven");
		break;
		case 8:
			strcat(temp, "eight");
		break;
		case 9:
			strcat(temp, "nine");
		break;
		case 10:
			strcat(temp, "ten");
		break;
		case 11:
			strcat(temp, "eleven");
		break;
		case 12:
			strcat(temp, "twelve");
		break;
		case 13:
			strcat(temp, "thirteen");
		break;
		case 14:
			strcat(temp, "fourteen");
		break;
		case 15:
			strcat(temp, "fifteen");
		break;
		case 16:
			strcat(temp, "sixteen");
		break;
		case 17:
			strcat(temp, "seventeen	");
		break;
		case 18:
			strcat(temp, "eighteen");
		break;
		case 19:
			strcat(temp, "nineteen");
		break;
	}

	
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
int ReadInputFromUser(call_back pOutputFunc, char *FileName, char *OutputFileName)
{

	char *pch;
	long value;
	temp[0] = 0;
	int r;

	/* Allocate memory and check if okay. */
	char *input = malloc(MAX_NAME_SZ);
	if (input == NULL) {
		printf("No memory\n");
		return 0;
	}

	/* Get the name, with size limit. */
	fgets(input, MAX_NAME_SZ, stdin);

	/* Remove trailing newline, if there. */
	if ((strlen(input)>0) && (input[strlen(input) - 1] == '\n'))
		input[strlen(input) - 1] = '\0';


	pch = strtok(input, " ");

	while (pch != NULL)
	{
		if (checkNumber(pch, &value) == 0)
		{
			free(input);
			return INVALID_INPUT_NUMBER;
		}
		PerformConversion(value);
		if ((r = pOutputFunc(temp, OutputFileName)) < 0)
		{
			free(input);
			return r;
		}
		temp[0] = 0;
		pch = strtok(NULL, " ");
	}
	free(input);
	return 1;
}
int ReadInputFromFile(call_back pOutputFunc, char *FileName, char *OutputFileName)
{
	char *pch;
	long value;
	char *p1; 
	char input[1000];
	FILE *handle = fopen(FileName, "r+t");
	if (handle == NULL)
	{
		return INPUT_FILE_NOT_FOUND;
	}

	while (!feof(handle))
	{
		p1 = fgets(input, 1000, handle);
		if (p1 == NULL)
			break;
		char *p = strchr(input, '\n');
		if (p != NULL)
			*p = NULL;

		printf("%s\n", input);

		pch = strtok(input, " ");

		while (pch != NULL)
		{
			if (checkNumber(pch, &value) == 0)
			{
				fclose(handle);
				return INVALID_INPUT_NUMBER;
			}
			PerformConversion(value);
			pOutputFunc(temp, OutputFileName);
			temp[0] = 0;
			pch = strtok(NULL, " ");
		}
	}
	fclose(handle);
	return 1;
}

void usage()
{

}
void printError(int r)
{
	switch (r)
	{
		case INVALID_INPUT_NUMBER:
			printf("Invalid input number\n");
		break;
		case INPUT_FILE_NOT_FOUND:
			printf("input file not found\n");
		break;
	}
}

int main(int argc, char* argv[])
{
	char inFile[200];
	char outFile[200];
	int r;
	if (argc > 5)
	{
		usage();
		return 0;
	}

	switch (argc)
	{
		case 1:
			pInputFunc = ReadInputFromUser;
			pOutputFunc = WriteOutputToScreen;
		break;
		case 2:
			pInputFunc = ReadInputFromFile;
			pOutputFunc = WriteOutputToScreen;
			strcpy(inFile, argv[1]);
		break;
		case 3:
			pInputFunc = ReadInputFromFile;
			pOutputFunc = WriteOutputToFile;
			strcpy(inFile, argv[1]);
			strcpy(outFile, argv[2]);
		break;
	}

	if ((r = pInputFunc(pOutputFunc, inFile, outFile)) != 1){
		printError(r);
	}
 

	return 0;
}

