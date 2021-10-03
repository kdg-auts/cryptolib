-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : des
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\des\des\compile\DES_MAIN.vhd
-- Generated   : Sun Oct  3 22:07:29 2021
-- From        : D:\Appdata\active_hdl_designs\CRYPTOLIBRARY\des\des\src\DES_MAIN.bde
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

entity DES_MAIN2 is
  port(
       CLK : in STD_LOGIC;
       DR : in STD_LOGIC;
       RST : in STD_LOGIC;
       DataBlockIN : in STD_LOGIC_VECTOR(63 downto 0);
       KeyIN : in STD_LOGIC_VECTOR(63 downto 0);
       DataBlockOUT : out STD_LOGIC_VECTOR(63 downto 0)
  );
end DES_MAIN2;

architecture DES_MAIN2 of DES_MAIN2 is

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
       DL : out STD_LOGIC_VECTOR(31 downto 0);
       DR : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component IP_INV
  port (
       DL : in STD_LOGIC_VECTOR(31 downto 0);
       DR : in STD_LOGIC_VECTOR(31 downto 0);
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
signal BUS42 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS75 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS79 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS81 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS83 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS87 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS89 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS97 : STD_LOGIC_VECTOR (31 downto 0);
signal CurStateL : STD_LOGIC_VECTOR (31 downto 0);
signal CurStateR : STD_LOGIC_VECTOR (31 downto 0);
signal RoundKey : STD_LOGIC_VECTOR (47 downto 0);

begin

----  Component instantiations  ----

U1 : IP
  port map(
       DIN => DataBlockIN,
       DL => BUS42,
       DR => BUS75
  );

U10 : IP_INV
  port map(
       DL => BUS87,
       DOUT => DataBlockOUT,
       DR => BUS83
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
       A => BUS42,
       B => BUS89,
       CS => NET141,
       M => BUS81
  );

U3 : MUX32
  port map(
       A => BUS75,
       B => BUS101,
       CS => NET141,
       M => BUS79
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
       DI => BUS81,
       DO => CurStateL
  );

U7 : REG32
  port map(
       CLK => RCLK,
       DI => BUS79,
       DO => CurStateR
  );

U8 : DMX32
  port map(
       AO => BUS83,
       BO => BUS89,
       CS => NET135,
       DI => CurStateR
  );

U9 : DMX32
  port map(
       AO => BUS87,
       BO => BUS97,
       CS => NET135,
       DI => CurStateL
  );


end DES_MAIN2;
