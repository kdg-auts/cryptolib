-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hw_simple_aes
-- Author      : Gizmo
-- Company     : HP Inc.
--
-------------------------------------------------------------------------------
--
-- File        : D:\cryptolib\hw_simple_aes\compile\hw_simple_aes.vhd
-- Generated   : Mon Nov 27 15:08:05 2023
-- From        : D:\cryptolib\hw_simple_aes\src\hw_simple_aes.bde
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity hw_simple_aes is
  port(
       INDB : in STD_LOGIC_VECTOR(15 downto 0);
       KEY : in STD_LOGIC_VECTOR(15 downto 0);
       MODE : in STD_LOGIC;
       OUDB : out STD_LOGIC_VECTOR(15 downto 0)
  );
end hw_simple_aes;

architecture hw_simple_aes_arch of hw_simple_aes is

---- Component declarations -----

component add_round_key
  port(
       DIN : in STD_LOGIC_VECTOR(15 downto 0);
       KIN : in STD_LOGIC_VECTOR(15 downto 0);
       DOUT : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component inv_mix_columns
  port(
       INDB : in STD_LOGIC_VECTOR(15 downto 0);
       OUDB : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component inv_sub_nibbles
  port(
       INDB : in STD_LOGIC_VECTOR(15 downto 0);
       OUDB : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component mix_columns
  port(
       INDB : in STD_LOGIC_VECTOR(15 downto 0);
       OUDB : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component rot_word
  port(
       INDB : in STD_LOGIC_VECTOR(7 downto 0);
       OUDB : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component shift_rows
  port(
       INDB : in STD_LOGIC_VECTOR(15 downto 0);
       OUDB : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component state_mux
  port(
       INDB1 : in STD_LOGIC_VECTOR(15 downto 0);
       INDB2 : in STD_LOGIC_VECTOR(15 downto 0);
       SEL : in STD_LOGIC;
       OUDB : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component sub_nibbles
  port(
       INDB : in STD_LOGIC_VECTOR(15 downto 0);
       OUDB : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component sub_word
  port(
       INDB : in STD_LOGIC_VECTOR(7 downto 0);
       OUDB : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;
component xor2_8
  port(
       DI1 : in STD_LOGIC_VECTOR(7 downto 0);
       DI2 : in STD_LOGIC_VECTOR(7 downto 0);
       DO : out STD_LOGIC_VECTOR(7 downto 0)
  );
end component;

---- Architecture declarations -----
type RCON_t is array (0 to 1) of std_logic_vector(7 downto 0);
constant RCON : RCON_t := ("10000000", "00110000");


---- Signal declarations used on the diagram ----

signal BUS100 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS104 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS25 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS285 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS289 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS293 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS297 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS301 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS305 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS309 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS32 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS354 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS358 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS39 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS479 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS483 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS49 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS70 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS74 : STD_LOGIC_VECTOR(15 downto 0);
signal BUS78 : STD_LOGIC_VECTOR(15 downto 0);
signal RCON0 : STD_LOGIC_VECTOR(7 downto 0);
signal RCON1 : STD_LOGIC_VECTOR(7 downto 0);
signal round_key1 : STD_LOGIC_VECTOR(15 downto 0);
signal round_key2 : STD_LOGIC_VECTOR(15 downto 0);
signal t2 : STD_LOGIC_VECTOR(7 downto 0);
signal t4 : STD_LOGIC_VECTOR(7 downto 0);

begin

---- User Signal Assignments ----
RCON0 <= RCON(0);
RCON1 <= RCON(1);

----  Component instantiations  ----

U1 : add_round_key
  port map(
       DIN => INDB,
       KIN => KEY,
       DOUT => BUS25
  );

U11 : add_round_key
  port map(
       DIN => INDB,
       KIN => round_key2,
       DOUT => BUS309
  );

U12 : shift_rows
  port map(
       INDB => BUS309,
       OUDB => BUS305
  );

U13 : inv_sub_nibbles
  port map(
       INDB => BUS305,
       OUDB => BUS301
  );

U14 : add_round_key
  port map(
       DIN => BUS301,
       KIN => round_key1,
       DOUT => BUS297
  );

U15 : inv_mix_columns
  port map(
       INDB => BUS297,
       OUDB => BUS293
  );

U16 : shift_rows
  port map(
       INDB => BUS293,
       OUDB => BUS289
  );

U17 : inv_sub_nibbles
  port map(
       INDB => BUS289,
       OUDB => BUS285
  );

U18 : add_round_key
  port map(
       DIN => BUS285,
       KIN => KEY,
       DOUT => BUS104
  );

U19 : rot_word
  port map(
       INDB(7) => KEY(7),
       INDB(6) => KEY(6),
       INDB(5) => KEY(5),
       INDB(4) => KEY(4),
       INDB(3) => KEY(3),
       INDB(2) => KEY(2),
       INDB(1) => KEY(1),
       INDB(0) => KEY(0),
       OUDB => BUS354
  );

U2 : sub_nibbles
  port map(
       INDB => BUS25,
       OUDB => BUS32
  );

U20 : sub_word
  port map(
       INDB => BUS354,
       OUDB => BUS358
  );

U21 : xor2_8
  port map(
       DI1 => BUS358,
       DI2 => RCON0,
       DO => t2
  );

U22 : xor2_8
  port map(
       DI1 => t2,
       DI2(7) => KEY(15),
       DI2(6) => KEY(14),
       DI2(5) => KEY(13),
       DI2(4) => KEY(12),
       DI2(3) => KEY(11),
       DI2(2) => KEY(10),
       DI2(1) => KEY(9),
       DI2(0) => KEY(8),
       DO(7) => round_key1(15),
       DO(6) => round_key1(14),
       DO(5) => round_key1(13),
       DO(4) => round_key1(12),
       DO(3) => round_key1(11),
       DO(2) => round_key1(10),
       DO(1) => round_key1(9),
       DO(0) => round_key1(8)
  );

U23 : xor2_8
  port map(
       DI1(7) => round_key1(15),
       DI1(6) => round_key1(14),
       DI1(5) => round_key1(13),
       DI1(4) => round_key1(12),
       DI1(3) => round_key1(11),
       DI1(2) => round_key1(10),
       DI1(1) => round_key1(9),
       DI1(0) => round_key1(8),
       DI2(7) => KEY(7),
       DI2(6) => KEY(6),
       DI2(5) => KEY(5),
       DI2(4) => KEY(4),
       DI2(3) => KEY(3),
       DI2(2) => KEY(2),
       DI2(1) => KEY(1),
       DI2(0) => KEY(0),
       DO(7) => round_key1(7),
       DO(6) => round_key1(6),
       DO(5) => round_key1(5),
       DO(4) => round_key1(4),
       DO(3) => round_key1(3),
       DO(2) => round_key1(2),
       DO(1) => round_key1(1),
       DO(0) => round_key1(0)
  );

U24 : rot_word
  port map(
       INDB(7) => round_key1(7),
       INDB(6) => round_key1(6),
       INDB(5) => round_key1(5),
       INDB(4) => round_key1(4),
       INDB(3) => round_key1(3),
       INDB(2) => round_key1(2),
       INDB(1) => round_key1(1),
       INDB(0) => round_key1(0),
       OUDB => BUS479
  );

U25 : sub_word
  port map(
       INDB => BUS479,
       OUDB => BUS483
  );

U26 : xor2_8
  port map(
       DI1 => BUS483,
       DI2 => RCON1,
       DO => t4
  );

U27 : xor2_8
  port map(
       DI1 => t4,
       DI2(7) => round_key1(15),
       DI2(6) => round_key1(14),
       DI2(5) => round_key1(13),
       DI2(4) => round_key1(12),
       DI2(3) => round_key1(11),
       DI2(2) => round_key1(10),
       DI2(1) => round_key1(9),
       DI2(0) => round_key1(8),
       DO(7) => round_key2(15),
       DO(6) => round_key2(14),
       DO(5) => round_key2(13),
       DO(4) => round_key2(12),
       DO(3) => round_key2(11),
       DO(2) => round_key2(10),
       DO(1) => round_key2(9),
       DO(0) => round_key2(8)
  );

U28 : xor2_8
  port map(
       DI1(7) => round_key2(15),
       DI1(6) => round_key2(14),
       DI1(5) => round_key2(13),
       DI1(4) => round_key2(12),
       DI1(3) => round_key2(11),
       DI1(2) => round_key2(10),
       DI1(1) => round_key2(9),
       DI1(0) => round_key2(8),
       DI2(7) => round_key1(7),
       DI2(6) => round_key1(6),
       DI2(5) => round_key1(5),
       DI2(4) => round_key1(4),
       DI2(3) => round_key1(3),
       DI2(2) => round_key1(2),
       DI2(1) => round_key1(1),
       DI2(0) => round_key1(0),
       DO(7) => round_key2(7),
       DO(6) => round_key2(6),
       DO(5) => round_key2(5),
       DO(4) => round_key2(4),
       DO(3) => round_key2(3),
       DO(2) => round_key2(2),
       DO(1) => round_key2(1),
       DO(0) => round_key2(0)
  );

U3 : shift_rows
  port map(
       INDB => BUS32,
       OUDB => BUS39
  );

U4 : mix_columns
  port map(
       INDB => BUS39,
       OUDB => BUS49
  );

U5 : add_round_key
  port map(
       DIN => BUS49,
       KIN => round_key1,
       DOUT => BUS78
  );

U6 : sub_nibbles
  port map(
       INDB => BUS78,
       OUDB => BUS74
  );

U7 : shift_rows
  port map(
       INDB => BUS74,
       OUDB => BUS70
  );

U8 : add_round_key
  port map(
       DIN => BUS70,
       KIN => round_key2,
       DOUT => BUS100
  );

U9 : state_mux
  port map(
       INDB1 => BUS100,
       INDB2 => BUS104,
       SEL => MODE,
       OUDB => OUDB
  );


end hw_simple_aes_arch;
