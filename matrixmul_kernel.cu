/* Matrix multiplication: P = M * N.
bal__
void MatrixMulKernel(float* MD, float Nd, float* Pd, int Width){
//calculate row index of the Pd element and M
	int Row = blockIdx.y*blockDim.y+threadIdx.y;
//calculate column index of Pd element and 	int Col = blockIdx.x*blockDim.x+threadIdx.x;
	if((Row < Width) && (Col < Width)){
		float Pvalue = 0.0;
		for(int k = 0; k < Width; ++k)
			Pvalue += Md[Row*Width+K] *Nd[k*Width+Col];
		PD[Row*Width+Col] = Pvalue;
		}
}
 * Device code.
 */

#ifndef _MATRIXMUL_KERNEL_H_
#define _MATRIXMUL_KERNEL_H_

#include <stdio.h>
#include "matrixmul.h"

// Matrix multiplication kernel thread specification
__global__ void MatrixMulKernel(Matrix M, Matrix N, Matrix P)
{
int Width = M.width; 
int Row = blockIdx.y*blockDim.y+threadIdx.y;
//calculate column index of Pd element and     
int Col = blockIdx.x*blockDim.x+threadIdx.x;
if((Row < Width) && (Col < Width)){
        float Pvalue = 0.0;
        for(int k = 0; k < Width; k++)
                Pvalue += M.elements[Row*Width+k]*N.elements[k*Width+Col];
                P.elements[Row*Width+Col] = Pvalue;
                }

}



#endif // #ifndef _MATRIXMUL_KERNEL_H_
