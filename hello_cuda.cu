#include<stdio.h>
#include<cuda.h>
#include<time.h>

__global__ void hello()
{
	printf("GPU:: Hello world!!\n");
}

int main()
{
	hello<<<1,10>>>();
	cudaDeviceSynchronize();
	return 0;
}