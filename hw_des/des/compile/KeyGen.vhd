-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : des
-- Author      : AUTS-315D-8
-- Company     : NTU KhPI
--
-------------------------------------------------------------------------------
--
-- File        : D:\appdata\acthdl_designs\des\des\compile\KeyGen.vhd
-- Generated   : Thu May 30 08:55:22 2013
-- From        : D:\appdata\acthdl_designs\des\des\src\Key_Generator\KeyGen.bde
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
       CO : out STD_LOGIC_VECTOR(27 downto 0);
       DO : out STD_LOGIC_VECTOR(27 downto 0)
  );
end component;
component PC2
  port (
       C : in STD_LOGIC_VECTOR(27 downto 0);
       D : in STD_LOGIC_VECTOR(27 downto 0);
       PC2 : out STD_LOGIC_VECTOR(47 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal BUS74 : STD_LOGIC_VECTOR (27 downto 0);
signal BUS76 : STD_LOGIC_VECTOR (27 downto 0);
signal BUS80 : STD_LOGIC_VECTOR (27 downto 0);
signal BUS82 : STD_LOGIC_VECTOR (27 downto 0);

begin

----  Component instantiations  ----

U1 : PC1
  port map(
       CO => BUS74,
       DO => BUS76,
       PCI => KIN
  );

U2 : LS
  port map(
       CLK => CLK,
       LI => BUS74,
       LO => BUS80,
       SHE => SHE,
       SHS => SHS,
       WE => DR
  );

U3 : LS
  port map(
       CLK => CLK,
       LI => BUS76,
       LO => BUS82,
       SHE => SHE,
       SHS => SHS,
       WE => DR
  );

U5 : PC2
  port map(
       C => BUS80,
       D => BUS82,
       PC2 => RK
  );


end KeyGen;
