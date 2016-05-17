// PointersToFunctions.cpp : Defines the entry point for the console application.
//

void (*pfunc)(void);
int  (*pfunc1)(int a, int b);

int  add(int a, int b)
{
	return a + b;
}


int sub(int a, int b)
{
	return a - b;
}

int(*functionParameters[8])(char *str, int size) = { 0 };


int print_mat_input_parameters(char *pch, int size)
{
	printf("print_mat_input_parameters\n");

	return 1;
}
int sub_mat_input_parameters(char *str, int size)
{

	printf("sub_mat_input_parameters\n");
	return -1;
}
int mult_mat_input_parameters(char *str, int size)
{

	printf("mult_mat_input_parameters\n");
	return -1;
}
int transpose_mat_input_parameters(char *str, int size)
{

	printf("transpose_mat_input_parameters\n");
	return -1;
}
int mult_scalar_input_parameters(char *str, int size)
{

	printf("mult_scalar_input_parameters\n");
	return -1;
}
int stop_input_parameters(char *str, int size)
{

	printf("stop_input_parameters\n");
	return -1;
}


int read_mat_input_parameters(char *pch, int size)
{
	printf("read_mat_input_parameters\n");
	return -1;
}
int add_mat_input_parameters(char *pch, int size)
{
	printf("read_mat_input_parameters\n");
	return -1;
}




int main(int argc, char argv[])
{
	pfunc1 = &add;
	int a = pfunc1(1, 2);
	printf("a = %d\n", a);
	pfunc1 = &sub;
	a = pfunc1(1, 2);
	printf("a = %d\n", a);



	functionParameters[0] = &read_mat_input_parameters;
	functionParameters[1] = &add_mat_input_parameters;
	functionParameters[2] = &print_mat_input_parameters;
	functionParameters[3] = &sub_mat_input_parameters;
	functionParameters[4] = &mult_mat_input_parameters;
	functionParameters[5] = &transpose_mat_input_parameters;
	functionParameters[6] = &mult_scalar_input_parameters;
	functionParameters[7] = &stop_input_parameters;


	for (int i = 0; i < 8; i++)
	{
		functionParameters[i]("A", 3);
	}

	int x;
	scanf("%d", &x);
	functionParameters[x]("Hello", 10);
	return 0;
}

