----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/18/2019 02:38:21 PM
-- Design Name: 
-- Module Name: lab6_dff_tb - Behavioral
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

-- Entity declaration for the lab6_dff testbench
entity lab6_dff_tb is
--  Port ( );
end lab6_dff_tb;

-- Architecture declaration of the lab6_dff testbench
architecture Behavioral of lab6_dff_tb is

-- Signal declarations for simulating input and output
signal clk_sim : std_logic := '0'; -- Clock signal for simulation
signal rst_sim : std_logic := '0'; -- Reset signal for simulation
signal d_sim : std_logic := '0'; -- Data input signal for simulation
signal q_sim : std_logic := '0'; -- Data output signal for simulation

-- Component declaration for the lab6_dff D flip-flop
component lab6_dff is
    Port ( clk : in STD_LOGIC;
           d : in STD_LOGIC;
           rst : in STD_LOGIC;
           q : out STD_LOGIC);
end component;

-- Constant declaration for clock period
constant clk_period : time := 10 ns; -- Clock period of 10 ns

begin
-- Clock signal generation
-- Inverts the clk signal every half period to simulate a clock
    clk_sim <= not clk_sim after clk_period / 2;
    
    -- Data signal (d) simulation pattern
    d_sim <= '0' after 0 ns, -- Initially set to 0
             '1' after 8 ns, -- Set to 1 at 8ns
             '0' after 20 ns, -- Set to 0 at 20ns
             '1' after 35 ns; -- Set to 1 after 35 ns
     
    -- Reset signal (rst) simulation pattern
    rst_sim <=  '0' after 0ns, -- Initially set to 0
                '1' after 20ns, -- Set to 1 after 20ns
                '0' after 24ns, -- Set to 0 after 24ns
                '1' after 30ns, -- Set to 1 after 30ns
                '0' after 40ns; -- Set to 0 after 40ns
    
    -- Instantiation of the lab6_dff component with port mapping
dff1 : lab6_dff 
	port map(
		clk=>clk_sim, -- Connect clk_sim to clk
		rst=>rst_sim, -- Connect rst_sim to rst
		d=>d_sim, -- Connect d_sim to d
		q=>q_sim -- Connect q_sim to q
    );
end Behavioral;
