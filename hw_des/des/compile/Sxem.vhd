-------------------------------------------------------------------------------
--
-- Title       : Sxem
-- Design      : des
-- Author      : Макарон
-- Company     : Makar
--
-------------------------------------------------------------------------------
--
-- File        : E:\DES\des\des\compile\Sxem.vhd
-- Generated   : Wed May 29 16:12:55 2013
-- From        : E:\DES\des\des\src\Sxem.bde
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


-- other libraries declarations
library des;

entity Sxem is
  port(
       CLK : in STD_LOGIC;
       DR : in STD_LOGIC;
       RST : in STD_LOGIC;
       BlockDataIN : in STD_LOGIC_VECTOR(63 downto 0);
       KEYIN : in STD_LOGIC_VECTOR(63 downto 0);
       BlockDataOUT : out STD_LOGIC_VECTOR(63 downto 0)
  );
end Sxem;

architecture Sxem of Sxem is

---- Component declarations -----

component DMX32
  port (
       CS : in STD_LOGIC;
       DI : in STD_LOGIC_VECTOR(31 downto 0);
       AO : out STD_LOGIC_VECTOR(31 downto 0);
       BO : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component fsx
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
component keydiagr
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
component key_store
  port (
       CLK : in STD_LOGIC;
       Ke : in STD_LOGIC_VECTOR(63 downto 0);
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
component reg32
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
signal NET624 : STD_LOGIC;
signal NET636 : STD_LOGIC;
signal NET686 : STD_LOGIC;
signal NET721 : STD_LOGIC;
signal RCLK : STD_LOGIC;
signal BUS1153 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS244 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS252 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS256 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS280 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS288 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS35 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS353 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS364 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS376 : STD_LOGIC_VECTOR (31 downto 0);
signal BUS648 : STD_LOGIC_VECTOR (47 downto 0);
signal CurStateL : STD_LOGIC_VECTOR (31 downto 0);
signal CurStateR : STD_LOGIC_VECTOR (31 downto 0);

begin

----  Component instantiations  ----

U1 : IP
  port map(
       DIN => BlockDataIN,
       DL => BUS35,
       DR => BUS244
  );

U10 : IP_INV
  port map(
       DL => BUS288,
       DOUT => BlockDataOUT,
       DR => BUS280
  );

U11 : key_store
  port map(
       CLK => KCLK,
       Ke => KEYIN,
       RK => BUS648,
       SHE => NET624,
       SHS => NET636
  );

U12 : keydiagr
  port map(
       CLK => CLK,
       DR => DR,
       DTO => NET686,
       FR => NET721,
       KCLK => KCLK,
       RCLK => RCLK,
       RST => RST,
       SHE => NET624,
       SHS => NET636
  );

U2 : MUX32
  port map(
       A => BUS35,
       B => BUS353,
       CS => NET721,
       M => BUS256
  );

U3 : MUX32
  port map(
       A => BUS244,
       B => BUS376,
       CS => NET721,
       M => BUS252
  );

U4 : XOR32
  port map(
       I1 => BUS364,
       I2 => BUS1153,
       XR => BUS376
  );

U5 : fsx
  port map(
       DR => BUS353,
       FO => BUS1153,
       Key => BUS648
  );

U6 : reg32
  port map(
       CLK => RCLK,
       DI => BUS256,
       DO => CurStateL
  );

U7 : reg32
  port map(
       CLK => RCLK,
       DI => BUS252,
       DO => CurStateR
  );

U8 : DMX32
  port map(
       AO => BUS280,
       BO => BUS353,
       CS => NET686,
       DI => CurStateR
  );

U9 : DMX32
  port map(
       AO => BUS288,
       BO => BUS364,
       CS => NET686,
       DI => CurStateL
  );


end Sxem;
