cmake_minimum_required(VERSION 3.11.4)
project(directory_test)
include_directories(include)
file(GLOB SOURCES "src/*.cpp")
add_executable(hello2.exe ${SOURCES})

# two options
# /Users/kaylanb/python_venvs/ml/include/site/python3.7/pybind11
# /Users/kaylanb/python_venvs/ml/lib/python3.7/site-packages/pybind11
#add_subdirectory(/Users/kaylanb/python_venvs/ml/lib/python3.7/site-packages/pybind11)
#pybind11_add_module(hello_funcs hello_funcs.cpp)
