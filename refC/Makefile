# Compilation Flags
CFLAGS = -std=c99

# Compilation Commands
all: fir run

main.o: main.c
	gcc -c $(CFLAGS) main.c -o main.o

Packet.o: Packet.c
	gcc -c $(CFLAGS) Packet.c -o Packet.o

fir: main.o Packet.o
	gcc -o fir main.o Packet.o -lm

# Run Command
run:
	./fir

# Clean Command
clean:
	rm -f fir *.o *~ packets.txt
