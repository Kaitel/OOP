#ifndef _MATRICES_HEADER_FILE

int checkNumber(char some_string, long *value);
void read_mat(int** matrix);
void matrix_mult(int **A, int **B, int **S, int size);
void free_matrix(int **A, int size);
void print_matrix(int **S, int size);
void init_matrix(int **A, int dimSize, int value);
int **matrix_sub(int  **matrixA, int  **matrixB, int ** matOutput, int matrixDim);
int **matrix_sum(int  **matrixA, int  **matrixB, int ** matOutput, int matrixDim);
int **allocateMatrix(int matrixDim);



#endif 