library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
        clk    : in std_logic;   
        reset  : in std_logic;
        red    : out std_logic;
        green  : out std_logic;
        yellow : out std_logic
    );
end entity;

architecture rtl of fsm is

    type state_type is (S_RED, S_GREEN, S_YELLOW);
    signal state : state_type := S_RED;
    signal count : integer := 0;

begin

    process(clk, reset)
    begin
        if reset = '1' then
            state <= S_RED;
            count <= 0;

        elsif rising_edge(clk) then
            case state is

                when S_RED =>
                    if count = 5 then
                        state <= S_GREEN;
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;

                when S_GREEN =>
                    if count = 5 then
                        state <= S_YELLOW;
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;

                when S_YELLOW =>
                    if count = 2 then
                        state <= S_RED;
                        count <= 0;
                    else
                        count <= count + 1;
                    end if;

            end case;
        end if;
    end process;

    red    <= '1' when state = S_RED else '0';
    green  <= '1' when state = S_GREEN else '0';
    yellow <= '1' when state = S_YELLOW else '0';

end rtl;