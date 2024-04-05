----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2022 02:11:30 PM
-- Design Name: 
-- Module Name: EkundayoAdeyemi_shifter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a configurable shifter that can perform various shift operations
--               based on input control signals. The shifter can handle logical shifts,
--               arithmetic shifts, and rotate operations both to the left and right, with
--               variable shift amounts.
-- 
-- Dependencies: Requires the IEEE standard logic library.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entity declaration for the shifter module
entity EkundayoAdeyemi_shifter is
    Port ( I : in STD_LOGIC_VECTOR(3 downto 0); -- Input data to be shifted
           Amt : in STD_LOGIC_VECTOR(1 downto 0); -- Amount to shift the input data
           R : in STD_LOGIC; -- Direction of the shift (1 for right, 0 for left)
           F : in STD_LOGIC; -- Fill bit used for logical shifts
           D : in STD_LOGIC; -- Determines if the operation is a rotate (1) or shift (0)
           En : in STD_LOGIC; -- Enable signal for the shifter
           Y : out STD_LOGIC_VECTOR(3 downto 0)); -- Output of the shifted data
end EkundayoAdeyemi_shifter;

-- Behavioral architecture of the shifter
architecture Behavioral of EkundayoAdeyemi_shifter is

begin

-- The shifting logic based on the control signals
Y <= 
    "0000" when En = '0' else -- Output is 0 when shifter is disabled
    I(3 downto 0) when Amt = "00" else -- No shift operation
    I(2 downto 0) & I(3) when (Amt = "01" and R = '1' and D = '0') else -- 1-bit right logical shift
    I(1 downto 0) & I(3 downto 2) when (Amt = "10" and R = '1' and D = '0') else -- 2-bit right logical shift
    I(0) & I(3 downto 1) when (Amt = "11" and R = '1' and D = '0') else -- 3-bit right logical shift
    
    I(2 downto 0) & F when (Amt = "01" and R = '0' and D = '0') else -- 1-bit left logical shift with fill
    I(1 downto 0) & F&F when (Amt = "10" and R = '0' and D = '0') else -- 2-bit left logical shift with fill
    I(0)  & F&F&F when (Amt = "11" and R = '0' and D = '0') else -- 3-bit left logical shift with fill
    
    I(0) & I(3 downto 1) when (Amt = "01" and R = '1' and D = '1') else -- 1-bit right rotate
    I(3 downto 2) & I(1 downto 0) when (Amt = "10" and R = '1' and D = '1') else -- 2-bit right rotate
    I(3)& I(2 downto 0) when (Amt = "11" and R = '1' and D = '1') else -- 3-bit right rotate
    
    F & I(3 downto 1) when (Amt = "01" and R = '0' and D = '1') else -- 1-bit left rotate with fill
    F&F & I(3 downto 2) when (Amt = "10" and R = '0' and D = '1') else -- 2-bit left rotate with fill
    F&F&F & I(3); -- 3-bit left rotate with fill

end Behavioral;
