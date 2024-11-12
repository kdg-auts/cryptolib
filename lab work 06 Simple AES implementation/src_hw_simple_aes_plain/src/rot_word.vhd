library IEEE;
use IEEE.std_logic_1164.all;

entity rot_word is
  port(
    INDB : in std_logic_vector(7 downto 0);
    OUDB : out std_logic_vector(7 downto 0)
  );
end entity;

architecture rot_word_arch of rot_word is
begin
    OUDB <= INDB(3 downto 0) & INDB(7 downto 4);
end architecture;