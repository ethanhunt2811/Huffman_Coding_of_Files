CC = g++
CFLAGS = -std=c++11 -Wall

# List of source files
SRCS = decode.cpp encode.cpp huffman.cpp

# List of header files
HDRS = huffman.hpp

# List of object files
OBJS = $(SRCS:.cpp=.o)

# Executable names
DECODE_EXE = decode
ENCODE_EXE = encode

# Default target
all: $(DECODE_EXE) $(ENCODE_EXE)

# Compile source files into object files
%.o: %.cpp $(HDRS)
	$(CC) $(CFLAGS) -c $< -o $@

# Link object files into executables
$(DECODE_EXE): decode.o huffman.o
	$(CC) $(CFLAGS) $^ -o $@

$(ENCODE_EXE): encode.o huffman.o
	$(CC) $(CFLAGS) $^ -o $@

# Clean up object files and executables
clean:
	rm -f $(OBJS) $(DECODE_EXE) $(ENCODE_EXE)

