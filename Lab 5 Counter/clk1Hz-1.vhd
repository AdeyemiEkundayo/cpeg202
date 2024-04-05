----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2022 01:35:36 PM
-- Design Name: 
-- Module Name: clk1Hz - Behavioral
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

-- Entity declaration for a 1Hz clock signal generator.
-- This component takes a high-frequency clock input and generates
-- a 1Hz clock output signal. It also supports a reset functionality.
entity clk1Hz is
    Port ( clk_in : in STD_LOGIC;  -- Input clock signal
           reset : in STD_LOGIC;  -- Reset signal (active high)
           clk_out : out STD_LOGIC);  -- Output 1Hz clock signal
end clk1Hz;

-- Behavioral architecture of the clk1Hz entity.
architecture Behavioral of clk1Hz is
    -- Internal signal used to toggle the output clock.
    signal temporal: STD_LOGIC;
    -- Counter to keep track of input clock cycles.
    -- Assuming the input clock is 125MHz, the counter ranges from 0 to 125,000,000
    -- to generate a 1Hz output clock.
    signal counter : integer range 0 to 125000000 := 0;
begin
    -- Process to divide the frequency of the input clock to generate a 1Hz clock.
    frequency_divider: process (reset, clk_in) begin
        if (reset = '1') then
            -- When reset is active, reset the internal signals.
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            -- On the rising edge of the input clock, check if the counter has reached its limit.
            if (counter = 125000000) then
                -- If the counter has reached the limit, toggle the temporal signal and reset the counter.
                temporal <= NOT(temporal);
                counter <= 0;
            else
                -- If the counter has not reached the limit, increment the counter.
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    -- Assign the internal temporal signal to the output clock signal.
    clk_out <= temporal;

end Behavioral;
