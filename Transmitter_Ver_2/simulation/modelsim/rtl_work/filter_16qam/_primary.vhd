library verilog;
use verilog.vl_types.all;
entity filter_16qam is
    generic(
        SPS             : integer := 8;
        SPAN            : integer := 16;
        BIT_SYM         : integer := 4;
        BIT_WIDTH       : integer := 14
    );
    port(
        clock_sample    : in     vl_logic;
        clock_symbol    : in     vl_logic;
        reset           : in     vl_logic;
        count           : in     vl_logic_vector;
        symbol          : in     vl_logic_vector;
        dac_out         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SPS : constant is 1;
    attribute mti_svvh_generic_type of SPAN : constant is 1;
    attribute mti_svvh_generic_type of BIT_SYM : constant is 1;
    attribute mti_svvh_generic_type of BIT_WIDTH : constant is 1;
end filter_16qam;
