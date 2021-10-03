-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\des\des\compile\CipherControl.vhd
-- Generated   : 10/03/21 22:11:59
-- From        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\des\des\src\CipherControl.asf
-- By          : FSM2VHDL ver. 5.0.7.2
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity CipherControl is 
	port (
		CLK: in STD_LOGIC;
		DR: in STD_LOGIC;
		RST: in STD_LOGIC;
		DTO: out STD_LOGIC;
		FR: out STD_LOGIC;
		KCLK: out STD_LOGIC;
		RCLK: out STD_LOGIC;
		SHE: out STD_LOGIC;
		SHS: out STD_LOGIC);
end CipherControl;

architecture CipherControl_arch of CipherControl is

-- diagram signals declarations
signal CLKEN: STD_LOGIC;

-- SYMBOLIC ENCODED state machine: CipherState
type CipherState_type is (
    X, DRD, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, R16
);
-- attribute enum_encoding of CipherState_type: type is ... -- enum_encoding attribute is not supported for symbolic encoding

signal CipherState: CipherState_type;

begin

-- concurrent signals assignments

-- Diagram ACTION
KCLK <= CLK and CLKEN;
RCLK <= (not CLK) and CLKEN;

----------------------------------------------------------------------
-- Machine: CipherState
----------------------------------------------------------------------
CipherState_machine: process (CLK, rst)
begin
	if RST='1' then	
		CipherState <= X;
		-- Set default values for outputs, signals and variables
		-- ...
		CLKEN <= '0';
	elsif CLK'event and CLK = '1' then
		-- Set default values for outputs, signals and variables
		-- ...
		case CipherState is
			when X =>
				if DR = '1' then	
					CipherState <= DRD;
					CLKEN <= '1';
				end if;
			when DRD =>
				--CLKEN <= '1'
				CipherState <= R1;
			when R1 =>
				CipherState <= R2;
			when R2 =>
				CipherState <= R3;
			when R3 =>
				CipherState <= R4;
			when R4 =>
				CipherState <= R5;
			when R5 =>
				CipherState <= R6;
			when R6 =>
				CipherState <= R7;
			when R7 =>
				CipherState <= R8;
			when R8 =>
				CipherState <= R9;
			when R9 =>
				CipherState <= R10;
			when R10 =>
				CipherState <= R11;
			when R11 =>
				CipherState <= R12;
			when R12 =>
				CipherState <= R13;
			when R13 =>
				CipherState <= R14;
			when R14 =>
				CipherState <= R15;
			when R15 =>
				CipherState <= R16;
			when R16 =>
				CLKEN <= '0';
				CipherState <= X;
				CLKEN <= '0';
--vhdl_cover_off
			when others =>
				null;
--vhdl_cover_on
		end case;
	end if;
end process;

-- signal assignment statements for combinatorial outputs
FR_assignment:
FR <= '0' when (CipherState = X) else
      '1' when (CipherState = DRD) else
      '0' when (CipherState = R1) else
      '0' when (CipherState = R2) else
      '0' when (CipherState = R3) else
      '0' when (CipherState = R4) else
      '0' when (CipherState = R5) else
      '0' when (CipherState = R6) else
      '0' when (CipherState = R7) else
      '0' when (CipherState = R8) else
      '0' when (CipherState = R9) else
      '0' when (CipherState = R10) else
      '0' when (CipherState = R11) else
      '0' when (CipherState = R12) else
      '0' when (CipherState = R13) else
      '0' when (CipherState = R14) else
      '0' when (CipherState = R15) else
      '0' when (CipherState = R16) else
      '0';

DTO_assignment:
DTO <= '0' after 5ns when (CipherState = X) else
       '0' when (CipherState = DRD) else
       '0' when (CipherState = R1) else
       '0' when (CipherState = R2) else
       '0' when (CipherState = R3) else
       '0' when (CipherState = R4) else
       '0' when (CipherState = R5) else
       '0' when (CipherState = R6) else
       '0' when (CipherState = R7) else
       '0' when (CipherState = R8) else
       '0' when (CipherState = R9) else
       '0' when (CipherState = R10) else
       '0' when (CipherState = R11) else
       '0' when (CipherState = R12) else
       '0' when (CipherState = R13) else
       '0' when (CipherState = R14) else
       '0' when (CipherState = R15) else
       '1' after 5ns when (CipherState = R16) else
       '0' after 5ns;

SHE_assignment:
SHE <= '0' when (CipherState = X) else
       '1' when (CipherState = DRD) else
       '0' when (CipherState = DRD) else
       '1' when (CipherState = R1) else
       '1' when (CipherState = R2) else
       '1' when (CipherState = R3) else
       '1' when (CipherState = R4) else
       '1' when (CipherState = R5) else
       '1' when (CipherState = R6) else
       '1' when (CipherState = R7) else
       '1' when (CipherState = R8) else
       '1' when (CipherState = R9) else
       '1' when (CipherState = R10) else
       '1' when (CipherState = R11) else
       '1' when (CipherState = R12) else
       '1' when (CipherState = R13) else
       '1' when (CipherState = R14) else
       '1' when (CipherState = R15) else
       '0' when (CipherState = R16) else
       '0';

SHS_assignment:
SHS <= '0' when (CipherState = X) else
       '0' when (CipherState = DRD) else
       '0' when (CipherState = R1) else
       '0' when (CipherState = R2) else
       '1' when (CipherState = R3) else
       '1' when (CipherState = R4) else
       '1' when (CipherState = R5) else
       '1' when (CipherState = R6) else
       '1' when (CipherState = R7) else
       '1' when (CipherState = R8) else
       '0' when (CipherState = R9) else
       '1' when (CipherState = R10) else
       '1' when (CipherState = R11) else
       '1' when (CipherState = R12) else
       '1' when (CipherState = R13) else
       '1' when (CipherState = R14) else
       '1' when (CipherState = R15) else
       '0' when (CipherState = R16) else
       '0';

end CipherControl_arch;
