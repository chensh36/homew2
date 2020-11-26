# #####################################################################
# function name: makefile
# description: this script compiles only the files you change since the
#				last compilation and links the files together to make a
#				running file named prog
#######################################################################

# Compiler
CC=gcc
# Flags 
CFLAGS=-g -Wall -std=c99
# Linker
CCLINK= $(CC)
# Objects to link together
OBJS=main.o file0.o file1.o file2.o file3.o file4.o 
# Name of file
EXEC=prog
# The remove file command
RM=rm -rf

# linking
all: $(OBJS)
	$(CCLINK) $(OBJS) -o prog.exe
# objects connections
		
file0.o: file0.c file0.h file1.h file2.h file3.h file4.h
	$(CC) $(CFLAGS) -c file0.c
		
file1.o: file1.c file1.h file0.h
	$(CC) $(CFLAGS) -c file1.c
		
file2.o: file2.c file2.h file1.h file3.h file4.h
	$(CC) $(CFLAGS) -c file2.c
		
file3.o: file3.c file3.h file0.h file2.h
	$(CC) $(CFLAGS) -c file3.c
		
file4.o: file4.c file4.h file0.h file1.h
	$(CC) $(CFLAGS) -c file4.c
		
main.o: main.c file0.h file1.h file2.h file3.h file4.h
		$(CC) $(CFLAGS) -c main.c
		
# remove file		
clean:
	$(RM) *.o *.exe

