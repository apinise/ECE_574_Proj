top:
	xrun \
      ../rtl/SPI.sv \
      ../rtl/filter_top.sv \
      ../rtl/fir_transpose.sv \
		  ../rtl/mult12x12.sv \
	    filter_top_tb.sv \
	-access +rwc \
	-top filter_top_tb 

spi:
	xrun \
      ../rtl/SPI.sv \
      ../rtl/memory.sv \
	    SPI_tb.sv \
	-access +rwc \
	-top SPI_tb 

 
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
	

