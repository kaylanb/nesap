EXE = hello.exe
SRC_DIR= src
OBJ_DIR= obj
CXX=g++
FLAGS=-std=gnu++11
FLAGSPY=-O3 -shared -std=gnu++11 -fPIC `python3-config --cflags --ldflags --libs`
INCL= -I ./include
PATHTOPY= -I ~/python_venvs/ml/include/site/python3.7

#########
# C code
#########

#SRCS=hello.cpp hello_funcs.cpp
#OBJS=hello.o hello_funcs.o
SRCS=$(wildcard $(SRC_DIR)/*.cpp)
OBJS = $(SRCS:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

all: $(EXE)

#hello: hello.o hello_funcs.o
#	$(CXX) -o hello hello.o hello_funcs.o $(INCL)
$(EXE): $(OBJS)
	$(CXX) $(FLAGS) -o $@ $^ $(INCL)

# Debug
#$(foreach v, $(.VARIABLES), $(info $(v) = $($(v))))

#hello.o: hello.cpp hello.h
#	$(CXX) -c hello.cpp $(INCL)
#hello_funcs.o: hello_funcs.cpp hello.h
#%.o: src/%.cpp hello.h
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(CXX) $(FLAGS) -c $< $(INCL) -o $@

clean:
	$(RM) $(OBJS)
#########
# Python code
#########

# hello_py: hello_funcs.cpp hello.h
# 	g++ -O3 -shared -std=gnu++11 -I ~/python_venvs/ml/include/site/python3.7 \
# 	`python3-config --cflags --ldflags --libs` hello_funcs.cpp \
# 	-o hello_funcs.so -fPIC
hellopy: hello_funcs.cpp hello.h
	$(CXX) $(FLAGSPY) $(PATHTOPY) -o hello_funcs.so hello_funcs.cpp
