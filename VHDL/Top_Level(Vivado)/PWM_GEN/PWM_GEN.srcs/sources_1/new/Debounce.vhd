
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity debouncer is
    Port ( clk : in STD_LOGIC;
           bouncey : in STD_LOGIC;
           edge: out STD_LOGIC);
           
end debouncer;

architecture Behavioral of debouncer is
    signal delayed: std_logic;

    type   state_type is (RELEASED, PRE_PRESSED, PRESSED, PRE_RELEASED);
    signal state : state_type;
    
    -- Define number of periods for debounce counter
    constant DEB_COUNT : integer := 4;

    -- Define signals for debounce counter
    signal sig_count : integer range 0 to DEB_COUNT;

    -- Debounced signal
    signal sig_clean : std_logic;
begin

p_fsm : process (clk) is
    begin

        if rising_edge(clk) then
                case state is
                    when RELEASED =>
                        if bouncey = '1' then
                            sig_count <= 0;
                            state <= PRE_PRESSED;
                        end if;
                        
                    when PRE_PRESSED =>
                        if bouncey = '1' then
                            sig_count <= sig_count +1;
                            if sig_count = DEB_COUNT - 1 then
                                state <= PRESSED;
                            end if;
                        else
                            state <= RELEASED;
                        end if;
                        
                    when PRESSED =>
                        if bouncey = '0' then
                            sig_count <= 0;
                            state <= PRE_RELEASED;
                        end if;

                    when PRE_RELEASED =>
                        if bouncey = '0' then
                            sig_count <= sig_count +1;
                            if sig_count = DEB_COUNT - 1 then
                                state <= RELEASED;
                            end if;
                        else
                            state <= PRESSED;
                        end if;
                   
                    when others =>
                        null;
                end case;
            end if;

    end process p_fsm;

    sig_clean <= '1' when (state = PRESSED or state = PRE_RELEASED) else '0';
   
	
   	edge_detector : process (clk) is
    begin

        if rising_edge(clk) then
        	delayed <= sig_clean;
        end if;

    end process edge_detector; 
    
    edge <= sig_clean and not(delayed);
    
    
end Behavioral;
