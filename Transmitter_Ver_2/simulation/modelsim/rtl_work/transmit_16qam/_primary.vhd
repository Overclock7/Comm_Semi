library verilog;
use verilog.vl_types.all;
entity transmit_16qam is
    generic(
        SPS             : integer := 8;
        BIT_SYM         : integer := 4;
        BIT_DAC         : integer := 14
    );
    port(
        CLOCK_50        : in     vl_logic;
        RESET           : in     vl_logic;
        PLL_OUT_DA      : out    vl_logic;
        DA_MODE         : out    vl_logic;
        DA_WRTA         : out    vl_logic;
        DAC_OUT         : out    vl_logic_vector(13 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SPS : constant is 1;
    attribute mti_svvh_generic_type of BIT_SYM : constant is 1;
    attribute mti_svvh_generic_type of BIT_DAC : constant is 1;
end transmit_16qam;
