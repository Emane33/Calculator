--each one is in seperated file

  --1. Subtraction :
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity subtractor is
Port(num1,num2: in std_logic_vector(2 downto 0);
result: out std_logic_vector(2 downto 0));
 end subtractor;
architecture Behavioral of subtractor is
begin
result <= std_logic_vector (unsigned(num1) - unsigned(num2));
end Behavioral;
  
--2. Addition :
-- The following codes for adder , subtractor, divide , multibly , do the arthmitec
calculations using adders
library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.All;
entity adder is
Port(num1, num2: in std_logic_vector (2 downto 0);
result : out std_logic_vector (2 downto 0));
end adder;
architecture Behavioral of adder is 
  begin
result <= std_logic_vector (unsigned(num1) + unsigned(num2));
end Behavioral;
  
--3. Multiplication
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity multiply is
Port(num1,num2: in std_logic_vector(2 downto 0);
result: out std_logic_vector(5 downto 0));
end multiply;
architecture Behavioral of multiply is
begin
result <= std_logic_vector (unsigned(num1) * unsigned(num2));
end Behavioral;

--4. Division
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity divide is
Port(num1,num2: in std_logic_vector(2 downto 0);
result: out std_logic_vector(2 downto 0));
end divide;
architecture Behavioral of divide is
begin
result <= std_logic_vector (unsigned(num1) / unsigned(num2));
end Behavioral;
