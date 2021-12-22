SetActiveLib -work
comp -include "$dsn\src\round_function\expand.vhd" 
comp -include "$dsn\src\TestBench\expand_TB.vhd" 
asim +access +r expand_tb_conf 
wave 
wave -noreg EI
wave -noreg EO
wave -noreg current_expected
wave -noreg status
run 320 ns 
