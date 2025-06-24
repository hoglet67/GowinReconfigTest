set_operating_conditions -grade c -model slow -speed 8 -setup -hold

create_clock -name sys_clk -period 37.037 -waveform {0 18.518} [get_ports {sys_clk}] -add
