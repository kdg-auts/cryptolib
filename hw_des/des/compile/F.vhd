-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : des
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : d:\appdata\acthdl_designs\des\des\compile\F.vhd
-- Generated   : Fri May 31 08:53:40 2013
-- From        : d:\appdata\acthdl_designs\des\des\src\Round_Function\F.bde
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


-- active library clause
library des;

entity F is
  port(
       DR : in STD_LOGIC_VECTOR(31 downto 0);
       Key : in STD_LOGIC_VECTOR(47 downto 0);
       FO : out STD_LOGIC_VECTOR(31 downto 0)
  );
end F;

architecture F of F is

---- Component declarations -----

component EXPAND
  port (
       EI : in STD_LOGIC_VECTOR(31 downto 0);
       EO : out STD_LOGIC_VECTOR(47 downto 0)
  );
end component;
component P
  port (
       PI : in STD_LOGIC_VECTOR(31 downto 0);
       PO : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component S1
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component S2
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component S3
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component S4
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component S5
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component S6
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component S7
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component S8
  port (
       SI : in STD_LOGIC_VECTOR(5 downto 0);
       SO : out STD_LOGIC_VECTOR(3 downto 0)
  );
end component;
component XOR48
  port (
       I1 : in STD_LOGIC_VECTOR(47 downto 0);
       I2 : in STD_LOGIC_VECTOR(47 downto 0);
       XR : out STD_LOGIC_VECTOR(47 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS37 : STD_LOGIC_VECTOR (47 downto 0);
signal PI : STD_LOGIC_VECTOR (31 downto 0);
signal XR : STD_LOGIC_VECTOR (47 downto 0);

begin

----  Component instantiations  ----

U1 : EXPAND
  port map(
       EI => DR,
       EO => BUS37
  );

U10 : S8
  port map(
       SI(0) => XR(0),
       SI(1) => XR(1),
       SI(2) => XR(2),
       SI(3) => XR(3),
       SI(4) => XR(4),
       SI(5) => XR(5),
       SO(0) => PI(0),
       SO(1) => PI(1),
       SO(2) => PI(2),
       SO(3) => PI(3)
  );

U11 : P
  port map(
       PI => PI,
       PO => FO
  );

U2 : XOR48
  port map(
       I1 => BUS37,
       I2 => Key,
       XR => XR
  );

U3 : S1
  port map(
       SI(0) => XR(42),
       SI(1) => XR(43),
       SI(2) => XR(44),
       SI(3) => XR(45),
       SI(4) => XR(46),
       SI(5) => XR(47),
       SO(0) => PI(28),
       SO(1) => PI(29),
       SO(2) => PI(30),
       SO(3) => PI(31)
  );

U4 : S2
  port map(
       SI(0) => XR(36),
       SI(1) => XR(37),
       SI(2) => XR(38),
       SI(3) => XR(39),
       SI(4) => XR(40),
       SI(5) => XR(41),
       SO(0) => PI(24),
       SO(1) => PI(25),
       SO(2) => PI(26),
       SO(3) => PI(27)
  );

U5 : S3
  port map(
       SI(0) => XR(30),
       SI(1) => XR(31),
       SI(2) => XR(32),
       SI(3) => XR(33),
       SI(4) => XR(34),
       SI(5) => XR(35),
       SO(0) => PI(20),
       SO(1) => PI(21),
       SO(2) => PI(22),
       SO(3) => PI(23)
  );

U6 : S4
  port map(
       SI(0) => XR(24),
       SI(1) => XR(25),
       SI(2) => XR(26),
       SI(3) => XR(27),
       SI(4) => XR(28),
       SI(5) => XR(29),
       SO(0) => PI(16),
       SO(1) => PI(17),
       SO(2) => PI(18),
       SO(3) => PI(19)
  );

U7 : S5
  port map(
       SI(0) => XR(18),
       SI(1) => XR(19),
       SI(2) => XR(20),
       SI(3) => XR(21),
       SI(4) => XR(22),
       SI(5) => XR(23),
       SO(0) => PI(12),
       SO(1) => PI(13),
       SO(2) => PI(14),
       SO(3) => PI(15)
  );

U8 : S6
  port map(
       SI(0) => XR(12),
       SI(1) => XR(13),
       SI(2) => XR(14),
       SI(3) => XR(15),
       SI(4) => XR(16),
       SI(5) => XR(17),
       SO(0) => PI(8),
       SO(1) => PI(9),
       SO(2) => PI(10),
       SO(3) => PI(11)
  );

U9 : S7
  port map(
       SI(0) => XR(6),
       SI(1) => XR(7),
       SI(2) => XR(8),
       SI(3) => XR(9),
       SI(4) => XR(10),
       SI(5) => XR(11),
       SO(0) => PI(4),
       SO(1) => PI(5),
       SO(2) => PI(6),
       SO(3) => PI(7)
  );


end F;
