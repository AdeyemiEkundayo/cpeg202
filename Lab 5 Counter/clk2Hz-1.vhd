----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2022 01:37:11 PM
-- Design Name: 
-- Module Name: clk2Hz - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk2Hz is
    Port ( clk_in : in STD_LOGIC;  -- Input clock signal
           reset : in STD_LOGIC;   -- Reset signal
           clk_out : out STD_LOGIC);  -- Output clock signal at 2Hz
end clk2Hz;

architecture Behavioral of clk2Hz is
    signal temporal: STD_LOGIC;  -- Signal to toggle at 2Hz
    signal counter : integer range 0 to 62500000 := 0;  -- Counter to divide input frequency by 2
begin
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then  -- Reset condition
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then  -- Detect rising edge of input clock
            if (counter = 62500000) then  -- Check if half of input clock period has passed
                temporal <= NOT(temporal);  -- Toggle the output signal
                counter <= 0;  -- Reset counter
            else
                counter <= counter + 1;  -- Increment counter
            end if;
        end if;
    end process;
    
    clk_out <= temporal;  -- Assign the toggling signal to the output clock

end Behavioral;
