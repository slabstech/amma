cmake_minimum_required(VERSION 3.22)
find_package(CUDAToolkit REQUIRED)
project(amma CUDA)

set(CMAKE_CUDA_STANDARD 23)

add_executable(amma main.cu)

set_target_properties(amma PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)
