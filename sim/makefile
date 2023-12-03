

all: packet spi

spi:
	xrun \
      ../rtl/SPI.sv \
      ../rtl/memory.sv \
	    SPI_tb.sv \
	-access +rwc \
	-top SPI_tb 

packet: 
	gcc -std=c99 -o packet_program Packet.c
	./packet_program

 
sim_fir:
	xrun \
	    ../rtl/fir_transpose.sv \
		../rtl/mult12x12.sv \
	    fir_tb.sv \
	-access +rwc \
	-top fir_tb 

sim_mult:
	xrun \
	    ../rtl/mult12x12.sv \
	    mult_tb.sv \
	-access +rwc -gui \
	-top mult_tb 

clean:
	rm -rf trace.vcd xcelium.d xrun.history xrun.log xrun.key *~ waves.shm
	truncate -s 0 packets.txt packets_read.txt

