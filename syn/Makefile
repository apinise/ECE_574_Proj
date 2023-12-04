all: syn

syn:
	BASENAME=cdf45 \
		CLOCKPERIOD=10 \
		TIMINGPATH=/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing \
		TIMINGLIB=fast_vdd1v2_basicCells.lib \
		VERILOG='../rtl/filter_top.sv ../rtl/SPI.sv ../rtl/fir_transpose.sv ../rtl/mult12x12.sv' \
		genus -f genus_script.tcl

syn_cds130:
	BASENAME=cds130 \
		CLOCKPERIOD=10 \
		TIMINGPATH=/opt/skywater/libraries/sky130_fd_sc_hd/latest/timing \
		TIMINGLIB=sky130_fd_sc_hd__ss_n40C_1v76.lib \
		VERILOG='../rtl/fir_transpose.sv ../rtl/mult12x12.sv' \
		genus -f genus_script.tcl

clean:
	rm -rf outputs reports genus.log* genus.cmd* *~ fv