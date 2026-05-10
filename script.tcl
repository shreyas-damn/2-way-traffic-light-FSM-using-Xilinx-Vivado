close_project -quiet
cd "C:/Users/sshreyass/Desktop/verilog/traffic_light_fsm"
#open existing project
open_project traffic_light_fsm.xpr
#set top module
set_property top fsm_tb [get_filesets sim_1]
#update compile order
update_compile_order -fileset sim_1
#launching the simulation
launch_simulation
#Run simulation
run 500 ns
#open waveform window
open_wave_config