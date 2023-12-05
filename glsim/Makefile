sim:
	xrun filter_top_tb.sv \
	-timescale 1ns/1ps \
	../layout/out/design.v \
	/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/verilog/fast_vdd1v0_basicCells.v \
	-define USE_SDF \
	-access +rwc \
	-top filter_top_tb


clean:
	rm -rf trace.vcd  xcelium.d  xrun.history  xrun.log xrun.key *~ *.sdf.X  *.log  waves.shm

