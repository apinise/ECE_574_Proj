sim_fir:
	xrun \
	    ../rtl/fir_transpose.sv \
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
	rm -rf trace.vcd  xcelium.d  xrun.history  xrun.log xrun.key *~ waves.shm
