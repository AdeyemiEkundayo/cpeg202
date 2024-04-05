----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2022 01:44:13 PM
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

-- Entity declaration for clk_div
-- This entity represents a clock divider with a selectable output frequency.
-- It takes an input clock (clk_in), a reset signal, and a selection switch (sw).
-- Based on the position of the switch (sw), it outputs a clock signal (clk_out) at a different frequency.
entity clk_div is
    port ( clk_in : in STD_LOGIC;  -- Input clock signal
           reset : in STD_LOGIC;   -- Reset signal
           sw : in STD_LOGIC;      -- Selection switch for output frequency
           clk_out : out STD_LOGIC); -- Output clock signal at selected frequency
end clk_div;

-- Architecture Behavioral of clk_div
-- This architecture implements the functionality of the clk_div entity using components.
architecture Behavioral of clk_div is

    -- Component declaration for clk1Hz
    -- This component is expected to divide the input clock to 1Hz frequency.
    component clk1Hz
        port ( clk_in : in STD_LOGIC;  -- Input clock signal
               reset : in STD_LOGIC;   -- Reset signal
               clk_out : out STD_LOGIC); -- Output clock signal at 1Hz
    end component;
    
    -- Component declaration for clk2Hz
    -- This component is expected to divide the input clock to 2Hz frequency.
    component clk2Hz 
        port ( clk_in : in STD_LOGIC;  -- Input clock signal
               reset : in STD_LOGIC;   -- Reset signal
               clk_out : out STD_LOGIC); -- Output clock signal at 2Hz
    end component;

    -- Component declaration for mux2to1
    -- This component is a 2-to-1 multiplexer that selects one of the two input signals based on the sel signal.
    component mux2to1 
        port ( I0 : in STD_LOGIC;  -- Input signal 0
               I1 : in STD_LOGIC;  -- Input signal 1
               sel : in STD_LOGIC; -- Selection signal
               Y : out STD_LOGIC); -- Output signal based on selection
    end component;
    
    -- Internal signals for connecting components
    signal clk_count_1Hz : std_logic; -- Intermediate signal for 1Hz clock output
    signal clk_count_2Hz : std_logic; -- Intermediate signal for 2Hz clock output
      
begin
-- Instantiation of the 1Hz clock divider component
-- This component divides the input clock to a 1Hz frequency.
    div_1 : clk1Hz port map(
        clk_in => clk_in,
        reset => reset,
        clk_out => clk_count_1Hz
    );

-- Instantiation of the 2Hz clock divider component
-- This component divides the input clock to a 2Hz frequency.
    div_2 : clk2Hz port map(
        clk_in => clk_in,
        reset => reset,
        clk_out => clk_count_2Hz
    );
    
-- Instantiation of the multiplexer component
-- This multiplexer selects between the 1Hz and 2Hz clock signals based on the sw signal.
    muxl : mux2to1 port map (
        I0 => clk_count_1Hz,
        I1 => clk_count_2Hz,
        sel => sw,
        Y => clk_out
    );
end Behavioral;
