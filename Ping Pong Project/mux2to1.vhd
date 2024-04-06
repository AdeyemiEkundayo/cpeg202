----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2022 01:40:30 PM
-- Design Name: 
-- Module Name: mux2to1 - Behavioral
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

entity mux2to1 is
    Port ( I0 : in std_logic;
           I1 : in std_logic;
           sel : in std_logic;
           Y : out std_logic);
end mux2to1;

architecture Behavioral of mux2to1 is

begin

with sel select 
        Y <= I0 when '0',
             I1 when '1',
             '0' when others;

end Behavioral;