#set_property PACKAGE_PIN H9 [get_ports SYSCLK_P]
#set_property IOSTANDARD LVDS [get_ports SYSCLK_P]
#set_property PACKAGE_PIN G9 [get_ports SYSCLK_N]
#set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
#set_property PACKAGE_PIN H9 [get_ports clk]
#set_property IOSTANDARD LVCMOS33 [get_ports clk]

#set_property IOSTANDARD LVDS [get_ports SYSCLK_N]
#set_property PACKAGE_PIN R10 [get_ports SYSCLK_P]
#set_property PACKAGE_PIN R9 [get_ports SYSCLK_N]
#set_property IOSTANDARD LVDS [get_ports SYSCLK_P]

set_property IOSTANDARD DIFF_SSTL12 [get_ports SYSCLK_P]



set_property PACKAGE_PIN AL8 [get_ports SYSCLK_P]
set_property PACKAGE_PIN AL7 [get_ports SYSCLK_N]
set_property IOSTANDARD DIFF_SSTL12 [get_ports SYSCLK_N]


set_property PACKAGE_PIN E13 [get_ports UART_rxd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_rxd]
set_property PACKAGE_PIN F13 [get_ports UART_txd]
set_property IOSTANDARD LVCMOS33 [get_ports UART_txd]


#sfp0
set_property PACKAGE_PIN A12 [get_ports {sfp_tx_dis[0]}]
#set_property IOSTANDARD LVCMOS25 [get_ports {sfp_tx_dis[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sfp_tx_dis[0]}]
set_property PACKAGE_PIN GTHE4_CHANNEL_X1Y12 [get_ports s*_txp]
set_property PACKAGE_PIN GTHE4_CHANNEL_X1Y12 [get_ports s*_rxp]
set_property PACKAGE_PIN GTHE4_CHANNEL_X1Y12 [get_ports s*_txn]
set_property PACKAGE_PIN GTHE4_CHANNEL_X1Y12 [get_ports s*_rxn]


#USER_MGT_SI570_CLOCK2_C_P
set_property PACKAGE_PIN C8 [get_ports mgt_clk_clk_p]
# User SMA MGT Clock
#set_property PACKAGE_PIN N27     [get_ports mgt_clk_clk_p]
# FMC_HPC0_GBTCLK1_M2C_C_P  B20 Clock
#set_property PACKAGE_PIN  L8     [get_ports mgt_clk_clk_p]

#set_property IOSTANDARD LVCMOS25 [get_ports mgt_clk_*]
create_clock -period 8.000 -name gt_ref_clk [get_ports mgt_clk_clk_p]

#LED 2 and 3
# led 0 .. 7 => ag14, af13, ae13, aj14, aj15, ah13, ah14, al12
set_property IOSTANDARD LVCMOS25 [get_ports *led]
#set_property PACKAGE_PIN    ag14  [get_ports axil_resetN_led]
set_property PACKAGE_PIN    af13  [get_ports axil_reset_led]
#set_property PACKAGE_PIN    ae13  [get_ports axi_lite_clkN_led]
set_property PACKAGE_PIN    aj14  [get_ports axi_lite_clk_led]
#set_property PACKAGE_PIN    aj15  [get_ports mgt_clkN_led]
set_property PACKAGE_PIN    ah13  [get_ports mgt_clk_led]
set_property PACKAGE_PIN    ah14  [get_ports rx_clk_led]

#create_clock -period 5.000 -name SYSCLK_P -waveform {0.000 2.500} -add [get_ports SYSCLK_P]
create_clock -period 3.333 -name SYSCLK_P -waveform {0.000 1.667} -add [get_ports SYSCLK_P]


