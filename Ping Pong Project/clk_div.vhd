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

entity clk_div is
    port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is

    component clk1Hz
        port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
    end component;
    
    component clk2Hz 
        port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
    end component;

    component mux2to1 
        port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           sel : in STD_LOGIC;
           Y : out STD_LOGIC);
    end component;
    
   
    signal clk_count_1Hz : std_logic;
    signal clk_count_2Hz : std_logic;
      
begin
--1Hz clock divider
    div_1 : clk1Hz port map(
        clk_in => clk_in,
        reset => reset,
        clk_out => clk_count_1Hz
    );

--2Hz clock divider
    div_2 : clk2Hz port map(
        clk_in => clk_in,
        reset => reset,
        clk_out => clk_count_2Hz
    );
    
--multiplexer
    muxl : mux2to1 port map (
        I0 => clk_count_1Hz,
        I1 => clk_count_2Hz,
        sel => sw,
        Y => clk_out
    );
end Behavioral;