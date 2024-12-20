library verilog;
use verilog.vl_types.all;
entity filter_qpsk is
    generic(
        SPS             : integer := 8;
        SPAN            : integer := 16;
        BIT_DAC         : integer := 14;
        BIT_WIDTH       : integer := 14;
        BIT_RE          : integer := 1
    );
    port(
        clock_5000      : in     vl_logic;
        reset           : in     vl_logic;
        if_out          : out    vl_logic_vector;
        base_out        : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SPS : constant is 1;
    attribute mti_svvh_generic_type of SPAN : constant is 1;
    attribute mti_svvh_generic_type of BIT_DAC : constant is 1;
    attribute mti_svvh_generic_type of BIT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of BIT_RE : constant is 1;
end filter_qpsk;
