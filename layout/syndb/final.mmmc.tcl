#################################################################################
#
# Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Thu Dec 07 19:07:07 EST 2023
#
#################################################################################

## library_sets
create_library_set -name default_libs \
    -timing { /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/timing/fast_vdd1v2_basicCells.lib }

## opcond
create_opcond -name op_cond_default \
    -process 1.0 \
    -voltage 1.0 \
    -temperature 125.0

## timing_condition
create_timing_condition -name default_tc \
    -opcond op_cond_default \
    -library_sets { default_libs }

## rc_corner
create_rc_corner -name default_rc \
    -temperature 125.0 \
    -qrc_tech /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/qrc/qx/gpdk045.tch \
    -pre_route_res 1.0 \
    -pre_route_cap 1.0 \
    -pre_route_clock_res 0.0 \
    -pre_route_clock_cap 0.0 \
    -post_route_res {1.0 1.0 1.0} \
    -post_route_cap {1.0 1.0 1.0} \
    -post_route_cross_cap {1.0 1.0 1.0} \
    -post_route_clock_res {1.0 1.0 1.0} \
    -post_route_clock_cap {1.0 1.0 1.0} \
    -post_route_clock_cross_cap {1.0 1.0 1.0}

## delay_corner
create_delay_corner -name default_dc \
    -early_timing_condition { default_tc } \
    -late_timing_condition { default_tc } \
    -early_rc_corner default_rc \
    -late_rc_corner default_rc

## constraint_mode
create_constraint_mode -name default_const \
    -sdc_files { ./syndb/final.default_const.sdc }

## analysis_view
create_analysis_view -name func_default \
    -constraint_mode default_const \
    -delay_corner default_dc

## set_analysis_view
set_analysis_view -setup { func_default } \
                  -hold { func_default }
