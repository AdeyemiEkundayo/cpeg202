----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/02/2022 10:45:26 AM
-- Design Name: 
-- Module Name: ekundayoadeyemi_mux - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Implements a 4-to-1 multiplexer using behavioral VHDL.
--               The multiplexer selects one of the four input signals (I0, I1, I2, I3)
--               based on the 2-bit select signal (sel) and outputs the selected input
--               through the output signal Y.
--
-- Dependencies: Requires the IEEE STD_LOGIC_1164 library for the STD_LOGIC types.
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE; -- Standard library
use IEEE.STD_LOGIC_1164.ALL; -- Use the standard logic package

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

-- Entity declaration for the 4-to-1 multiplexer
entity ekundayoadeyemi_mux is
    Port ( I0 : in STD_LOGIC; -- Input signal 0
           I1 : in STD_LOGIC; -- Input signal 1
           I2 : in STD_LOGIC; -- Input signal 2
           I3 : in STD_LOGIC; -- Input signal 3
           sel : in STD_LOGIC_vector(1 downto 0); -- 2-bit select signal
           Y : out STD_LOGIC); -- Output signal
end ekundayoadeyemi_mux;

-- Behavioral architecture for the multiplexer
architecture Behavioral of ekundayoadeyemi_mux is

begin
    -- Multiplexer logic using a conditional signal assignment
    -- The output Y is determined by the value of the select signal sel
    with sel select
        Y <= I0 when "00", -- Select input I0 when sel is "00"
             I1 when "01", -- Select input I1 when sel is "01"
             I2 when "10", -- Select input I2 when sel is "10"
             I3 when others; -- Default case: select input I3
              
end Behavioral;
