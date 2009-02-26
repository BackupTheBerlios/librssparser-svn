CC=gcc
CFLAGS=-Wall -W -g -D DEBUG -I../src/
LIBS=-lexpat -lcurl
LIBDIR=../src/
LIBVER=1.0
LIBNAME=librssparser
HDIR=../src/
OBJ=test.o

test: $(OBJ)
	$(CC) $(CFLAGS) $(LIBS) $(OBJ) $(LIBDIR)$(LIBNAME)-$(LIBVER).a -o test

test.o: test.c
	$(CC) $(CFLAGS) -c test.c

clean:
	rm -rf *.o
	rm -rf test
	rm -rf *~
