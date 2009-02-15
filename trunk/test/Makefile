CC=gcc
CFLAGS=-Wall -W -g -D DEBUG
LIBS=-lexpat -lcurl
LIBDIR=../src/
LIBVER=1.0
LIBNAME=librssparser
HDIR=../src/
OBJ=test.o

test: $(OBJ)
	$(CC) $(CFLAGS) $(LIBS) $(LIBDIR)$(LIBNAME)-$(LIBVER).so $(OBJ) -o test

test.o: test.c
	$(CC) $(CFLAGS) -c test.c

clean:
	rm -rf *.o
	rm -rf test
	rm -rf *~
