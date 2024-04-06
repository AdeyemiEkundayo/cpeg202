----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2022 10:27:07 AM
-- Design Name: 
-- Module Name: pong_stateMachine - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pong_stateMachine is
    Port ( clk, reset, p1buffer, p2buffer : in std_logic;
           p1score,p2score: out std_logic_vector(3 downto 0);
           led : out std_logic_vector(2 downto 0));         
end pong_stateMachine;

architecture Behavioral of pong_stateMachine is

    signal current_state, next_state : std_logic_vector(2 downto 0);
    signal current_led, next_led : std_logic_vector(2 downto 0);
    signal P1t,P2t : integer range 0 to 10 := 0;
    signal ply1_currents,ply2_currents : std_logic_vector(3 downto 0);
    signal ply1_nexts, ply2nexts : std_logic_vector(3 downto 0);
    signal score_flag : std_logic_vector (1 downto 0);

begin

    led <= current_led;
    
    p1score <= std_logic_vector (to_unsigned(P1t, p1score'length));
    p2score <= std_logic_vector (to_unsigned(P2t, p2score'length));
    
    state_machine : process(clk, reset)
        begin
            if (rising_edge(clk)) then
                if (reset = '1') then 
                    current_state <= "000";
                    current_led <= "000";
                    P1t <= 0;
                    P2t <= 0;
                    
                else
                    if (P1t > 9 or P2t > 9) then
                        current_state <= "000";
                        current_led <= "000";
                        P1t <= 0;
                        P2t <= 0;
                    else
                        current_state <= next_state;
                        current_led <= next_led;
                        if (score_flag = "01") then
                            P2t <= P2t  + 1;
                            P1t <= P1t;
                        elsif (score_flag = "10") then
                            P1t <= P1t  + 1;
                            P2t <= P2t;
                        else
                            P1t <= P1t;
                            P2t <= P2t;
                            
                        end if;                    
                    end if;         
                end if;        
            end if;
    end process;

    outputs: process (current_state, current_led) --add in extra state, need 3 bits instead of 2. 
        begin 
             --State 0
            if (current_state = "000") then 
                
                next_led <= "000";
                next_state <= "001";
                score_flag <="00";
            --State 1
            elsif (current_state = "001") then 
            --Check if current LED is at max value
                if (current_led = "110") then
                    next_state <= "010";
                    next_led <= "111";
                else 
                    next_state <= "001";
                    next_led <=  std_logic_vector(unsigned(current_led) + 1);
                end if;
                score_flag <="00";
            --State 2
            elsif (current_state = "010") then 
                if (p2buffer = '1') then
                    next_state <= "011";
                    next_led <= "110";
                else
                    next_state <= "101";
                    next_led <= "000";  
                end if;
                score_flag <="00";
            --State 3
            elsif (current_state = "011") then 
                if (current_led  = "001") then 
                    next_state <= "100";
                    next_led <= "000";
                else
                    next_state <= "011";
                    next_led <=  std_logic_vector(unsigned(current_led) - 1);
                end if;
                score_flag <="00";
           --State 4
           elsif (current_state = "100") then 
                if (p1buffer = '1') then
                    next_state <= "001";
                    next_led <= "001";
                else
                    next_state <= "110";
                    next_led <= "111";
                end if;
                score_flag <="00";
           --State 5    
           elsif (current_state = "101") then     
               score_flag <= "10";
               next_state <= "001";
               next_led <= "000";
           elsif (current_state = "110") then
               score_flag <= "01";
               next_state <= "011";
               next_led <= "111";   
           end if;
     end process;

   
end Behavioral;
