if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name default_libs\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast_vdd1v2_basicCells.lib]
create_opcond -name op_cond_default -process 1 -voltage 1 -temperature 125
create_timing_condition -name default_tc\
   -library_sets [list default_libs]\
   -opcond op_cond_default
create_rc_corner -name default_rc\
   -pre_route_res 1\
   -post_route_res {1 1 1}\
   -pre_route_cap 1\
   -post_route_cap {1 1 1}\
   -post_route_cross_cap {1 1 1}\
   -pre_route_clock_res 0\
   -pre_route_clock_cap 0\
   -post_route_clock_cap {1 1 1}\
   -post_route_clock_res {1 1 1}\
   -post_route_clock_cross_cap {1 1 1}\
   -temperature 125\
   -qrc_tech ${::IMEX::libVar}/mmmc/default_rc/gpdk045.tch
create_delay_corner -name default_dc\
   -early_timing_condition {default_tc}\
   -late_timing_condition {default_tc}\
   -rc_corner default_rc
create_constraint_mode -name default_const\
   -sdc_files\
    [list ${::IMEX::dataVar}/mmmc/modes/default_const/default_const.sdc]
create_analysis_view -name func_default -constraint_mode default_const -delay_corner default_dc -latency_file ${::IMEX::dataVar}/mmmc/views/func_default/latency.sdc
set_analysis_view -setup [list func_default] -hold [list func_default]
