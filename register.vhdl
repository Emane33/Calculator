--register to store the numbers the the user enter and the result of
calculation
library ieee;
use ieee.std_logic_1164.all;
entity reg is
port(clk,rest, out_values, in_values: in std_logic;
 load: in std_logic_vector(6 downto 0);
 e: out std_logic_vector(6 downto 0));
 end reg;
architecture try of reg is
signal r: std_logic_vector(6 downto 0);
begin
process(clk,rest)
begin
if (rest='1') then
 e <= "0000000";
elsif (clk'event and clk='1') then
if (in_values='1') then
 r <= load;
elsif ( out_values='1') then
e <= r;
end if;
end if;
end process;
end try;
