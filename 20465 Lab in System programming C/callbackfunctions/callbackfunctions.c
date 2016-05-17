// callbackfunctions.cpp : Defines the entry point for the console application.
//

#include <stdlib.h>

typedef void(*call_back) (int, int);

void informProgress(int a, int b)
{
	printf("In call back function, a:%d \t b:%d \n", a, b);
}
void copyFile(call_back inform)
{
	int a = 5;
	int b = 7;

	for (int i = 0; i < 10; i++)
	{
		if (inform != NULL)
			inform(i*a, b + i);
		printf(" the function continue doing more work here...");
	}
}

int main(int argc, char* argv[])
{

	copyFile(informProgress);
	return 0;
}

