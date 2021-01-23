#include<stdio.h>
#include<cuda.h>
#include<time.h>

__global__void hello()
{
	printf("GPU:: Hello world!!");
}

int main()
{
	hello<<1,10>>();
	cudaDeviceSynchronize();
	return 0;
}