# simple-AES testbench run
SetActiveLib -work
# compile mix_columns components
comp -include "$dsn/src/mul_2.vhd"
comp -include "$dsn/src/mul_4.vhd"
comp -include "$dsn/src/mul_9.vhd" 
comp -include "$dsn/src/mul_col.vhd"
comp -include "$dsn/src/inv_mul_col.vhd"
comp -include "$dsn/src/mix_columns.vhd"
comp -include "$dsn/src/inv_mix_columns.vhd"
# compile sub_nibbles components
comp -include "$dsn/src/sbox4.vhd"
comp -include "$dsn/src/inv_sbox4.vhd"
comp -include "$dsn/src/sub_nibbles.vhd"
comp -include "$dsn/src/inv_sub_nibbles.vhd"
# compile round components
comp -include "$dsn/src/shift_rows.vhd"
comp -include "$dsn/src/add_round_key.vhd"
comp -include "$dsn/src/state_mux.vhd"
# compile key expansion part
comp -include "$dsn/src/rot_word.vhd"
comp -include "$dsn/src/sub_word.vhd"
comp -include "$dsn/src/xor2_8.vhd"
# compile main cipher components
comp -include "$dsn/src/hw_simple_aes.bde"
# compile testbench
comp -include "$dsn/src/hw_simple_aes_tb.vhd"
# begin simulation
asim +access +r hw_simple_aes_tb
wave 
wave -noreg -binary input_msg
wave -noreg -binary cipher_key
wave -noreg cipher_mode
wave -noreg -binary output_msg
run 20 ns