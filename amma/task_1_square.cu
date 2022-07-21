#include <iostream>
using namespace std;

__global__ void square(float *d_out, float *d_in){
  int idx = threadIdx.x;
  float f = d_in[idx];
  d_out[idx] = f * f ;
}
__global__ void cube(float *d_out, float *d_in){
  int idx = threadIdx.x;
  float f = d_in[idx];
  d_out[idx] = f * f * f ;
}

int main(int argc, char const *argv[]) {

  const int ARRAY_SIZE = 64;
  const int ARRAY_BYTES = ARRAY_SIZE * sizeof(float);

  float h_in[ARRAY_SIZE];
  for(int i=0;i < ARRAY_SIZE;i++){
    h_in[i] = float(i);
  }

  float h_out[ARRAY_SIZE];

  float * d_in;
  float * d_out;


  cout << "Running square" << endl;
  cudaMalloc((void **) &d_in, ARRAY_BYTES);
  cudaMalloc((void **) &d_out, ARRAY_BYTES);


  cudaMemcpy(d_in, h_in, ARRAY_BYTES,cudaMemcpyHostToDevice );

  square<<<1, ARRAY_SIZE>>>(d_out, d_in);

  cudaMemcpy(h_out, d_out, ARRAY_BYTES,cudaMemcpyDeviceToHost );
  for(int i=0;i < ARRAY_SIZE;i++){
    cout << h_out[i] ;
    cout << (((i%4)!=3) ? "\t" : "\n");
  }

// For cube
  cout << "\n" ;
  cout << "Running Cube" << endl;
  for(int i=0;i < ARRAY_SIZE;i++){
    h_in[i] = float(i);
  }
  cudaMemcpy(d_in, h_in, ARRAY_BYTES,cudaMemcpyHostToDevice );

  cube<<<1, ARRAY_SIZE>>>(d_out, d_in);
  cudaMemcpy(h_out, d_out, ARRAY_BYTES,cudaMemcpyDeviceToHost );
  for(int i=0;i < ARRAY_SIZE;i++){
    cout << h_out[i] ;
    cout << (((i%4)!=3) ? "\t" : "\n");
  }




  cudaFree(d_in);
  cudaFree(d_out);

  return 0;
}
