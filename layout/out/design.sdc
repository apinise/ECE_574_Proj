###############################################################
#  Generated by:      Cadence Innovus 21.18-s099_1
#  OS:                Linux x86_64(Host ID arc-schaumont-class-vm)
#  Generated on:      Thu Dec  7 19:25:22 2023
#  Design:            filter_top
#  Command:           write_sdc out/design.sdc
###############################################################
current_design filter_top
set_clock_gating_check -rise -setup 0 
set_clock_gating_check -fall -setup 0 
create_clock [get_ports {Clk}]  -name Clk -period 2.000000 -waveform {0.000000 1.000000}
set_propagated_clock  [get_clocks {Clk}]
set_propagated_clock  [get_ports {Clk}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[2]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[0]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[10]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {CS}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Reset}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[9]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[7]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[5]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[3]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[1]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[11]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {MOSI}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[8]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[6]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Din[4]}]
set_input_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {SCK}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[4]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[2]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[0]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {MISO}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[10]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[9]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[7]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[5]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[3]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[1]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[11]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[8]}]
set_output_delay -add_delay 0 -clock [get_clocks {Clk}] [get_ports {Dout[6]}]
