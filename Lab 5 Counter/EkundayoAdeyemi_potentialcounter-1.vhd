----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2022 01:22:20 PM
-- Design Name: 
-- Module Name: EkundayoAdeyemi_potentialcounter - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a 4-bit binary counter that resets to 0 after reaching 9.
--              The counter increments on each rising edge of the clock signal if not reset.
--              When reset is high, the counter resets to 0.
-- 
-- Dependencies: Requires IEEE std_logic_1164 for digital logic levels and 
--                ieee.std_logic_unsigned for arithmetic operations on std_logic_vector.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE; -- Standard library
use IEEE.STD_LOGIC_1164.ALL; -- Use standard logic levels
use ieee.std_logic_unsigned.all; -- Allows arithmetic operations on std_logic_vector

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entity declaration for the 4-bit binary counter
entity EkundayoAdeyemi_potentialcounter is
    Port ( Clock : in STD_LOGIC; -- Clock input
           Reset : in STD_LOGIC; -- Reset input
           Output : out STD_LOGIC_VECTOR(0 downto 3)); -- 4-bit output
end EkundayoAdeyemi_potentialcounter;

-- Behavioral architecture of the 4-bit binary counter
architecture Behavioral of EkundayoAdeyemi_potentialcounter is
    signal temp : std_logic_vector(0 downto 3); -- Internal signal to hold the counter value

begin
    -- Process block sensitive to Clock and Reset signals
    process (Clock, Reset) begin
        if(reset = '1') then
            temp <= "0000"; -- Reset the counter to 0 when Reset is high
        elsif(rising_edge (Clock)) then
            if temp = "1001" then
                temp <= "0000"; -- Reset counter to 0 when it reaches 9
            else 
                temp <= temp + 1; -- Increment the counter
            end if;
        end if;
    end process;
    Output <= temp; -- Assign the internal counter value to the output
    
end Behavioral;
