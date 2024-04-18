library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
    Port ( 
        CLK100MHZ : in  std_logic;
        SW        : in  std_logic_vector(4 downto 0);
        CA        : out std_logic;
        CB        : out std_logic;
        CC        : out std_logic;
        CD        : out std_logic;
        CE        : out std_logic;
        CF        : out std_logic;
        CG        : out std_logic;
        AN        : out std_logic_vector(7 downto 0)
    );
end top_level;

architecture behavioral of top_level is

    -- Component declarations
    component divider is
        Port (
            note  : in STD_LOGIC_VECTOR(4 downto 0); 
            seg_out_1 : out STD_LOGIC_VECTOR(6 downto 0); 
            seg_out_2 : out STD_LOGIC_VECTOR(6 downto 0) 
        );
    end component;

    component mux is
       Port (
            clk      : in STD_LOGIC;
            note_in  : in STD_LOGIC_VECTOR(6 downto 0);
            octave_in: in STD_LOGIC_VECTOR(6 downto 0);
            to_7seg  : out STD_LOGIC_VECTOR(6 downto 0);
            to_anod_0: out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Signals declaration
    signal segments     : std_logic_vector(6 downto 0);
    signal sig_out_1    : std_logic_vector(6 downto 0);
    signal sig_out_2    : std_logic_vector(6 downto 0);
    signal to_7seg_mux  : std_logic_vector(6 downto 0);
    signal to_anod_0_mux: std_logic_vector(7 downto 0);

begin

    -- Instantiate Divider
    Divider_inst : divider
        port map (
            note   => SW,
            seg_out_1 => sig_out_1,
            seg_out_2 => sig_out_2
        );

    -- Instantiate Mux
    Mux_inst : mux
        port map (
            clk       => CLK100MHZ,
            note_in   => sig_out_1,
            octave_in => sig_out_2,
            to_7seg   => segments,
            to_anod_0=> to_anod_0_mux
        );

    -- Assignments for seven-segment display
    CA <= segments(6);
    CB <= segments(5);
    CC <= segments(4);
    CD <= segments(3);
    CE <= segments(2);
    CF <= segments(1);
    CG <= segments(0);

    -- Assignments for multiplexing
    AN(7 downto 2) <= b"11_1111";
    AN(1) <= to_anod_0_mux(1);
    AN(0) <= to_anod_0_mux(0); 

end behavioral;
