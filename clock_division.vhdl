--this code was taken from the Doctor vhdl codes for clk division
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
entity clk_div_1hz is
Port(clk1Mhz: in std_logic;
 clk1hz: out std_logic);
end clk_div_1hz;
architecture Behavioral of clk_div_1hz is
begin
process(clk1Mhz)
variable cnt : integer range 0 to 1000000;
begin
if (clk1Mhz'event and clk1Mhz='1') then
if (cnt=1000000) then
cnt:= 0;
elsif (cnt < 500000 )then
cnt:= cnt+1;
clk1hz<='0';
elsif (cnt=500000) then
cnt:= cnt+1;
clk1hz<='1';
end if;
end if;
end process;
end Behavioral;
