# amma
 self aware replica

Parallel Program using CUDA

* task _ Square
    * cd src
    * nvcc task_1_square.cu -o task_1 && task_1



* task1

    * cd src
    * nvcc task1.cu StopWatch.cpp -o add_cuda
    * ./add_cuda

* task2
    * cd src
    * nvcc task2.cu StopWatch.cpp  -o runGpu
    * ./runGpu

* task3

    * cd src
    * CPU code

            * g++ task3.cpp StopWatch.cpp -o runCPU
        * ./runCPU polygons_indoor.txt
            * plot "polygons_indoor.txt" w filledcurves closed, 'points.txt' with lp

    * GPU code

      	* nvcc task3_gpu.cu StopWatch.cpp -o runGPU
      	* ./runGPU polygons_indoor.txt
      	* plot "polygons_indoor.txt" w filledcurves closed, 'points.txt' with lp

* task4

    * cd src
    * CPU code

            * g++ task4_gpu.cu StopWatch.cpp -o runCPU
            * ./runCPU ../data/polygons_indoor.txt
            * plot "polygons_indoor.txt" w filledcurves closed, 'points.txt' with lp, "path.txt" with lp

    * GPU code

            * nvcc task4_gpu.cu StopWatch.cpp -o runGPU
            * ./runGPU ../data/polygons_indoor.txt
            * plot "polygons_indoor.txt" w filledcurves closed, 'points.txt' with lp, "path.txt" with lp

nvcc task4.cu StopWatch.cpp -o runGpu && ./runGpu ../data/polygons_2.txt

