SetActiveLib -work
comp -include "$dsn\src\Round_Function\P.vhd" 
comp -include "$dsn\src\TestBench\p_tb.vhd" 
asim +access +r p_tb_conf 
wave 
wave -noreg PI
wave -noreg PO 
wave -noreg	expected_OUTPUT
wave -noreg	status
run 320 ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\p_tb_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_p 
