library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display is
    Port ( clk   : in  STD_LOGIC;
           clear : in STD_LOGIC;
           note : in STD_LOGIC_VECTOR (6 downto 0);  
           seg : out STD_LOGIC_VECTOR (6 downto 0));  
end display;

architecture Behavioral of display is


begin

    p_7seg_decoder : process (note, clear) is
    begin

        if (clear = '1') then
            seg <= "1111111";  -- Clear the display
        else

            case note is
      
                when "00000" =>  -- do
                    seg <= "1110010";
                when "00001" =>  -- re
                    seg <= "1000010";
                when "00010" =>  -- mi
                    seg <= "0110000";
                when "00100" =>  -- fa
                    seg <= "0111000";
                when "01000" =>  -- sol
                    seg <= "0100001";    
                when "10000" =>  -- la
                    seg <= "0000010";    
                when others =>
                    seg <= "1101000";
                                  
            end case;

        end if;    
    end process p_7seg_decoder;

end Behavioral;
