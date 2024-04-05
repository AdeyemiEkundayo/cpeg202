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
-- Description: Implements a simple 2-to-1 multiplexer using behavioral VHDL.
--              The multiplexer selects between two inputs based on a single-bit selector.
-- 
-- Dependencies: Requires the IEEE STD_LOGIC_1164 library for the STD_LOGIC data type.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE; -- Standard library for VHDL.
use IEEE.STD_LOGIC_1164.ALL; -- Use the STD_LOGIC_1164 package for standard logic vector types.

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entity declaration for the 2-to-1 multiplexer.
entity mux2to1 is
    Port ( I0 : in STD_LOGIC; -- Input 0
           I1 : in STD_LOGIC; -- Input 1
           sel : in STD_LOGIC; -- Selector input
           Y : out STD_LOGIC); -- Output
end mux2to1;

-- Behavioral architecture for the mux2to1 entity.
architecture Behavioral of mux2to1 is

begin

-- Multiplexer logic using a conditional signal assignment.
-- The output Y is assigned based on the value of the selector 'sel'.
-- If sel is '0', Y is assigned the value of I0. If sel is '1', Y is assigned the value of I1.
-- In any other case (covered by 'others'), Y is assigned '0'.
with sel select 
        Y <= I0 when '0',
             I1 when '1',
             '0' when others;

end Behavioral;
