library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Debouncer_Counter is
Port (      clk : in STD_LOGIC;
            BTN_up : in STD_LOGIC;
            BTN_down : in STD_LOGIC;
            Counter_out: out STD_LOGIC_vector(3 downto 0));
end Debouncer_Counter;

architecture Behavioral of Debouncer_Counter is

signal pressed_up : std_logic;
signal pressed_down : std_logic;

signal sig_count : INTEGER := 0;

component debouncer is
    Port ( clk : in STD_LOGIC;
           bouncey : in STD_LOGIC;
           edge: out STD_LOGIC);
end component;

begin

    deb1 : debouncer
    port map (clk       => clk,
              bouncey => BTN_up,
              edge   => pressed_up);
              
    deb2 : debouncer
    port map (clk       => clk,
              bouncey => BTN_down,
              edge   => pressed_down);
   
   count : process (clk) is
   begin
        if rising_edge(clk) then
   		   if pressed_up = '1' and sig_count < 15 then
        	   sig_count <= sig_count + 1;
            elsif  pressed_down = '1' and sig_count > 0 then
        	   sig_count <= sig_count - 1;
            end if;
        end if;
   end process count;

   Counter_out <= std_logic_vector(to_unsigned(sig_count, Counter_out'length));
   
end Behavioral;