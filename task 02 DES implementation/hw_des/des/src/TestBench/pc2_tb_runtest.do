SetActiveLib -work
comp -include "$dsn\src\Key_Generator\PC2.vhd" 
comp -include "$dsn\src\TestBench\pc2_tb.vhd" 
asim +access +r TESTBENCH_FOR_pc2 
wave 
wave -noreg PC2O
wave -noreg PCI
wave -noreg	expected_OUTPUT
wave -noreg	status
run 560 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\pc2_tb_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_pc2 
