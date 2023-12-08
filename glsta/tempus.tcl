read_lib /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing/fast_vdd1v2_basicCells.lib

read_verilog ../layout/out/design.v
set_top_module filter_top

read_sdc ../layout/out/design.sdc
read_sdf ../layout/out/design.sdf
read_spef ../layout/out/design_default_rc.spef

report_timing -late -max_paths 3 > late.rpt
report_timing -early -max_paths 3 > early.rpt

report_timing  -from [all_inputs] -to [all_outputs] -max_paths 16 -path_type summary  > allpaths.rpt
report_timing  -from [all_inputs] -to [all_registers] -max_paths 16 -path_type summary  >> allpaths.rpt
report_timing  -from [all_registers] -to [all_registers] -max_paths 16 -path_type summary >> allpaths.rpt
report_timing  -from [all_registers] -to [all_outputs] -max_paths 16 -path_type summary >> allpaths.rpt
exit
