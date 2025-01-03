-- 4 to 1 multiplixer that takes the numbers and do the operation according to
what is selceted then output the
--Result depending on which operation
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.All;
entity mux is
Port(operation: in std_logic_vector(1 downto 0);
add_result,sub_result,div_result: in std_logic_vector(2 downto 0);
mul_result: in std_logic_vector(5 downto 0);
result: out std_logic_vector(5 downto 0));
end mux;
architecture try of mux is
begin
with operation select
result <= ("000" & add_result) when "00",
("000" & sub_result) when "01",
(mul_result) when "10",
("000" & div_result) when "11",
"000000" when others;
 end try;
