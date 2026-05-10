library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fsm_tb is
end fsm_tb;

architecture Behavioral of fsm_tb is
    signal clk : std_logic := '0';
    signal reset : std_logic := '0';
    signal red : std_logic;
    signal green : std_logic;
    signal yellow : std_logic;
begin
    uut: entity work.fsm
        port map (
            clk => clk,
            reset => reset,
            red => red,
            green => green,
            yellow => yellow
        );
    clk_process : process
    begin 
        while true loop
            clk <= '0';
            wait for 5ns;
            clk <= '1';
            wait for 5ns;
        end loop;
    end process;
    
    stim_process : process
    begin
        reset <= '1';
        wait for 20ns;
        reset <= '0';
        wait for 300ns;
        wait;
    end process;
end architecture;
