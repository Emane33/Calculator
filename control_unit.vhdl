--This code was coded using state machine to select the operation
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ControlUnit is
Port(clk: in std_logic;
 operation: in std_logic_vector(1 downto 0);
 state: out std_logic_vector(1 downto 0));
end ControlUnit;
architecture Behavioral of ControlUnit is
begin
process(clk,operation)
begin
if (clk'event and clk='1') then
case operation is
when "00" => state <= "00"; -- Addition
when "01" => state <= "01"; -- Subtraction
when "10" => state <= "10"; -- Multiplication
when "11" => state <= "11"; -- Division
when others => state <= "00"; -- Default to addition
end case;
end if;
end process;
 end Behavioral;
