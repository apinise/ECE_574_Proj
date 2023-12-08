all: syn

loop:
	@for CLOCKPERIOD in $$(seq $(L) $(I) $(R)); do \
		echo "New Run"; \
		make cds45 CLOCK=$$CLOCKPERIOD; \
    make cdf45 CLOCK=$$CLOCKPERIOD; \
    make cds130 CLOCK=$$CLOCKPERIOD; \
    echo "ALL Tests finished"; \
	done

cdf45:
	BASENAME=cdf45 \
		CLOCKPERIOD=$(CLOCK) \
    TRAIL=$(CLOCK) \
		TIMINGPATH=/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing \
		TIMINGLIB=fast_vdd1v2_basicCells.lib \
		VERILOG='../rtl/filter_top.sv ../rtl/SPI.sv ../rtl/fir_transpose.sv ../rtl/mult12x12.sv' \
		genus -f genus_script2.tcl
   
cds45:
	BASENAME=cds45 \
		CLOCKPERIOD=$(CLOCK) \
    TRAIL=$(CLOCK) \
		TIMINGPATH=/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing \
		TIMINGLIB=slow_vdd1v0_basicCells.lib \
		VERILOG='../rtl/filter_top.sv ../rtl/SPI.sv ../rtl/fir_transpose.sv ../rtl/mult12x12.sv' \
		genus -f genus_script2.tcl
   
cds130:
	BASENAME=cds130 \
		CLOCKPERIOD=$(CLOCK) \
    TRAIL=$(CLOCK) \
		TIMINGPATH=/opt/skywater/libraries/sky130_fd_sc_hd/latest/timing \
		TIMINGLIB=sky130_fd_sc_hd__ss_n40C_1v76.lib \
		VERILOG='../rtl/filter_top.sv ../rtl/SPI.sv ../rtl/fir_transpose.sv ../rtl/mult12x12.sv' \
		genus -f genus_script2.tcl
   
syn_fir:
	BASENAME=fir \
		CLOCKPERIOD=2 \
		TIMINGPATH=/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing \
		TIMINGLIB=fast_vdd1v2_basicCells.lib \
		VERILOG='../rtl/fir_transpose.sv ../rtl/mult12x12.sv' \
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