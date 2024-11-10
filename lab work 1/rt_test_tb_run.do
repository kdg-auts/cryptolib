SetActiveLib -work
comp -include "$dsn\src\serial_register_transmiter.vhd" 
comp -include "$dsn\src\serial_register_receiver.vhd"
comp -include "$dsn\src\TestBench\rt_test_TB.vhd" 
asim +access +r TESTBENCH_FOR_serial_register_transmiter 
wave 
wave -noreg clk
wave -noreg rst
wave -noreg idv
wave -noreg pdi
wave -noreg serial_data
wave -noreg transmit_data
wave -noreg pdo
wave -noreg rdy
wave -noreg -color 255,0,0 err 
wave -noreg UUTT/parity
wave -noreg -binary UUTT/shift_reg 
wave -noreg UUTR/parity
wave -noreg -binary UUTR/shift_reg
run 125 us