create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list host_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 40 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {top/target/tile_1/core/csr_io_trace_0_iaddr[0]} {top/target/tile_1/core/csr_io_trace_0_iaddr[1]} {top/target/tile_1/core/csr_io_trace_0_iaddr[2]} {top/target/tile_1/core/csr_io_trace_0_iaddr[3]} {top/target/tile_1/core/csr_io_trace_0_iaddr[4]} {top/target/tile_1/core/csr_io_trace_0_iaddr[5]} {top/target/tile_1/core/csr_io_trace_0_iaddr[6]} {top/target/tile_1/core/csr_io_trace_0_iaddr[7]} {top/target/tile_1/core/csr_io_trace_0_iaddr[8]} {top/target/tile_1/core/csr_io_trace_0_iaddr[9]} {top/target/tile_1/core/csr_io_trace_0_iaddr[10]} {top/target/tile_1/core/csr_io_trace_0_iaddr[11]} {top/target/tile_1/core/csr_io_trace_0_iaddr[12]} {top/target/tile_1/core/csr_io_trace_0_iaddr[13]} {top/target/tile_1/core/csr_io_trace_0_iaddr[14]} {top/target/tile_1/core/csr_io_trace_0_iaddr[15]} {top/target/tile_1/core/csr_io_trace_0_iaddr[16]} {top/target/tile_1/core/csr_io_trace_0_iaddr[17]} {top/target/tile_1/core/csr_io_trace_0_iaddr[18]} {top/target/tile_1/core/csr_io_trace_0_iaddr[19]} {top/target/tile_1/core/csr_io_trace_0_iaddr[20]} {top/target/tile_1/core/csr_io_trace_0_iaddr[21]} {top/target/tile_1/core/csr_io_trace_0_iaddr[22]} {top/target/tile_1/core/csr_io_trace_0_iaddr[23]} {top/target/tile_1/core/csr_io_trace_0_iaddr[24]} {top/target/tile_1/core/csr_io_trace_0_iaddr[25]} {top/target/tile_1/core/csr_io_trace_0_iaddr[26]} {top/target/tile_1/core/csr_io_trace_0_iaddr[27]} {top/target/tile_1/core/csr_io_trace_0_iaddr[28]} {top/target/tile_1/core/csr_io_trace_0_iaddr[29]} {top/target/tile_1/core/csr_io_trace_0_iaddr[30]} {top/target/tile_1/core/csr_io_trace_0_iaddr[31]} {top/target/tile_1/core/csr_io_trace_0_iaddr[32]} {top/target/tile_1/core/csr_io_trace_0_iaddr[33]} {top/target/tile_1/core/csr_io_trace_0_iaddr[34]} {top/target/tile_1/core/csr_io_trace_0_iaddr[35]} {top/target/tile_1/core/csr_io_trace_0_iaddr[36]} {top/target/tile_1/core/csr_io_trace_0_iaddr[37]} {top/target/tile_1/core/csr_io_trace_0_iaddr[38]} {top/target/tile_1/core/csr_io_trace_0_iaddr[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {top/target/tile_1/core/csr_io_trace_0_insn[0]} {top/target/tile_1/core/csr_io_trace_0_insn[1]} {top/target/tile_1/core/csr_io_trace_0_insn[2]} {top/target/tile_1/core/csr_io_trace_0_insn[3]} {top/target/tile_1/core/csr_io_trace_0_insn[4]} {top/target/tile_1/core/csr_io_trace_0_insn[5]} {top/target/tile_1/core/csr_io_trace_0_insn[6]} {top/target/tile_1/core/csr_io_trace_0_insn[7]} {top/target/tile_1/core/csr_io_trace_0_insn[8]} {top/target/tile_1/core/csr_io_trace_0_insn[9]} {top/target/tile_1/core/csr_io_trace_0_insn[10]} {top/target/tile_1/core/csr_io_trace_0_insn[11]} {top/target/tile_1/core/csr_io_trace_0_insn[12]} {top/target/tile_1/core/csr_io_trace_0_insn[13]} {top/target/tile_1/core/csr_io_trace_0_insn[14]} {top/target/tile_1/core/csr_io_trace_0_insn[15]} {top/target/tile_1/core/csr_io_trace_0_insn[16]} {top/target/tile_1/core/csr_io_trace_0_insn[17]} {top/target/tile_1/core/csr_io_trace_0_insn[18]} {top/target/tile_1/core/csr_io_trace_0_insn[19]} {top/target/tile_1/core/csr_io_trace_0_insn[20]} {top/target/tile_1/core/csr_io_trace_0_insn[21]} {top/target/tile_1/core/csr_io_trace_0_insn[22]} {top/target/tile_1/core/csr_io_trace_0_insn[23]} {top/target/tile_1/core/csr_io_trace_0_insn[24]} {top/target/tile_1/core/csr_io_trace_0_insn[25]} {top/target/tile_1/core/csr_io_trace_0_insn[26]} {top/target/tile_1/core/csr_io_trace_0_insn[27]} {top/target/tile_1/core/csr_io_trace_0_insn[28]} {top/target/tile_1/core/csr_io_trace_0_insn[29]} {top/target/tile_1/core/csr_io_trace_0_insn[30]} {top/target/tile_1/core/csr_io_trace_0_insn[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 40 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {top/target/tile/core/csr_io_trace_0_iaddr[0]} {top/target/tile/core/csr_io_trace_0_iaddr[1]} {top/target/tile/core/csr_io_trace_0_iaddr[2]} {top/target/tile/core/csr_io_trace_0_iaddr[3]} {top/target/tile/core/csr_io_trace_0_iaddr[4]} {top/target/tile/core/csr_io_trace_0_iaddr[5]} {top/target/tile/core/csr_io_trace_0_iaddr[6]} {top/target/tile/core/csr_io_trace_0_iaddr[7]} {top/target/tile/core/csr_io_trace_0_iaddr[8]} {top/target/tile/core/csr_io_trace_0_iaddr[9]} {top/target/tile/core/csr_io_trace_0_iaddr[10]} {top/target/tile/core/csr_io_trace_0_iaddr[11]} {top/target/tile/core/csr_io_trace_0_iaddr[12]} {top/target/tile/core/csr_io_trace_0_iaddr[13]} {top/target/tile/core/csr_io_trace_0_iaddr[14]} {top/target/tile/core/csr_io_trace_0_iaddr[15]} {top/target/tile/core/csr_io_trace_0_iaddr[16]} {top/target/tile/core/csr_io_trace_0_iaddr[17]} {top/target/tile/core/csr_io_trace_0_iaddr[18]} {top/target/tile/core/csr_io_trace_0_iaddr[19]} {top/target/tile/core/csr_io_trace_0_iaddr[20]} {top/target/tile/core/csr_io_trace_0_iaddr[21]} {top/target/tile/core/csr_io_trace_0_iaddr[22]} {top/target/tile/core/csr_io_trace_0_iaddr[23]} {top/target/tile/core/csr_io_trace_0_iaddr[24]} {top/target/tile/core/csr_io_trace_0_iaddr[25]} {top/target/tile/core/csr_io_trace_0_iaddr[26]} {top/target/tile/core/csr_io_trace_0_iaddr[27]} {top/target/tile/core/csr_io_trace_0_iaddr[28]} {top/target/tile/core/csr_io_trace_0_iaddr[29]} {top/target/tile/core/csr_io_trace_0_iaddr[30]} {top/target/tile/core/csr_io_trace_0_iaddr[31]} {top/target/tile/core/csr_io_trace_0_iaddr[32]} {top/target/tile/core/csr_io_trace_0_iaddr[33]} {top/target/tile/core/csr_io_trace_0_iaddr[34]} {top/target/tile/core/csr_io_trace_0_iaddr[35]} {top/target/tile/core/csr_io_trace_0_iaddr[36]} {top/target/tile/core/csr_io_trace_0_iaddr[37]} {top/target/tile/core/csr_io_trace_0_iaddr[38]} {top/target/tile/core/csr_io_trace_0_iaddr[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {top/target/tile/core/csr_io_trace_0_insn[0]} {top/target/tile/core/csr_io_trace_0_insn[1]} {top/target/tile/core/csr_io_trace_0_insn[2]} {top/target/tile/core/csr_io_trace_0_insn[3]} {top/target/tile/core/csr_io_trace_0_insn[4]} {top/target/tile/core/csr_io_trace_0_insn[5]} {top/target/tile/core/csr_io_trace_0_insn[6]} {top/target/tile/core/csr_io_trace_0_insn[7]} {top/target/tile/core/csr_io_trace_0_insn[8]} {top/target/tile/core/csr_io_trace_0_insn[9]} {top/target/tile/core/csr_io_trace_0_insn[10]} {top/target/tile/core/csr_io_trace_0_insn[11]} {top/target/tile/core/csr_io_trace_0_insn[12]} {top/target/tile/core/csr_io_trace_0_insn[13]} {top/target/tile/core/csr_io_trace_0_insn[14]} {top/target/tile/core/csr_io_trace_0_insn[15]} {top/target/tile/core/csr_io_trace_0_insn[16]} {top/target/tile/core/csr_io_trace_0_insn[17]} {top/target/tile/core/csr_io_trace_0_insn[18]} {top/target/tile/core/csr_io_trace_0_insn[19]} {top/target/tile/core/csr_io_trace_0_insn[20]} {top/target/tile/core/csr_io_trace_0_insn[21]} {top/target/tile/core/csr_io_trace_0_insn[22]} {top/target/tile/core/csr_io_trace_0_insn[23]} {top/target/tile/core/csr_io_trace_0_insn[24]} {top/target/tile/core/csr_io_trace_0_insn[25]} {top/target/tile/core/csr_io_trace_0_insn[26]} {top/target/tile/core/csr_io_trace_0_insn[27]} {top/target/tile/core/csr_io_trace_0_insn[28]} {top/target/tile/core/csr_io_trace_0_insn[29]} {top/target/tile/core/csr_io_trace_0_insn[30]} {top/target/tile/core/csr_io_trace_0_insn[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 40 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {top/target/tile_2/core/csr_io_trace_0_iaddr[0]} {top/target/tile_2/core/csr_io_trace_0_iaddr[1]} {top/target/tile_2/core/csr_io_trace_0_iaddr[2]} {top/target/tile_2/core/csr_io_trace_0_iaddr[3]} {top/target/tile_2/core/csr_io_trace_0_iaddr[4]} {top/target/tile_2/core/csr_io_trace_0_iaddr[5]} {top/target/tile_2/core/csr_io_trace_0_iaddr[6]} {top/target/tile_2/core/csr_io_trace_0_iaddr[7]} {top/target/tile_2/core/csr_io_trace_0_iaddr[8]} {top/target/tile_2/core/csr_io_trace_0_iaddr[9]} {top/target/tile_2/core/csr_io_trace_0_iaddr[10]} {top/target/tile_2/core/csr_io_trace_0_iaddr[11]} {top/target/tile_2/core/csr_io_trace_0_iaddr[12]} {top/target/tile_2/core/csr_io_trace_0_iaddr[13]} {top/target/tile_2/core/csr_io_trace_0_iaddr[14]} {top/target/tile_2/core/csr_io_trace_0_iaddr[15]} {top/target/tile_2/core/csr_io_trace_0_iaddr[16]} {top/target/tile_2/core/csr_io_trace_0_iaddr[17]} {top/target/tile_2/core/csr_io_trace_0_iaddr[18]} {top/target/tile_2/core/csr_io_trace_0_iaddr[19]} {top/target/tile_2/core/csr_io_trace_0_iaddr[20]} {top/target/tile_2/core/csr_io_trace_0_iaddr[21]} {top/target/tile_2/core/csr_io_trace_0_iaddr[22]} {top/target/tile_2/core/csr_io_trace_0_iaddr[23]} {top/target/tile_2/core/csr_io_trace_0_iaddr[24]} {top/target/tile_2/core/csr_io_trace_0_iaddr[25]} {top/target/tile_2/core/csr_io_trace_0_iaddr[26]} {top/target/tile_2/core/csr_io_trace_0_iaddr[27]} {top/target/tile_2/core/csr_io_trace_0_iaddr[28]} {top/target/tile_2/core/csr_io_trace_0_iaddr[29]} {top/target/tile_2/core/csr_io_trace_0_iaddr[30]} {top/target/tile_2/core/csr_io_trace_0_iaddr[31]} {top/target/tile_2/core/csr_io_trace_0_iaddr[32]} {top/target/tile_2/core/csr_io_trace_0_iaddr[33]} {top/target/tile_2/core/csr_io_trace_0_iaddr[34]} {top/target/tile_2/core/csr_io_trace_0_iaddr[35]} {top/target/tile_2/core/csr_io_trace_0_iaddr[36]} {top/target/tile_2/core/csr_io_trace_0_iaddr[37]} {top/target/tile_2/core/csr_io_trace_0_iaddr[38]} {top/target/tile_2/core/csr_io_trace_0_iaddr[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 32 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {top/target/tile_2/core/csr_io_trace_0_insn[0]} {top/target/tile_2/core/csr_io_trace_0_insn[1]} {top/target/tile_2/core/csr_io_trace_0_insn[2]} {top/target/tile_2/core/csr_io_trace_0_insn[3]} {top/target/tile_2/core/csr_io_trace_0_insn[4]} {top/target/tile_2/core/csr_io_trace_0_insn[5]} {top/target/tile_2/core/csr_io_trace_0_insn[6]} {top/target/tile_2/core/csr_io_trace_0_insn[7]} {top/target/tile_2/core/csr_io_trace_0_insn[8]} {top/target/tile_2/core/csr_io_trace_0_insn[9]} {top/target/tile_2/core/csr_io_trace_0_insn[10]} {top/target/tile_2/core/csr_io_trace_0_insn[11]} {top/target/tile_2/core/csr_io_trace_0_insn[12]} {top/target/tile_2/core/csr_io_trace_0_insn[13]} {top/target/tile_2/core/csr_io_trace_0_insn[14]} {top/target/tile_2/core/csr_io_trace_0_insn[15]} {top/target/tile_2/core/csr_io_trace_0_insn[16]} {top/target/tile_2/core/csr_io_trace_0_insn[17]} {top/target/tile_2/core/csr_io_trace_0_insn[18]} {top/target/tile_2/core/csr_io_trace_0_insn[19]} {top/target/tile_2/core/csr_io_trace_0_insn[20]} {top/target/tile_2/core/csr_io_trace_0_insn[21]} {top/target/tile_2/core/csr_io_trace_0_insn[22]} {top/target/tile_2/core/csr_io_trace_0_insn[23]} {top/target/tile_2/core/csr_io_trace_0_insn[24]} {top/target/tile_2/core/csr_io_trace_0_insn[25]} {top/target/tile_2/core/csr_io_trace_0_insn[26]} {top/target/tile_2/core/csr_io_trace_0_insn[27]} {top/target/tile_2/core/csr_io_trace_0_insn[28]} {top/target/tile_2/core/csr_io_trace_0_insn[29]} {top/target/tile_2/core/csr_io_trace_0_insn[30]} {top/target/tile_2/core/csr_io_trace_0_insn[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 40 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {top/target/tile_3/core/csr_io_trace_0_iaddr[0]} {top/target/tile_3/core/csr_io_trace_0_iaddr[1]} {top/target/tile_3/core/csr_io_trace_0_iaddr[2]} {top/target/tile_3/core/csr_io_trace_0_iaddr[3]} {top/target/tile_3/core/csr_io_trace_0_iaddr[4]} {top/target/tile_3/core/csr_io_trace_0_iaddr[5]} {top/target/tile_3/core/csr_io_trace_0_iaddr[6]} {top/target/tile_3/core/csr_io_trace_0_iaddr[7]} {top/target/tile_3/core/csr_io_trace_0_iaddr[8]} {top/target/tile_3/core/csr_io_trace_0_iaddr[9]} {top/target/tile_3/core/csr_io_trace_0_iaddr[10]} {top/target/tile_3/core/csr_io_trace_0_iaddr[11]} {top/target/tile_3/core/csr_io_trace_0_iaddr[12]} {top/target/tile_3/core/csr_io_trace_0_iaddr[13]} {top/target/tile_3/core/csr_io_trace_0_iaddr[14]} {top/target/tile_3/core/csr_io_trace_0_iaddr[15]} {top/target/tile_3/core/csr_io_trace_0_iaddr[16]} {top/target/tile_3/core/csr_io_trace_0_iaddr[17]} {top/target/tile_3/core/csr_io_trace_0_iaddr[18]} {top/target/tile_3/core/csr_io_trace_0_iaddr[19]} {top/target/tile_3/core/csr_io_trace_0_iaddr[20]} {top/target/tile_3/core/csr_io_trace_0_iaddr[21]} {top/target/tile_3/core/csr_io_trace_0_iaddr[22]} {top/target/tile_3/core/csr_io_trace_0_iaddr[23]} {top/target/tile_3/core/csr_io_trace_0_iaddr[24]} {top/target/tile_3/core/csr_io_trace_0_iaddr[25]} {top/target/tile_3/core/csr_io_trace_0_iaddr[26]} {top/target/tile_3/core/csr_io_trace_0_iaddr[27]} {top/target/tile_3/core/csr_io_trace_0_iaddr[28]} {top/target/tile_3/core/csr_io_trace_0_iaddr[29]} {top/target/tile_3/core/csr_io_trace_0_iaddr[30]} {top/target/tile_3/core/csr_io_trace_0_iaddr[31]} {top/target/tile_3/core/csr_io_trace_0_iaddr[32]} {top/target/tile_3/core/csr_io_trace_0_iaddr[33]} {top/target/tile_3/core/csr_io_trace_0_iaddr[34]} {top/target/tile_3/core/csr_io_trace_0_iaddr[35]} {top/target/tile_3/core/csr_io_trace_0_iaddr[36]} {top/target/tile_3/core/csr_io_trace_0_iaddr[37]} {top/target/tile_3/core/csr_io_trace_0_iaddr[38]} {top/target/tile_3/core/csr_io_trace_0_iaddr[39]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 32 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {top/target/tile_3/core/csr_io_trace_0_insn[0]} {top/target/tile_3/core/csr_io_trace_0_insn[1]} {top/target/tile_3/core/csr_io_trace_0_insn[2]} {top/target/tile_3/core/csr_io_trace_0_insn[3]} {top/target/tile_3/core/csr_io_trace_0_insn[4]} {top/target/tile_3/core/csr_io_trace_0_insn[5]} {top/target/tile_3/core/csr_io_trace_0_insn[6]} {top/target/tile_3/core/csr_io_trace_0_insn[7]} {top/target/tile_3/core/csr_io_trace_0_insn[8]} {top/target/tile_3/core/csr_io_trace_0_insn[9]} {top/target/tile_3/core/csr_io_trace_0_insn[10]} {top/target/tile_3/core/csr_io_trace_0_insn[11]} {top/target/tile_3/core/csr_io_trace_0_insn[12]} {top/target/tile_3/core/csr_io_trace_0_insn[13]} {top/target/tile_3/core/csr_io_trace_0_insn[14]} {top/target/tile_3/core/csr_io_trace_0_insn[15]} {top/target/tile_3/core/csr_io_trace_0_insn[16]} {top/target/tile_3/core/csr_io_trace_0_insn[17]} {top/target/tile_3/core/csr_io_trace_0_insn[18]} {top/target/tile_3/core/csr_io_trace_0_insn[19]} {top/target/tile_3/core/csr_io_trace_0_insn[20]} {top/target/tile_3/core/csr_io_trace_0_insn[21]} {top/target/tile_3/core/csr_io_trace_0_insn[22]} {top/target/tile_3/core/csr_io_trace_0_insn[23]} {top/target/tile_3/core/csr_io_trace_0_insn[24]} {top/target/tile_3/core/csr_io_trace_0_insn[25]} {top/target/tile_3/core/csr_io_trace_0_insn[26]} {top/target/tile_3/core/csr_io_trace_0_insn[27]} {top/target/tile_3/core/csr_io_trace_0_insn[28]} {top/target/tile_3/core/csr_io_trace_0_insn[29]} {top/target/tile_3/core/csr_io_trace_0_insn[30]} {top/target/tile_3/core/csr_io_trace_0_insn[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 1 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list top/target/tile_2/core/csr_io_trace_0_exception]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 1 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list top/target/tile_1/core/csr_io_trace_0_exception]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 1 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list top/target/tile_3/core/csr_io_trace_0_exception]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list top/target/tile/core/csr_io_trace_0_exception]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list top/target/tile/core/csr_io_trace_0_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list top/target/tile_1/core/csr_io_trace_0_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 1 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list top/target/tile_2/core/csr_io_trace_0_valid]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 1 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list top/target/tile_3/core/csr_io_trace_0_valid]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets host_clk]
