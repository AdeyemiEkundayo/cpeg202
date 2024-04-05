----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/16/2022 10:26:08 AM
-- Design Name: 
-- Module Name: ekundayoAdeyemi_lab0 - Behavioral
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

-- Library declaration
library IEEE;
use IEEE.STD_LOGIC_1164.ALL; -- Standard logic package for VHDL
use IEEE.numeric_std.all; -- Numeric standard library for arithmetic operations
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entity declaration for ekundayoAdeyemi_lab0
-- This block defines the input and output ports of the module
entity ekundayoAdeyemi_lab0 is
    Port ( A : in STD_LOGIC; -- Input port A
           B : in STD_LOGIC; -- Input port B
           C : in STD_LOGIC; -- Input port C
           D : in STD_LOGIC; -- Input port D
           X : out STD_LOGIC; -- Output port X
           Y : out STD_LOGIC; -- Output port Y
           Z : out STD_LOGIC); -- Output port Z
end ekundayoAdeyemi_lab0;

-- Architecture declaration of ekundayoAdeyemi_lab0
-- This section defines the behavior of the outputs based on the inputs
architecture Behavioral of ekundayoAdeyemi_lab0 is
begin
    -- Output X is the logical AND of inputs A and B
    X <= A and B;
    
    -- Output Y is the logical AND of the logical OR of inputs A and B with the logical NOT of input C
    Y <= (A or B) and not C;
    
    -- Output Z is the logical XOR of D with the logical OR of the logical AND of A, B, and C 
    -- and the logical OR of the logical NOT of A, B, and D
    Z <= ((A and B and C) or (not A or not B or not D)) xor D;

end Behavioral;
