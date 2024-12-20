library verilog;
use verilog.vl_types.all;
entity mux_4to2 is
    generic(
        SPAN            : integer := 16
    );
    port(
        in_i0           : in     vl_logic_vector;
        in_i1           : in     vl_logic_vector;
        in_q0           : in     vl_logic_vector;
        in_q1           : in     vl_logic_vector;
        sel             : in     vl_logic;
        out_0           : out    vl_logic_vector;
        out_1           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SPAN : constant is 1;
end mux_4to2;
