-- this code handle the input form the user form the 10 max board to pass ot ton
the control unit
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity InputInterface is
Port(switch: in std_logic_vector(1 downto 0);
 num1, num2: in STD_LOGIC_VECTOR (2 downto 0);
 operation: out std_logic_vector(1 downto 0));
end InputInterface;
architecture Behavioral of InputInterface is
begin
 operation <= switch;
 end Behavioral;
