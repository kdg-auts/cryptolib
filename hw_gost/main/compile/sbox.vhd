-------------------------------------------------------------------------------
--
-- Title       : sbox
-- Design      : main
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\GOST2814789\main\compile\sbox.vhd
-- Generated   : Sun Oct  3 22:17:22 2021
-- From        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\GOST2814789\main\src\sbox.bde
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


entity sbox is
  port(
       state_in : in STD_LOGIC_VECTOR(31 downto 0);
       state_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end sbox;

architecture sbox of sbox is

---- Component declarations -----

component sbox0
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component sbox1
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component sbox2
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component sbox3
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component sbox4
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component sbox5
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component sbox6
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component sbox7
  port (
       din : in STD_LOGIC_VECTOR(3 downto 0);
       dout : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;

begin

----  Component instantiations  ----

U1 : sbox0
  port map(
       din(0) => state_in(0),
       din(1) => state_in(1),
       din(2) => state_in(2),
       din(3) => state_in(3),
       dout(0) => state_out(0),
       dout(1) => state_out(1),
       dout(2) => state_out(2),
       dout(3) => state_out(3)
  );

U2 : sbox1
  port map(
       din(0) => state_in(4),
       din(1) => state_in(5),
       din(2) => state_in(6),
       din(3) => state_in(7),
       dout(0) => state_out(4),
       dout(1) => state_out(5),
       dout(2) => state_out(6),
       dout(3) => state_out(7)
  );

U3 : sbox2
  port map(
       din(0) => state_in(8),
       din(1) => state_in(9),
       din(2) => state_in(10),
       din(3) => state_in(11),
       dout(0) => state_out(8),
       dout(1) => state_out(9),
       dout(2) => state_out(10),
       dout(3) => state_out(11)
  );

U4 : sbox3
  port map(
       din(0) => state_in(12),
       din(1) => state_in(13),
       din(2) => state_in(14),
       din(3) => state_in(15),
       dout(0) => state_out(12),
       dout(1) => state_out(13),
       dout(2) => state_out(14),
       dout(3) => state_out(15)
  );

U5 : sbox4
  port map(
       din(0) => state_in(16),
       din(1) => state_in(17),
       din(2) => state_in(18),
       din(3) => state_in(19),
       dout(0) => state_out(16),
       dout(1) => state_out(17),
       dout(2) => state_out(18),
       dout(3) => state_out(19)
  );

U6 : sbox5
  port map(
       din(0) => state_in(20),
       din(1) => state_in(21),
       din(2) => state_in(22),
       din(3) => state_in(23),
       dout(0) => state_out(20),
       dout(1) => state_out(21),
       dout(2) => state_out(22),
       dout(3) => state_out(23)
  );

U7 : sbox6
  port map(
       din(0) => state_in(24),
       din(1) => state_in(25),
       din(2) => state_in(26),
       din(3) => state_in(27),
       dout(0) => state_out(24),
       dout(1) => state_out(25),
       dout(2) => state_out(26),
       dout(3) => state_out(27)
  );

U8 : sbox7
  port map(
       din(0) => state_in(28),
       din(1) => state_in(29),
       din(2) => state_in(30),
       din(3) => state_in(31),
       dout(0) => state_out(28),
       dout(1) => state_out(29),
       dout(2) => state_out(30),
       dout(3) => state_out(31)
  );


end sbox;
