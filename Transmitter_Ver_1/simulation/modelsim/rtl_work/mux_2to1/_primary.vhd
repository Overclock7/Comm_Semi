library verilog;
use verilog.vl_types.all;
entity mux_2to1 is
    generic(
        SPAN            : integer := 16
    );
    port(
        in_i            : in     vl_logic_vector;
        in_q            : in     vl_logic_vector;
        sel             : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SPAN : constant is 1;
end mux_2to1;
