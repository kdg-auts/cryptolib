-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : des
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : D:\cryptolib\hw_des\des\compile\DES_MAIN.vhd
-- Generated   : Thu Dec 23 00:53:42 2021
-- From        : D:\cryptolib\hw_des\des\src\DES_MAIN.bde
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


entity DES_MAIN is
  port(
       CLK : in STD_LOGIC;
       DR : in STD_LOGIC;
       RST : in STD_LOGIC;
       DataBlockIN : in STD_LOGIC_VECTOR(63 downto 0);
       KeyIN : in STD_LOGIC_VECTOR(63 downto 0);
       DataBlockOUT : out STD_LOGIC_VECTOR(63 downto 0)
  );
end DES_MAIN;

architecture DES_MAIN of DES_MAIN is

---- Component declarations -----

component CipherControl
  port (
       CLK : in STD_LOGIC;
       DR : in STD_LOGIC;
       RST : in STD_LOGIC;
       DTO : out STD_LOGIC;
       FR : out STD_LOGIC;
       KCLK : out STD_LOGIC;
       RCLK : out STD_LOGIC;
       SHE : out STD_LOGIC;
       SHS : out STD_LOGIC
  );
end component;
component DMX32
  port (
       CS : in STD_LOGIC;
       DI : in STD_LOGIC_VECTOR(31 downto 0);
       AO : out STD_LOGIC_VECTOR(31 downto 0);
       BO : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component F
  port (
       DR : in STD_LOGIC_VECTOR(31 downto 0);
       Key : in STD_LOGIC_VECTOR(47 downto 0);
       FO : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component IP
  port (
       DIN : in STD_LOGIC_VECTOR(63 downto 0);
       DOUT : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component IP_INV
  port (
       DIN : in STD_LOGIC_VECTOR(63 downto 0);
       DOUT : out STD_LOGIC_VECTOR(63 downto 0)
  );
end component;
component KeyGen
  port (
       CLK : in STD_LOGIC;
       DR : in STD_LOGIC;
       KIN : in STD_LOGIC_VECTOR(63 downto 0);
       SHE : in STD_LOGIC;
       SHS : in STD_LOGIC;
       RK : out STD_LOGIC_VECTOR(47 downto 0)
  );
end component;
component MUX32
  port (
       A : in STD_LOGIC_VECTOR(31 downto 0);
       B : in STD_LOGIC_VECTOR(31 downto 0);
       CS : in STD_LOGIC;
       M : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component REG32
  port (
       CLK : in STD_LOGIC;
       DI : in STD_LOGIC_VECTOR(31 downto 0);
       DO : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component XOR32
  port (
       I1 : in STD_LOGIC_VECTOR(31 downto 0);
       I2 : in STD_LOGIC_VECTOR(31 downto 0);
       XR : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal KCLK : STD_LOGIC;
signal NET119 : STD_LOGIC;
signal NET125 : STD_LOGIC;
signal NET135 : STD_LOGIC;
signal NET141 : STD_LOGIC;
signal RCLK : STD_LOGIC;
signal BUS101 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS169 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS89 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS97 : STD_LOGIC_VECTOR (31 downto 0);
signal CurStateL : STD_LOGIC_VECTOR (31 downto 0);
signal CurStateR : STD_LOGIC_VECTOR (31 downto 0);
signal DI : STD_LOGIC_VECTOR (63 downto 0);
signal DO : STD_LOGIC_VECTOR (63 downto 0);
signal NewStateL : STD_LOGIC_VECTOR (31 downto 0);
signal NewStateR : STD_LOGIC_VECTOR (31 downto 0);
signal RoundKey : STD_LOGIC_VECTOR (47 downto 0);

begin

----  Component instantiations  ----

U1 : IP
  port map(
       DIN => DataBlockIN,
       DOUT => DI
  );

U10 : IP_INV
  port map(
       DIN => DO,
       DOUT => DataBlockOUT
  );

U11 : CipherControl
  port map(
       CLK => CLK,
       DR => DR,
       DTO => NET135,
       FR => NET141,
       KCLK => KCLK,
       RCLK => RCLK,
       RST => RST,
       SHE => NET119,
       SHS => NET125
  );

U13 : F
  port map(
       DR => BUS89,
       FO => BUS169,
       Key => RoundKey
  );

U2 : MUX32
  port map(
       A(0) => DI(32),
       A(1) => DI(33),
       A(2) => DI(34),
       A(3) => DI(35),
       A(4) => DI(36),
       A(5) => DI(37),
       A(6) => DI(38),
       A(7) => DI(39),
       A(8) => DI(40),
       A(9) => DI(41),
       A(10) => DI(42),
       A(11) => DI(43),
       A(12) => DI(44),
       A(13) => DI(45),
       A(14) => DI(46),
       A(15) => DI(47),
       A(16) => DI(48),
       A(17) => DI(49),
       A(18) => DI(50),
       A(19) => DI(51),
       A(20) => DI(52),
       A(21) => DI(53),
       A(22) => DI(54),
       A(23) => DI(55),
       A(24) => DI(56),
       A(25) => DI(57),
       A(26) => DI(58),
       A(27) => DI(59),
       A(28) => DI(60),
       A(29) => DI(61),
       A(30) => DI(62),
       A(31) => DI(63),
       B => BUS89,
       CS => NET141,
       M => NewStateL
  );

U3 : MUX32
  port map(
       A(0) => DI(0),
       A(1) => DI(1),
       A(2) => DI(2),
       A(3) => DI(3),
       A(4) => DI(4),
       A(5) => DI(5),
       A(6) => DI(6),
       A(7) => DI(7),
       A(8) => DI(8),
       A(9) => DI(9),
       A(10) => DI(10),
       A(11) => DI(11),
       A(12) => DI(12),
       A(13) => DI(13),
       A(14) => DI(14),
       A(15) => DI(15),
       A(16) => DI(16),
       A(17) => DI(17),
       A(18) => DI(18),
       A(19) => DI(19),
       A(20) => DI(20),
       A(21) => DI(21),
       A(22) => DI(22),
       A(23) => DI(23),
       A(24) => DI(24),
       A(25) => DI(25),
       A(26) => DI(26),
       A(27) => DI(27),
       A(28) => DI(28),
       A(29) => DI(29),
       A(30) => DI(30),
       A(31) => DI(31),
       B => BUS101,
       CS => NET141,
       M => NewStateR
  );

U4 : XOR32
  port map(
       I1 => BUS97,
       I2 => BUS169,
       XR => BUS101
  );

U5 : KeyGen
  port map(
       CLK => KCLK,
       DR => DR,
       KIN => KeyIN,
       RK => RoundKey,
       SHE => NET119,
       SHS => NET125
  );

U6 : REG32
  port map(
       CLK => RCLK,
       DI => NewStateL,
       DO => CurStateL
  );

U7 : REG32
  port map(
       CLK => RCLK,
       DI => NewStateR,
       DO => CurStateR
  );

U8 : DMX32
  port map(
       AO(0) => DO(0),
       AO(1) => DO(1),
       AO(2) => DO(2),
       AO(3) => DO(3),
       AO(4) => DO(4),
       AO(5) => DO(5),
       AO(6) => DO(6),
       AO(7) => DO(7),
       AO(8) => DO(8),
       AO(9) => DO(9),
       AO(10) => DO(10),
       AO(11) => DO(11),
       AO(12) => DO(12),
       AO(13) => DO(13),
       AO(14) => DO(14),
       AO(15) => DO(15),
       AO(16) => DO(16),
       AO(17) => DO(17),
       AO(18) => DO(18),
       AO(19) => DO(19),
       AO(20) => DO(20),
       AO(21) => DO(21),
       AO(22) => DO(22),
       AO(23) => DO(23),
       AO(24) => DO(24),
       AO(25) => DO(25),
       AO(26) => DO(26),
       AO(27) => DO(27),
       AO(28) => DO(28),
       AO(29) => DO(29),
       AO(30) => DO(30),
       AO(31) => DO(31),
       BO => BUS89,
       CS => NET135,
       DI => CurStateR
  );

U9 : DMX32
  port map(
       AO(0) => DO(32),
       AO(1) => DO(33),
       AO(2) => DO(34),
       AO(3) => DO(35),
       AO(4) => DO(36),
       AO(5) => DO(37),
       AO(6) => DO(38),
       AO(7) => DO(39),
       AO(8) => DO(40),
       AO(9) => DO(41),
       AO(10) => DO(42),
       AO(11) => DO(43),
       AO(12) => DO(44),
       AO(13) => DO(45),
       AO(14) => DO(46),
       AO(15) => DO(47),
       AO(16) => DO(48),
       AO(17) => DO(49),
       AO(18) => DO(50),
       AO(19) => DO(51),
       AO(20) => DO(52),
       AO(21) => DO(53),
       AO(22) => DO(54),
       AO(23) => DO(55),
       AO(24) => DO(56),
       AO(25) => DO(57),
       AO(26) => DO(58),
       AO(27) => DO(59),
       AO(28) => DO(60),
       AO(29) => DO(61),
       AO(30) => DO(62),
       AO(31) => DO(63),
       BO => BUS97,
       CS => NET135,
       DI => CurStateL
  );


end DES_MAIN;
