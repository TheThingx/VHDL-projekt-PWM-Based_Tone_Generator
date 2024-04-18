library ieee;
use ieee.std_logic_1164.all;

entity tb_Debouncer_Counter is
end tb_Debouncer_Counter;

architecture tb of tb_Debouncer_Counter is

    component Debouncer_Counter
        port (CLK100MHZ   : in std_logic;
              BTN_up      : in std_logic;
              BTN_down    : in std_logic;
              Counter_out : out std_logic_vector (3 downto 0));
    end component;

    signal CLK100MHZ   : std_logic;
    signal BTN_up      : std_logic;
    signal BTN_down    : std_logic;
    signal Counter_out : std_logic_vector (3 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : Debouncer_Counter
    port map (CLK100MHZ   => CLK100MHZ,
              BTN_up      => BTN_up,
              BTN_down    => BTN_down,
              Counter_out => Counter_out);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK100MHZ is really your main clock signal
    CLK100MHZ <= TbClock;

    stimuli : process
    begin
    
        BTN_up <= '0';
        BTN_down <= '0';
        wait for 100ns;
        BTN_up <= '1';
        wait for 100ns;
        BTN_up <= '0';
        wait for 100ns;
        BTN_down <= '1';
        wait for 100ns;
        BTN_down <= '0';
        wait for 1000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_Debouncer_Counter of tb_Debouncer_Counter is
    for tb
    end for;
end cfg_tb_Debouncer_Counter;