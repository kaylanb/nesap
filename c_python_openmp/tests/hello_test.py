import unittest
# import our `pybind11`-based extension module from package python_cpp_example
import hello_funcs

class HelloCppTest(unittest.TestCase):
    def test_print_from_cpp(self):
        hello_funcs.myfunc()
        self.assertEqual(2,2)

if __name__ == '__main__':
    unittest.main()
