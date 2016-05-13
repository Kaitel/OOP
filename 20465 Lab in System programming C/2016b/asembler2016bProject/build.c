#include "assembler.h"


void putDash(int type, int count)
{

	if (type == 0)
	{
		if (count == 2)
			printf("-");
		else
			if (count == 4)
				printf("-");
			else
				if (count == 8)
					printf("-");
				else
					if (count == 10)
						printf("-");
					else
						if (count == 12)
							printf("-");
	}
}
int printb(int n, int i, int type)
{
	int count = 0;
	if (i == 0)
		return 0;

	count = printb(n >> 1, i - 1, type);
	if (n & 1)
		printf("1");
	else
		printf("0");
	n >>= 1;
	
	putDash(type, count);

	count++;
}

void pushCommand(unsigned short cmd, int type)
{
	printb(cmd, 15, type);
	printf("\n");
	
}