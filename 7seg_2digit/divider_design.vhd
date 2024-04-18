library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider is
    Port (
        note: in STD_LOGIC_VECTOR(4 downto 0); -- Signal for the note (C, D, E, F, G, A, B)
        seg_out_1 : out STD_LOGIC_VECTOR(6 downto 0); -- for display 1
        seg_out_2 : out STD_LOGIC_VECTOR(6 downto 0) -- for display 2
    );
end divider;

architecture Behavioral of divider is

    signal note_display : STD_LOGIC_VECTOR(6 downto 0);
    signal octave_display : STD_LOGIC_VECTOR(6 downto 0);

begin

octave: process (note)
begin
    if note < "00111" then
        octave_display <= "1001100"; --4
    elsif note >= "00111" and note < "01110" then
        octave_display <= "0100100"; --5
    elsif note >= "01110" and note < "10101" then
        octave_display <= "0100000"; --6
    elsif note >= "10101" and note < "11100" then
        octave_display <= "0001111"; --7
    elsif note >= "11100" and note <= "11111" then
        octave_display <= "0000000"; --8
    else
        octave_display <= "1111110"; 
    end if;
end process;

process (note)
begin
    case note is
        when "00000" | "00111" | "01110" | "10101" | "11100" =>
            note_display <= "0110001"; -- C
        when "00001" | "01000" | "01111" | "10110" | "11101" =>
            note_display <= "1000010"; -- D
        when "00010" | "01001" | "10000" | "10111" | "11110" =>
            note_display <= "0110000"; -- E
        when "00011" | "01010" | "10001" | "11000" | "11111"=>
            note_display <= "0111000"; -- F
        when "00100" | "01011" | "10010" | "11001" =>
            note_display <= "0100001"; -- G
        when "00101" | "01100" | "10011" | "11010" =>
            note_display <= "0001000"; -- A
        when "00110" | "01101" | "10100" | "11011" =>
            note_display <= "1100000"; -- B
        when others =>
            note_display <= "1111110";
    end case;
end process;

seg_out_1 <= note_display;
seg_out_2 <= octave_display;

end Behavioral;
