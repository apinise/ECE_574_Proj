# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Fri Dec 08 01:42:01 EST 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design filter_top

create_clock -name "Clk" -period 2.0 -waveform {0.0 1.0} [get_ports Clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports Reset]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[11]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[10]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[9]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[8]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[7]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[6]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[5]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[4]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[3]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[2]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[1]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Din[0]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports SCK]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports CS]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports MOSI]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[11]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[10]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[9]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[8]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[7]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[6]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[5]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[4]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[3]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {Dout[0]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports MISO]
set_wire_load_mode "enclosed"
