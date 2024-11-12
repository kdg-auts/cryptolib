SetActiveLib -work
comp -include "$dsn\src\Key_Generator\PC1.vhd" 
comp -include "$dsn\src\TestBench\pc1_tb.vhd" 
asim +access +r TESTBENCH_FOR_pc1 
wave 
wave -noreg PCI
wave -noreg PCO
wave -noreg expected_output	
wave -noreg	status
run 640 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\pc1_tb_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_pc1 
