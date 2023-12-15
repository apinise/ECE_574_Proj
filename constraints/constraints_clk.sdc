if {![info exists ::env(CLOCKPERIOD)] } {
  set clockPeriod 20
} else {
    set clockPeriod [getenv CLOCKPERIOD]
}

create_clock -name Clk -period $clockPeriod [get_ports "Clk"]

set_input_delay  0 -clock Clk [all_inputs -no_clocks]
set_output_delay 0 -clock Clk [all_outputs]

set_dont_touch chip/thepads true
