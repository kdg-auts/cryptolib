-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : des
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : D:\cryptolib\hw_des\des\compile\keygen.vhd
-- Generated   : Thu Dec 23 00:46:06 2021
-- From        : D:\cryptolib\hw_des\des\src\key_generator\keygen.bde
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


entity KeyGen is
  port(
       CLK : in STD_LOGIC;
       DR : in STD_LOGIC;
       SHE : in STD_LOGIC;
       SHS : in STD_LOGIC;
       KIN : in STD_LOGIC_VECTOR(63 downto 0);
       RK : out STD_LOGIC_VECTOR(47 downto 0)
  );
end KeyGen;

architecture KeyGen of KeyGen is

---- Component declarations -----

component LS
  port (
       CLK : in STD_LOGIC;
       LI : in STD_LOGIC_VECTOR(27 downto 0);
       SHE : in STD_LOGIC;
       SHS : in STD_LOGIC;
       WE : in STD_LOGIC;
       LO : out STD_LOGIC_VECTOR(27 downto 0)
  );
end component;
component PC1
  port (
       PCI : in STD_LOGIC_VECTOR(63 downto 0);
       PCO : out STD_LOGIC_VECTOR(55 downto 0)
  );
end component;
component PC2
  port (
       PCI : in STD_LOGIC_VECTOR(55 downto 0);
       PC2 : out STD_LOGIC_VECTOR(47 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal KI : STD_LOGIC_VECTOR (55 downto 0);
signal KO : STD_LOGIC_VECTOR (55 downto 0);

begin

----  Component instantiations  ----

U1 : PC1
  port map(
       PCI => KIN,
       PCO => KI
  );

U2 : LS
  port map(
       CLK => CLK,
       LI(0) => KI(28),
       LI(1) => KI(29),
       LI(2) => KI(30),
       LI(3) => KI(31),
       LI(4) => KI(32),
       LI(5) => KI(33),
       LI(6) => KI(34),
       LI(7) => KI(35),
       LI(8) => KI(36),
       LI(9) => KI(37),
       LI(10) => KI(38),
       LI(11) => KI(39),
       LI(12) => KI(40),
       LI(13) => KI(41),
       LI(14) => KI(42),
       LI(15) => KI(43),
       LI(16) => KI(44),
       LI(17) => KI(45),
       LI(18) => KI(46),
       LI(19) => KI(47),
       LI(20) => KI(48),
       LI(21) => KI(49),
       LI(22) => KI(50),
       LI(23) => KI(51),
       LI(24) => KI(52),
       LI(25) => KI(53),
       LI(26) => KI(54),
       LI(27) => KI(55),
       LO(0) => KO(28),
       LO(1) => KO(29),
       LO(2) => KO(30),
       LO(3) => KO(31),
       LO(4) => KO(32),
       LO(5) => KO(33),
       LO(6) => KO(34),
       LO(7) => KO(35),
       LO(8) => KO(36),
       LO(9) => KO(37),
       LO(10) => KO(38),
       LO(11) => KO(39),
       LO(12) => KO(40),
       LO(13) => KO(41),
       LO(14) => KO(42),
       LO(15) => KO(43),
       LO(16) => KO(44),
       LO(17) => KO(45),
       LO(18) => KO(46),
       LO(19) => KO(47),
       LO(20) => KO(48),
       LO(21) => KO(49),
       LO(22) => KO(50),
       LO(23) => KO(51),
       LO(24) => KO(52),
       LO(25) => KO(53),
       LO(26) => KO(54),
       LO(27) => KO(55),
       SHE => SHE,
       SHS => SHS,
       WE => DR
  );

U3 : LS
  port map(
       CLK => CLK,
       LI(0) => KI(0),
       LI(1) => KI(1),
       LI(2) => KI(2),
       LI(3) => KI(3),
       LI(4) => KI(4),
       LI(5) => KI(5),
       LI(6) => KI(6),
       LI(7) => KI(7),
       LI(8) => KI(8),
       LI(9) => KI(9),
       LI(10) => KI(10),
       LI(11) => KI(11),
       LI(12) => KI(12),
       LI(13) => KI(13),
       LI(14) => KI(14),
       LI(15) => KI(15),
       LI(16) => KI(16),
       LI(17) => KI(17),
       LI(18) => KI(18),
       LI(19) => KI(19),
       LI(20) => KI(20),
       LI(21) => KI(21),
       LI(22) => KI(22),
       LI(23) => KI(23),
       LI(24) => KI(24),
       LI(25) => KI(25),
       LI(26) => KI(26),
       LI(27) => KI(27),
       LO(0) => KO(0),
       LO(1) => KO(1),
       LO(2) => KO(2),
       LO(3) => KO(3),
       LO(4) => KO(4),
       LO(5) => KO(5),
       LO(6) => KO(6),
       LO(7) => KO(7),
       LO(8) => KO(8),
       LO(9) => KO(9),
       LO(10) => KO(10),
       LO(11) => KO(11),
       LO(12) => KO(12),
       LO(13) => KO(13),
       LO(14) => KO(14),
       LO(15) => KO(15),
       LO(16) => KO(16),
       LO(17) => KO(17),
       LO(18) => KO(18),
       LO(19) => KO(19),
       LO(20) => KO(20),
       LO(21) => KO(21),
       LO(22) => KO(22),
       LO(23) => KO(23),
       LO(24) => KO(24),
       LO(25) => KO(25),
       LO(26) => KO(26),
       LO(27) => KO(27),
       SHE => SHE,
       SHS => SHS,
       WE => DR
  );

U4 : PC2
  port map(
       PC2 => RK,
       PCI => KO
  );


end KeyGen;
