--this code is for displaying the result in 7 segment for implementaion on 10
max board
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity OutputInterface is
 Port(clk:in std_logic;
 result: in std_logic_vector(5 downto 0);
 display: out std_logic_vector(6 downto 0));
end OutputInterface;
architecture Behavioral of OutputInterface is
begin
process(clk,result)
begin
if (clk'event and clk='1') then
 case result is 
   when "000000" => display <= "0000001"; --0
   when "000001" => display <= "1001111"; --1
   when "000010" => display <= "0010010"; --2
   when "000011" => display <= "0000110"; --3
   when "000100" => display <= "1001100"; --4
   when "000101" => display <= "0100100"; --5
   when "000110" => display <= "0100000"; --6
   when "000111" => display <= "0001111"; --7
   when "000111" => display <= "0000000"; --8
   when "000111" => display <= "0000100"; --9
when others => display <= "0000000"; -- Default to 0
 end case;
 end if;
 end process;
 end Behavioral;
