--This code gather all the codes in one place for port mapping
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity final_design is
port(clk, outValues , inValuse : in std_logic;
 switch: in std_logic_vector(1 downto 0);
 num1 , num2 : in std_logic_vector(2 downto 0);
display : out std_logic_vector(6 downto 0));
end final_design;
architecture try of final_design is
 -- The signals
signal clk2 : std_logic; -- 1-bit. for the clock division
signal result1 , result2 ,result3 : std_logic_vector(2 downto 0); -- 3-bits. the
result of majority calculations
signal result4: std_logic_vector(5 downto 0); -- 6-bit. the result of multiplication
signal finalResult: std_logic_vector(5 downto 0); -- the final result of the
multiplexer
signal states : std_logic_vector(1 downto 0); -- 2-bit. the states for the cotrol unit
code
signal operation: std_logic_vector(1 downto 0); -- 2-bit. the coperations for the
input interface
signal outDisplay : std_logic_vector(6 downto 0); -- 6-bit. when the person wants
to output the result of the "finalResult"
signal rest : std_logic; -- 1-bit. if we wanted to reset the display result
-- The clock division component
Component clk_div_1hz is
Port(clk1Mhz : in std_logic;
 clk1hz : out std_logic);
end component;
-- The register component
component reg is
port(clk,rest, out_values, in_values: in std_logic;
 load: in std_logic_vector(6 downto 0);
e: out std_logic_vector(6 downto 0));
end component;
-- The multiplexer component
component mux is
Port(operation: in std_logic_vector(1 downto 0);
add_result,sub_result,div_result: in std_logic_vector(2 downto 0);
 mul_result: in std_logic_vector(5 downto 0);
 result: out std_logic_vector(5 downto 0));
end component;
-- The subtractor component
component subtractor is
Port(num1,num2: in std_logic_vector(2 downto 0);
result: out std_logic_vector(2 downto 0));
end component;
-- The adder component
component adder is
Port(num1, num2: in std_logic_vector (2 downto 0);
result : out std_logic_vector (2 downto 0));
end component; 
-- The multiply component
component multiply is
Port(num1,num2: in std_logic_vector(2 downto 0);
 result: out std_logic_vector(5 downto 0));
end component;
-- The division component
component divide is
Port(num1,num2: in std_logic_vector(2 downto 0);
 result: out std_logic_vector(2 downto 0));
end component;
-- The input interface component
component InputInterface is
Port(switch: in std_logic_vector(1 downto 0);
 num1, num2: in std_logic_vector (2 downto 0);
 operation: out std_logic_vector(1 downto 0));
end component;
-- The output interface component
component OutputInterface is
Port(clk:in std_logic;
 result: in std_logic_vector(5 downto 0);
 display: out std_logic_vector(6 downto 0));
end component;
-- The control unit conponent
component ControlUnit is
Port(clk: in std_logic;
 operation: in std_logic_vector(1 downto 0);
 state: out std_logic_vector(1 downto 0));
end component;
begin
 -- Start the architecture now
u0 : clk_div_1hz port map (clk,clk2); -- the clock division
u1 : adder port map (num1,num2,result1); -- the addition
u2 : subtractor port map (num1,num2,result2); -- the subtraction
u3 : divide port map (num1,num2,result3); -- the division
u4 : multiply port map (num1,num2,result4); -- the multiplication
u5 : ControlUnit port map (clk,switch,states); -- the control unit
u6 : InputInterface port map (switch,num1,num2,operation); -- the input
interface
u7 : mux port map (operation,result1,result2,result3,result4,finalResult); -- the
multiplexer
u8: OutputInterface port map (clk,finalResult,outDisplay); -- the output interface
u9 : reg port map (clk,rest,outValues,inValuse,outDisplay,display); -- the register
end try;
