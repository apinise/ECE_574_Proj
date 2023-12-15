power:
	BASENAME=filter_top \
		VCD=../glsim/trace.vcd \
		FRAME_COUNT=999 \
		TIMINGPATH=/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing \
		TIMINGLIB=fast_vdd1v2_basicCells.lib \
		VERILOG='../layout/out/design.v' \
		SPEF='../layout/out/design_default_rc.spef' \
		SDF='../layout/synout/cdf45_delays.sdf' \
		SDC='../layout/synout/cdf45_constraints.sdc' \
		joules -files joules_script.tcl

clean:
	rm -rf *~ *.db *.sdb fv joules_work *.data *.report *.png
