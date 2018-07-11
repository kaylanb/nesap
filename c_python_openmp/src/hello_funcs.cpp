#include <iostream>
#include "hello.h"
//#include <pybind11/pybind11.h>

void myfunc() {
  std::cout << "hello n from c++\n";
}

// namespace py = pybind11;
//
// PYBIND11_MODULE(hello_funcs, m) {
//     m.doc() = "pybind11 example plugin"; // optional module docstring
//
//     m.def("myfunc", &myfunc, "A function which prints");
// }
