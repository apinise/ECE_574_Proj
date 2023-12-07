
# XM-Sim Command File
# TOOL:	xmsim	22.09-s011
#

set tcl_prompt1 {puts -nonewline "xcelium> "}
set tcl_prompt2 {puts -nonewline "> "}
set vlog_format %h
set vhdl_format %v
set real_precision 6
set display_unit auto
set time_unit module
set heap_garbage_size -200
set heap_garbage_time 0
set assert_report_level note
set assert_stop_level error
set autoscope yes
set assert_1164_warnings yes
set pack_assert_off {}
set severity_pack_assert_off {note warning}
set assert_output_stop_level failed
set tcl_debug_level 0
set relax_path_name 1
set vhdl_vcdmap XX01ZX01X
set intovf_severity_level ERROR
set probe_screen_format 0
set rangecnst_severity_level ERROR
set textio_severity_level ERROR
set vital_timing_checks_on 1
set vlog_code_show_force 0
set assert_count_attempts 1
set tcl_all64 false
set tcl_runerror_exit false
set assert_report_incompletes 0
set show_force 1
set force_reset_by_reinvoke 0
set tcl_relaxed_literal 0
set probe_exclude_patterns {}
set probe_packed_limit 4k
set probe_unpacked_limit 16k
set assert_internal_msg no
set svseed 1
set assert_reporting_mode 0
set vcd_compact_mode 0
alias . run
alias quit exit
database -open -shm -into waves.shm waves -default
probe -create -database waves filter_top_tb.CS filter_top_tb.MISO filter_top_tb.MOSI filter_top_tb.Packet filter_top_tb.Packet_read filter_top_tb.SCK filter_top_tb.chkDout filter_top_tb.chkDout_r filter_top_tb.count filter_top_tb.din filter_top_tb.done filter_top_tb.dout filter_top_tb.fcoeff filter_top_tb.fileHandle filter_top_tb.fvectors filter_top_tb.mess filter_top_tb.packet_string filter_top_tb.r filter_top_tb.rands filter_top_tb.reset filter_top_tb.start filter_top_tb.t filter_top_tb.test_pass filter_top_tb.testbench_pass
probe -create -database waves filter_top_tb.dut.@{\fir_filter_sum_r[30] } filter_top_tb.dut.@{\fir_filter_sum_r[29] } filter_top_tb.dut.@{\fir_filter_sum_r[28] } filter_top_tb.dut.@{\fir_filter_sum_r[27] } filter_top_tb.dut.@{\fir_filter_sum_r[26] } filter_top_tb.dut.@{\fir_filter_sum_r[25] } filter_top_tb.dut.@{\fir_filter_sum_r[24] } filter_top_tb.dut.@{\fir_filter_sum_r[23] } filter_top_tb.dut.@{\fir_filter_sum_r[22] } filter_top_tb.dut.@{\fir_filter_sum_r[21] } filter_top_tb.dut.@{\fir_filter_sum_r[20] } filter_top_tb.dut.@{\fir_filter_sum_r[19] } filter_top_tb.dut.@{\fir_filter_sum_r[18] } filter_top_tb.dut.@{\fir_filter_sum_r[17] } filter_top_tb.dut.@{\fir_filter_sum_r[16] } filter_top_tb.dut.@{\fir_filter_sum_r[15] } filter_top_tb.dut.@{\fir_filter_sum_r[14] } filter_top_tb.dut.@{\fir_filter_sum_r[13] } filter_top_tb.dut.@{\fir_filter_sum_r[12] } filter_top_tb.dut.@{\fir_filter_sum_r[11] } filter_top_tb.dut.@{\fir_filter_sum_r[10] } filter_top_tb.dut.@{\fir_filter_sum_r[9] } filter_top_tb.dut.@{\fir_filter_sum_r[8] } filter_top_tb.dut.@{\fir_filter_sum_r[7] } filter_top_tb.dut.@{\fir_filter_sum_r[6] } filter_top_tb.dut.@{\fir_filter_sum_r[5] } filter_top_tb.dut.@{\fir_filter_sum_r[4] } filter_top_tb.dut.@{\fir_filter_sum_r[3] } filter_top_tb.dut.@{\fir_filter_sum_r[2] } filter_top_tb.dut.@{\fir_filter_sum_r[1] } filter_top_tb.dut.@{\fir_filter_sum_r[0] } filter_top_tb.dut.@{\fir_filter_coefficients_r[31] } filter_top_tb.dut.@{\fir_filter_coefficients_r[0] } filter_top_tb.dut.@{\fir_filter_coefficients_r[1] } filter_top_tb.dut.@{\fir_filter_coefficients_r[2] } filter_top_tb.dut.@{\fir_filter_coefficients_r[3] } filter_top_tb.dut.@{\fir_filter_coefficients_r[4] } filter_top_tb.dut.@{\fir_filter_coefficients_r[5] } filter_top_tb.dut.@{\fir_filter_coefficients_r[6] } filter_top_tb.dut.@{\fir_filter_coefficients_r[7] } filter_top_tb.dut.@{\fir_filter_coefficients_r[8] } filter_top_tb.dut.@{\fir_filter_coefficients_r[9] } filter_top_tb.dut.@{\fir_filter_coefficients_r[10] } filter_top_tb.dut.@{\fir_filter_coefficients_r[11] } filter_top_tb.dut.@{\fir_filter_coefficients_r[12] } filter_top_tb.dut.@{\fir_filter_coefficients_r[13] } filter_top_tb.dut.@{\fir_filter_coefficients_r[14] } filter_top_tb.dut.@{\fir_filter_coefficients_r[15] } filter_top_tb.dut.@{\fir_filter_coefficients_r[16] } filter_top_tb.dut.@{\fir_filter_coefficients_r[17] } filter_top_tb.dut.@{\fir_filter_coefficients_r[18] } filter_top_tb.dut.@{\fir_filter_coefficients_r[19] } filter_top_tb.dut.@{\fir_filter_coefficients_r[20] } filter_top_tb.dut.@{\fir_filter_coefficients_r[21] } filter_top_tb.dut.@{\fir_filter_coefficients_r[22] } filter_top_tb.dut.@{\fir_filter_coefficients_r[23] } filter_top_tb.dut.@{\fir_filter_coefficients_r[24] } filter_top_tb.dut.@{\fir_filter_coefficients_r[25] } filter_top_tb.dut.@{\fir_filter_coefficients_r[26] } filter_top_tb.dut.@{\fir_filter_coefficients_r[27] } filter_top_tb.dut.@{\fir_filter_coefficients_r[28] } filter_top_tb.dut.@{\fir_filter_coefficients_r[29] } filter_top_tb.dut.@{\fir_filter_coefficients_r[30] }

simvision -input /home/ebapinis/ECE_574_Proj/glsim/.simvision/28904_ebapinis__autosave.tcl.svcf
