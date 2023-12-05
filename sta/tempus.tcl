read_lib /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing/fast_vdd1v2_basicCells.lib

read_verilog ../syn/outputs/cdf45_netlist.v
set_top_module filter_top

read_sdc ../syn/outputs/cdf45_constraints.sdc
read_sdf ../syn/outputs/cdf45_delays.sdf

report_timing -late -max_paths 3 > pipe_late.rpt
report_timing -early -max_paths 3 > pipe_early.rpt

report_timing  -from [all_inputs] -to [all_outputs] -max_paths 12 -path_type summary  > pipe_allpaths.rpt
report_timing  -from [all_inputs] -to [all_registers] -max_paths 12 -path_type summary  >> pipe_allpaths.rpt
report_timing  -from [all_registers] -to [all_registers] -max_paths 12 -path_type summary >> pipe_allpaths.rpt
report_timing  -from [all_registers] -to [all_outputs] -max_paths 12 -path_type summary >> pipe_allpaths.rpt
exit
