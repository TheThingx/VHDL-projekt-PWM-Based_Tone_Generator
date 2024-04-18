library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_level is
Port (      CLK100MHZ : in STD_LOGIC;
            BTNC : in STD_LOGIC;
            BTNL : in STD_LOGIC;
            BTNR : in STD_LOGIC;
            BTNU : in STD_LOGIC;
            BTND : in STD_LOGIC;
            SW: in STD_LOGIC_vector(4 downto 0);
            LED: out STD_LOGIC_vector(4 downto 0);
            AUD_PWM : out STD_LOGIC;
            JA : out STD_LOGIC);
end top_level;

architecture Behavioral of top_level is

component Tone_Generator
        port (clk       : in std_logic;
              en        : in std_logic;
              tone_freq : in std_logic_vector (4 downto 0);
              tone_ampl : in std_logic_vector (3 downto 0);
              pwm_out   : out std_logic);
end component;
    
component debounce is
    Port ( CLK : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           PWM_Per: in STD_LOGIC_vector(3 downto 0);
           En_PWM : out STD_LOGIC);
end component;

component debouncer_Counter is
    Port (  clk : in STD_LOGIC;
            BTN_up : in STD_LOGIC;
            BTN_down : in STD_LOGIC;
            Counter_out: out STD_LOGIC_vector(3 downto 0));
end component;


signal En_PWM_sig : std_logic;
signal PWM_amplitude : std_logic_vector (3 downto 0);
signal PWM_period : std_logic_vector (3 downto 0);
signal PWM : std_logic;

begin

    gen : Tone_Generator
    port map (clk       => CLK100MHZ,
              en        => En_PWM_sig,
              tone_freq => SW,
              tone_ampl => PWM_amplitude,
              pwm_out   => PWM);
          
    MKO : debounce
    port map (clk       => CLK100MHZ,
              en_PWM        => En_PWM_sig,
              BTNC => BTNC,
              PWM_Per => PWM_period);    
   
   deb_counter1 : Debouncer_Counter
   port map  (clk       => CLK100MHZ,
              BTN_up        => BTNR,
              BTN_down => BTNL,
              Counter_out => PWM_period); 
            
   deb_counter2 : Debouncer_Counter
   port map  (clk       => CLK100MHZ,
              BTN_up        => BTNU,
              BTN_down => BTND,
              Counter_out => PWM_amplitude);  
                      
   AUD_PWM <= PWM;
   LED <= SW;
   JA <= PWM;
   
end Behavioral;
