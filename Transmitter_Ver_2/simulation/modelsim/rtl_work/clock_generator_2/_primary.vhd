library verilog;
use verilog.vl_types.all;
entity clock_generator_2 is
    generic(
        \MOD\           : integer := 8;
        BITS            : vl_notype
    );
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        count           : out    vl_logic_vector;
        carry           : out    vl_logic;
        clock_mod2      : out    vl_logic;
        clock_mod4      : out    vl_logic;
        clock_mod8      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of \MOD\ : constant is 1;
    attribute mti_svvh_generic_type of BITS : constant is 3;
end clock_generator_2;
