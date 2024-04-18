library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity mux is
    Port (
        clk: in STD_LOGIC;
        note_in: in STD_LOGIC_VECTOR(6 downto 0); -- (C, D, E, F, G, A, B)
        octave_in: in STD_LOGIC_VECTOR(6 downto 0); --(4, 5, 6, 7, 8)
        to_7seg: out STD_LOGIC_VECTOR(6 downto 0);
        to_anod_0: out STD_LOGIC_VECTOR(7 downto 0)
    );
end mux;

architecture Behavioral of mux is

    signal counter : integer range 0 to 1000000 := 0; 
    signal selected_input : STD_LOGIC_VECTOR(6 downto 0);

begin
    process (clk) is
    begin
        if rising_edge(clk) then
            counter <= counter + 1;
            if counter = 100000 then
                selected_input <= note_in;
                to_anod_0 <= "11111110";
            elsif counter = 200000 then
                selected_input <= octave_in;
                to_anod_0 <= "11111101";
                counter <= 0;
            end if;
        end if;
    end process;
    
    to_7seg <= selected_input;

end Behavioral;
