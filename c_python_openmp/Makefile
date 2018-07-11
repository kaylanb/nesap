CPP=g++
FLAGS=-std=gnu++11
FLAGSPY=-O3 -shared -std=gnu++11 -fPIC `python3-config --cflags --ldflags --libs`
INCL= -I .
PATHTOPY= -I ~/python_venvs/ml/include/site/python3.7

#########
# C code
#########

#hello: hello.o hello_funcs.o
#	$(CPP) -o hello hello.o hello_funcs.o $(INCL)
OBJS=hello.o hello_funcs.o
hello: $(OBJS)
	$(CPP) $(FLAGS) -o $@.exe $(OBJS) $(INCL)

#hello.o: hello.cpp hello.h
#	$(CPP) -c hello.cpp $(INCL)
#hello_funcs.o: hello_funcs.cpp hello.h
#	$(CPP) $(CPPFLAGS) -c hello_funcs.cpp $(INCL)
%.o: %.cpp hello.h
	$(CPP) $(FLAGS) -c $*.cpp $(INCL)

#########
# Python code
#########

# hello_py: hello_funcs.cpp hello.h
# 	g++ -O3 -shared -std=gnu++11 -I ~/python_venvs/ml/include/site/python3.7 \
# 	`python3-config --cflags --ldflags --libs` hello_funcs.cpp \
# 	-o hello_funcs.so -fPIC
hellopy: hello_funcs.cpp hello.h
	$(CPP) $(FLAGSPY) $(PATHTOPY) -o hello_funcs.so hello_funcs.cpp
