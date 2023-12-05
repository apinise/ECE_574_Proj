################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 12/04/2023 19:52:50
#
################################################################################
if { ![is_common_ui_mode] } { error "ERROR: This script requires common_ui to be active."}

read_mmmc ./syndb/final.mmmc.tcl

read_physical -lef {/opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/lef/gsclib045_tech.lef /opt/cadence/libraries/gsclib045_all_v4.7/gsclib045/lef/gsclib045_macro.lef}

read_netlist ./syndb/final.v

init_design
