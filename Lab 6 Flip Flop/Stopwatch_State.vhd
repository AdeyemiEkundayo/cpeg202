----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2022 02:46:09 PM
-- Design Name: 
-- Module Name: Stopwatch_State - Behavioral
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

entity Stopwatch_State is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           stop : in STD_LOGIC;
           start : in STD_LOGIC;
           clkState : out STD_LOGIC);
end Stopwatch_State;

architecture Behavioral of Stopwatch_State is

signal state : STD_LOGIC;

begin process (clk, rst, stop, start)
    begin
        if (rst = '1') then
            state <= '0';
            
        elsif (rising_edge(clk)) then
            if (stop = '1') then
                state <= '0';
               
            elsif (start = '1') then
                state <= '1';
                   
       end if;
     end if;
        
   end process; 

clkState <= clk when state = '1' else '0';

end Behavioral;
