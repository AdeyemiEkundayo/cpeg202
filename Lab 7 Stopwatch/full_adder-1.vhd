----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2022 10:05:02 AM
-- Design Name: 
-- Module Name: full_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE; -- Standard library declaration for VHDL
use IEEE.STD_LOGIC_1164.ALL; -- Use the standard logic package for digital circuit design

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entity declaration for a full adder
entity full_adder is
    -- Define the input and output ports
    Port ( A, B, Cin : in STD_LOGIC; -- Inputs: A, B, and carry-in (Cin)
           S,Cout : out STD_LOGIC); -- Outputs: Sum (S) and carry-out (Cout)
end full_adder;

-- Architecture declaration of the full adder, specifying its behavior
architecture Behavioral of full_adder is
begin
    -- Sum (S) is calculated as the XOR of inputs A, B, and Cin
    S <= A XOR B XOR Cin ;
    -- Carry-out (Cout) is calculated based on the logic provided
    -- Cout is 1 if any two or all three inputs are 1
    Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B) ;

end Behavioral;
