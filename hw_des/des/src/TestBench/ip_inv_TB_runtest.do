SetActiveLib -work
comp -include "$dsn\src\IP_INV.vhd" 
comp -include "$dsn\src\TestBench\ip_inv_TB.vhd" 
asim +access +r TESTBENCH_FOR_ip_inv 
wave 
wave -noreg DIN
wave -noreg DOUT
run	640 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\ip_inv_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_ip_inv 
