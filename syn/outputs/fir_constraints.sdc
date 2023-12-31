# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.18-s082_1 on Wed Dec 06 23:03:43 EST 2023

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design fir_transpose

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
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[7]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[6]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[5]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[4]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[3]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[2]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[1]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_address[0]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[7]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[6]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[5]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[4]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[3]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[2]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[1]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_address[0]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[11]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[10]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[9]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[8]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[7]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[6]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[5]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[4]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[3]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[2]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[1]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {write_value[0]}]
set_input_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports load]
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
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[11]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[10]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[9]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[8]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[7]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[6]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[5]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[4]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[3]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[2]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[1]}]
set_output_delay -clock [get_clocks Clk] -add_delay 0.0 [get_ports {read_value[0]}]
set_wire_load_mode "enclosed"
