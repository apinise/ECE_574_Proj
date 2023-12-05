#######################################################
#                                                     
#  Tempus Timing Signoff Solution Command Logging File                     
#  Created on Mon Dec  4 18:54:19 2023                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Signoff Solution v22.10-p001_1 (64bit) 08/09/2022 17:51 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.10-p001_1 NR220728-0225/22_10-UB (database version 18.20.589) {superthreading v2.19}
#@(#)CDS: AAE 22.10-p001 (64bit) 08/09/2022 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.10-p001_1 () Aug  8 2022 14:54:03 ( )
#@(#)CDS: SYNTECH 22.10-p001_1 () Aug  8 2022 11:26:34 ( )
#@(#)CDS: CPE v22.10-p001

read_lib /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing/fast_vdd1v2_basicCells.lib
read_verilog ../syn/outputs/cdf45.v
set_top_module filter_top
