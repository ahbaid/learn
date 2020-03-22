CC=g++

simplemath: 
	$(CC) -c simplemath.cpp; ls -alh simplemath.o

main: simplemath
	$(CC) simplemath.o math.cpp -o math; ls -alh

clean:
	rm math; rm simplemath.o; ls -alh

all: main 
	./math
