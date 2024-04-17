


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity display is
    Port ( clear : in STD_LOGIC;
            note : in STD_LOGIC_VECTOR (3 downto 0);  
            seg : out STD_LOGIC_VECTOR (6 downto 0));  
end display;

architecture Behavioral of display is
    
type note_meaning_array is array (natural range <>) of std_logic_vector(6 downto 0);
    constant note : note_meaning_array := (
        "00000",  -- do 
        "00001",  -- re
        "00010",  -- mi
        "00011",   -- fa
        "00100", -- sol
        "00101", -- la
        "00110" -- si
    );

    
begin

p_7seg_decoder : process (note, clear) is
begin

  if (clear = '1') then
    seg <= "1111111";  -- Clear the display
  else

    case bin is
      
      when "00000" => --do
        seg <= "1110010";
      when "00001" => -- re
        seg <= "1000010";
      when "00010" => -- mi
        seg <= "0110000";
      when "00011" => -- fa
        seg <= "0111000";
      when "00100" => -- sol
                seg <= "0100001";    
      when "00101" => -- la
                seg <= "0000010";    
      when "00110" => -- si
                seg <= "1101000";   
      when others =>
        seg <= "0000000";
                                  
    end case;

  end if;    
end process p_7seg_decoder;

end Behavioral;
