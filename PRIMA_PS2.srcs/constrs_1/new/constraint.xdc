
# NEXYS A7
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E3} [get_ports {clk_old}]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk_old}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B2} [get_ports {data_pc2}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN F4} [get_ports {clk_pc2}]

#green
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M16} [get_ports {ok_led}]
#red
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N15} [get_ports {red_led}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J17} [get_ports {an[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J18} [get_ports {an[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T9} [get_ports {an[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J14} [get_ports {an[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P14} [get_ports {an[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T14} [get_ports {an[5]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K2} [get_ports {an[6]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U13} [get_ports {an[7]}]

set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T10} [get_ports {seg[0]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R10} [get_ports {seg[1]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K16} [get_ports {seg[2]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K13} [get_ports {seg[3]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P15} [get_ports {seg[4]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN T11} [get_ports {seg[5]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L18} [get_ports {seg[6]}]
set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN H15} [get_ports {seg[7]}]

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N17} [get_ports {set_button}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M18} [get_ports {reset_button}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN P17} [get_ports {read_button}]

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN J15} [get_ports {switch[0]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L16} [get_ports {switch[1]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M13} [get_ports {switch[2]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R15} [get_ports {switch[3]}]

# NEXYS 4 ---------------------------------------------------------------------------------

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E3} [get_ports {clk_old}]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {clk_old}]

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN B2} [get_ports {data_pc2}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN F4} [get_ports {clk_pc2}]

##green
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN H6} [get_ports {ok_led}]
##red
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K5} [get_ports {red_led}]

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N6} [get_ports {an[0]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M6} [get_ports {an[1]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M3} [get_ports {an[2]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N5} [get_ports {an[3]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N2} [get_ports {an[4]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N4} [get_ports {an[5]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L1} [get_ports {an[6]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M1} [get_ports {an[7]}]

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L3} [get_ports {seg[0]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN N1} [get_ports {seg[1]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L5} [get_ports {seg[2]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L4} [get_ports {seg[3]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN K3} [get_ports {seg[4]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M2} [get_ports {seg[5]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN L6} [get_ports {seg[6]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN M4} [get_ports {seg[7]}]

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN F15} [get_ports {reset_button}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN E16} [get_ports {set_button}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN V10} [get_ports {read_button}]

#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U9} [get_ports {switch[0]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN U8} [get_ports {switch[1]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R7} [get_ports {switch[2]}]
#set_property -dict {IOSTANDARD LVCMOS33 PACKAGE_PIN R6} [get_ports {switch[3]}]
