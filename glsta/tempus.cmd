#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Thu Dec  7 18:24:00 2023                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v22.10-p001_1 (64bit) 08/09/2022 17:51 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.10-p001_1 NR220728-0225/22_10-UB (database version 18.20.589) {superthreading v2.19}
#@(#)CDS: AAE 22.10-p001 (64bit) 08/09/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.10-p001_1 () Aug  8 2022 14:54:03 ( )
#@(#)CDS: SYNTECH 22.10-p001_1 () Aug  8 2022 11:26:34 ( )
#@(#)CDS: CPE v22.10-p001

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
