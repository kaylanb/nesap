cmake_minimum_required(VERSION 3.11.4)
project(test_project)
include_directories(include)
file(GLOB SOURCES "src/c_python_openmp/*.cpp")
# C code
#add_executable(hello2.exe ${SOURCES})

# Python code
add_subdirectory(lib/pybind11)
pybind11_add_module(hello_funcs src/c_python_openmp/hello_funcs.cpp)
