CC=g++

simplemath: 
	$(CC) -c simplemath.cpp; ls -alh simplemath.o

main: simplemath
	$(CC) simplemath.o main.cpp -o main; ls -alh

clean:
	rm main; rm simplemath.o; ls -alh

all: main 
	./main
