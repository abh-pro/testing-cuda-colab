#include<stdio.h>
#include<time.h>
#include<cuda.h>
#include<stdlib.h>

__global__ void max_value(int *a, int *b) // kernel subroutine called from the host cpu to the gpu device
{
	int i = threadIdx.x; // getting the thread id 

	*b = a[0]; // equating the value of the address in c to a predefined value in a matrix.

	if(a[i] < *b) // getting the value from the address of c variable.
	{
		*b = a[i];
	}
}


int main(int argc, char *argv[])
{
	if(argc == 3)
	{
		int arr_size = atoi(argv[1]);
		int rem = atoi(argv[2]);
		srand(time(NULL)); // seed entry for max randomness
		int a[arr_size];
		int b;
		int *dev_a,*dev_b; // gpu parameters
		cudaMalloc((void **) &dev_a,arr_size*sizeof(int));
		cudaMalloc((void **) &dev_b,sizeof(int));

		for(int i=0;i<arr_size;i++)
		{
			a[i] = rand() % rem + i;
		}
		cudaMemcpy(dev_a,a,arr_size*sizeof(int),cudaMemcpyHostToDevice); // sending the array into gpu memory.
		max_value<<<1,arr_size>>>(dev_a,dev_b);
		cudaMemcpy(&b,dev_b,sizeof(int),cudaMemcpyDeviceToHost);
	    printf("\nmax =  %d ",b);
		cudaFree(dev_a);		// Free the allocated memory
		cudaFree(dev_b);
	}
	
	else if(argc > 3){
			printf("Too many args to be parsed\n");
	}
	else
	{
			printf("one argument required\n");
	}
	return 0;
}