-------------------------------------------------------------------------------
--
-- Title       : round_function
-- Design      : main
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\GOST2814789\main\compile\round_function.vhd
-- Generated   : Sun Oct  3 22:17:22 2021
-- From        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\GOST2814789\main\src\round_function.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;


entity round_function is
  port(
       last_round_en : in STD_LOGIC;
       round_key : in STD_LOGIC_VECTOR(31 downto 0);
       state_in : in STD_LOGIC_VECTOR(63 downto 0);
       state_out : out STD_LOGIC_VECTOR(63 downto 0)
  );
end round_function;

architecture round_function of round_function is

---- Component declarations -----

component mux_32bit
  port (
       bus1 : in STD_LOGIC_VECTOR(31 downto 0);
       bus2 : in STD_LOGIC_VECTOR(31 downto 0);
       bus_sel : in STD_LOGIC;
       bout : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component rol11
  port (
       state_in : in STD_LOGIC_VECTOR(31 downto 0);
       state_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component sbox
  port (
       state_in : in STD_LOGIC_VECTOR(31 downto 0);
       state_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component sum_mod2pw32
  port (
       inp1 : in STD_LOGIC_VECTOR(31 downto 0);
       inp2 : in STD_LOGIC_VECTOR(31 downto 0);
       rslt : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component xor_32bit
  port (
       inp1 : in STD_LOGIC_VECTOR(31 downto 0);
       inp2 : in STD_LOGIC_VECTOR(31 downto 0);
       rslt : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS138 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS226 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS68 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS72 : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : sum_mod2pw32
  port map(
       inp2(0) => state_in(0),
       inp2(1) => state_in(1),
       inp2(2) => state_in(2),
       inp2(3) => state_in(3),
       inp2(4) => state_in(4),
       inp2(5) => state_in(5),
       inp2(6) => state_in(6),
       inp2(7) => state_in(7),
       inp2(8) => state_in(8),
       inp2(9) => state_in(9),
       inp2(10) => state_in(10),
       inp2(11) => state_in(11),
       inp2(12) => state_in(12),
       inp2(13) => state_in(13),
       inp2(14) => state_in(14),
       inp2(15) => state_in(15),
       inp2(16) => state_in(16),
       inp2(17) => state_in(17),
       inp2(18) => state_in(18),
       inp2(19) => state_in(19),
       inp2(20) => state_in(20),
       inp2(21) => state_in(21),
       inp2(22) => state_in(22),
       inp2(23) => state_in(23),
       inp2(24) => state_in(24),
       inp2(25) => state_in(25),
       inp2(26) => state_in(26),
       inp2(27) => state_in(27),
       inp2(28) => state_in(28),
       inp2(29) => state_in(29),
       inp2(30) => state_in(30),
       inp2(31) => state_in(31),
       inp1 => round_key,
       rslt => BUS68
  );

U2 : sbox
  port map(
       state_in => BUS68,
       state_out => BUS72
  );

U3 : rol11
  port map(
       state_in => BUS72,
       state_out => BUS138
  );

U4 : xor_32bit
  port map(
       inp2(0) => state_in(32),
       inp2(1) => state_in(33),
       inp2(2) => state_in(34),
       inp2(3) => state_in(35),
       inp2(4) => state_in(36),
       inp2(5) => state_in(37),
       inp2(6) => state_in(38),
       inp2(7) => state_in(39),
       inp2(8) => state_in(40),
       inp2(9) => state_in(41),
       inp2(10) => state_in(42),
       inp2(11) => state_in(43),
       inp2(12) => state_in(44),
       inp2(13) => state_in(45),
       inp2(14) => state_in(46),
       inp2(15) => state_in(47),
       inp2(16) => state_in(48),
       inp2(17) => state_in(49),
       inp2(18) => state_in(50),
       inp2(19) => state_in(51),
       inp2(20) => state_in(52),
       inp2(21) => state_in(53),
       inp2(22) => state_in(54),
       inp2(23) => state_in(55),
       inp2(24) => state_in(56),
       inp2(25) => state_in(57),
       inp2(26) => state_in(58),
       inp2(27) => state_in(59),
       inp2(28) => state_in(60),
       inp2(29) => state_in(61),
       inp2(30) => state_in(62),
       inp2(31) => state_in(63),
       inp1 => BUS138,
       rslt => BUS226
  );

U5 : mux_32bit
  port map(
       bout(0) => state_out(0),
       bout(1) => state_out(1),
       bout(2) => state_out(2),
       bout(3) => state_out(3),
       bout(4) => state_out(4),
       bout(5) => state_out(5),
       bout(6) => state_out(6),
       bout(7) => state_out(7),
       bout(8) => state_out(8),
       bout(9) => state_out(9),
       bout(10) => state_out(10),
       bout(11) => state_out(11),
       bout(12) => state_out(12),
       bout(13) => state_out(13),
       bout(14) => state_out(14),
       bout(15) => state_out(15),
       bout(16) => state_out(16),
       bout(17) => state_out(17),
       bout(18) => state_out(18),
       bout(19) => state_out(19),
       bout(20) => state_out(20),
       bout(21) => state_out(21),
       bout(22) => state_out(22),
       bout(23) => state_out(23),
       bout(24) => state_out(24),
       bout(25) => state_out(25),
       bout(26) => state_out(26),
       bout(27) => state_out(27),
       bout(28) => state_out(28),
       bout(29) => state_out(29),
       bout(30) => state_out(30),
       bout(31) => state_out(31),
       bus2(0) => state_in(0),
       bus2(1) => state_in(1),
       bus2(2) => state_in(2),
       bus2(3) => state_in(3),
       bus2(4) => state_in(4),
       bus2(5) => state_in(5),
       bus2(6) => state_in(6),
       bus2(7) => state_in(7),
       bus2(8) => state_in(8),
       bus2(9) => state_in(9),
       bus2(10) => state_in(10),
       bus2(11) => state_in(11),
       bus2(12) => state_in(12),
       bus2(13) => state_in(13),
       bus2(14) => state_in(14),
       bus2(15) => state_in(15),
       bus2(16) => state_in(16),
       bus2(17) => state_in(17),
       bus2(18) => state_in(18),
       bus2(19) => state_in(19),
       bus2(20) => state_in(20),
       bus2(21) => state_in(21),
       bus2(22) => state_in(22),
       bus2(23) => state_in(23),
       bus2(24) => state_in(24),
       bus2(25) => state_in(25),
       bus2(26) => state_in(26),
       bus2(27) => state_in(27),
       bus2(28) => state_in(28),
       bus2(29) => state_in(29),
       bus2(30) => state_in(30),
       bus2(31) => state_in(31),
       bus1 => BUS226,
       bus_sel => last_round_en
  );

U6 : mux_32bit
  port map(
       bout(0) => state_out(32),
       bout(1) => state_out(33),
       bout(2) => state_out(34),
       bout(3) => state_out(35),
       bout(4) => state_out(36),
       bout(5) => state_out(37),
       bout(6) => state_out(38),
       bout(7) => state_out(39),
       bout(8) => state_out(40),
       bout(9) => state_out(41),
       bout(10) => state_out(42),
       bout(11) => state_out(43),
       bout(12) => state_out(44),
       bout(13) => state_out(45),
       bout(14) => state_out(46),
       bout(15) => state_out(47),
       bout(16) => state_out(48),
       bout(17) => state_out(49),
       bout(18) => state_out(50),
       bout(19) => state_out(51),
       bout(20) => state_out(52),
       bout(21) => state_out(53),
       bout(22) => state_out(54),
       bout(23) => state_out(55),
       bout(24) => state_out(56),
       bout(25) => state_out(57),
       bout(26) => state_out(58),
       bout(27) => state_out(59),
       bout(28) => state_out(60),
       bout(29) => state_out(61),
       bout(30) => state_out(62),
       bout(31) => state_out(63),
       bus1(0) => state_in(0),
       bus1(1) => state_in(1),
       bus1(2) => state_in(2),
       bus1(3) => state_in(3),
       bus1(4) => state_in(4),
       bus1(5) => state_in(5),
       bus1(6) => state_in(6),
       bus1(7) => state_in(7),
       bus1(8) => state_in(8),
       bus1(9) => state_in(9),
       bus1(10) => state_in(10),
       bus1(11) => state_in(11),
       bus1(12) => state_in(12),
       bus1(13) => state_in(13),
       bus1(14) => state_in(14),
       bus1(15) => state_in(15),
       bus1(16) => state_in(16),
       bus1(17) => state_in(17),
       bus1(18) => state_in(18),
       bus1(19) => state_in(19),
       bus1(20) => state_in(20),
       bus1(21) => state_in(21),
       bus1(22) => state_in(22),
       bus1(23) => state_in(23),
       bus1(24) => state_in(24),
       bus1(25) => state_in(25),
       bus1(26) => state_in(26),
       bus1(27) => state_in(27),
       bus1(28) => state_in(28),
       bus1(29) => state_in(29),
       bus1(30) => state_in(30),
       bus1(31) => state_in(31),
       bus2 => BUS226,
       bus_sel => last_round_en
  );


end round_function;
