library verilog;
use verilog.vl_types.all;
entity transmit_16qam is
    port(
        CLOCK_50        : in     vl_logic;
        RESET           : in     vl_logic;
        PLL_OUT_DA      : out    vl_logic;
        DA_MODE         : out    vl_logic;
        DA_WRTA         : out    vl_logic;
        DAC_OUT         : out    vl_logic_vector(13 downto 0);
        sum             : out    vl_logic_vector(14 downto 0)
    );
end transmit_16qam;
