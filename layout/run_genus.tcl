if {![info exists ::env(CORENETLIST)] } {
    puts "Error: missing CORENETLIST"
    exit(0)
}
set corenetlist [getenv CORENETLIST]

if {![info exists ::env(LEF)] } {
    puts "Error: missing LEF"
    exit(0)
}
set lef [getenv LEF]

if {![info exists ::env(BASENAME)] } {
    set basename "default"
} else {
    set basename [getenv BASENAME]
}

set_db init_power_nets "VDD"
set_db init_ground_nets "VSS"
set_db hdl_resolve_instance_with_libcell true
set_db hdl_unconnected_value 0

read_mmmc "viewDefinition.tcl"

read_physical -lef $lef

read_hdl -netlist $corenetlist

elaborate

init_design

set_db auto_ungroup none
set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high

syn_generic
syn_map
syn_opt

file delete -force syndb
file mkdir syndb
set finalDb ./syndb/final
file mkdir $finalDb
write_design -encounter -basename $finalDb

file mkdir reports

report_timing > reports/${basename}_report_timing.rpt
report_power  > reports/${basename}_report_power.rpt
report_area   > reports/${basename}_report_area.rpt
report_qor    > reports/${basename}_report_qor.rpt

exit
