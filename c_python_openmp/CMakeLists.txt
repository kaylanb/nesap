cmake_minimum_required(VERSION 3.11.4)
project(test_project)
include_directories(include)
file(GLOB SOURCES "src/*.cpp")
# C code
#add_executable(hello2.exe ${SOURCES})

# Python code
add_subdirectory(pybind11)
pybind11_add_module(hello_funcs src/hello_funcs.cpp)
