AR=ar
CC=gcc
CFLAGS=-W -Wall -g -D DEBUG -fPIC
CFLAGSLIB=-W -Wall -g -D DEBUG -shared -fPIC
LIBS=-lexpat
LIBNAME=librssparser
LIBVER=1.0
OBJ=rss.o rss_expat.o rss_list.o rss_iconv.o rss_clean.o

all: $(LIBNAME)-$(LIBVER).so $(LIBNAME)-$(LIBVER).a
$(LIBNAME)-$(LIBVER).so: $(OBJ)
	$(CC) $(CFLAGSLIB) -o $(LIBNAME)-$(LIBVER).so $(OBJ)

$(LIBNAME)-$(LIBVER).a: $(OBJ)
	$(AR) rsc $(LIBNAME)-$(LIBVER).a $(OBJ)

rss.o: rss.c rss.h rss_data.h rss_options.h
	$(CC) $(CFLAGS) -c rss.c

rss_expat.o: rss_expat.c rss_expat.h
	$(CC) $(CFLAGS) -c rss_expat.c

rss_list.o: rss_list.c rss_list.h
	$(CC) $(CFLAGS) -c rss_list.c

rss_iconv.o: rss_iconv.c rss_iconv.h
	$(CC) $(CFLAGS) -c rss_iconv.c

rss_clean.o: rss_clean.c rss_clean.h
	$(CC) $(CFLAGS) -c rss_clean.c

clean:
	rm -rf ${OBJ}
	rm -rf ${APP}
	rm -rf *~
	rm -rf test
	rm -rf *.so
	rm -rf *.a
