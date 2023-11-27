library IEEE;
use IEEE.std_logic_1164.all;

entity add_round_key is
  port(
    DIN : in std_logic_vector(15 downto 0);
    KIN : in std_logic_vector(15 downto 0);
    DOUT : out std_logic_vector(15 downto 0)
  );
end entity;

architecture add_round_key_arch of add_round_key is
begin
    DOUT <= DIN xor KIN;
end architecture;