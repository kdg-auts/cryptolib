SetActiveLib -work
comp -include "$dsn\src\ip.vhd" 
comp -include "$dsn\src\TestBench\ip_tb.vhd" 
asim +access +r TESTBENCH_FOR_ip 
wave 
wave -noreg DIN
wave -noreg DOUT
run	650 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\ip_tb_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_ip 
