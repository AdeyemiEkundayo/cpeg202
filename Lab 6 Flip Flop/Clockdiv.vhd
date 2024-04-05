----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2022 03:04:17 PM
-- Design Name: 
-- Module Name: Clockdiv - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Clockdiv is
    Port ( clk_in : in STD_LOGIC;
           reset : in STD_LOGIC;
           sw : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end Clockdiv;

architecture Behavioral of Clockdiv is

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

    component Two2One2 
        port ( SEL : in  STD_LOGIC;
           I0   : in  STD_LOGIC;
           I1   : in  STD_LOGIC;
           Y   : out STD_LOGIC);
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
    muxl : Two2One2 port map (
        I0 => clk_count_1Hz,
        I1 => clk_count_2Hz,
        SEL => sw,
        Y => clk_out
    );

end Behavioral;
