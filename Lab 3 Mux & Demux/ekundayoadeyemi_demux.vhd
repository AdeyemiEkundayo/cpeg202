----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/07/2022 10:56:25 AM
-- Design Name: 
-- Module Name: ekundayoadeyemi_demux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a 1-to-4 demultiplexer using behavioral VHDL.
--              The demux takes a single input 'I' and directs it to one of the four outputs (Y0, Y1, Y2, Y3)
--              based on the 2-bit select input 'sel'.
--
-- Dependencies: Requires the IEEE STD_LOGIC_1164 library for the STD_LOGIC data types.
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE; -- Standard library that includes essential types
use IEEE.STD_LOGIC_1164.ALL; -- Use the STD_LOGIC types from the IEEE library

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ekundayoadeyemi_demux is
    Port ( I : in STD_LOGIC; -- Single input to be demultiplexed
           sel : in STD_LOGIC_VECTOR (1 downto 0); -- 2-bit select input to choose the output channel
           Y0 : out STD_LOGIC; -- Output channel 0
           Y1 : out STD_LOGIC; -- Output channel 1
           Y2 : out STD_LOGIC; -- Output channel 2
           Y3 : out STD_LOGIC); -- Output channel 3
end ekundayoadeyemi_demux;

architecture Behavioral of ekundayoadeyemi_demux is
-- The behavioral architecture defines how the demux behaves based on the inputs

begin
    -- Output assignment using conditional signal assignment statements
    Y0 <= I when sel = "00" else '0'; -- Direct the input 'I' to Y0 when sel is "00", else output '0'
    Y1 <= I when sel = "01" else '0'; -- Direct the input 'I' to Y1 when sel is "01", else output '0'
    Y2 <= I when sel = "10" else '0'; -- Direct the input 'I' to Y2 when sel is "10", else output '0'
    Y3 <= I when sel = "11" else '0'; -- Direct the input 'I' to Y3 when sel is "11", else output '0'
end Behavioral;
