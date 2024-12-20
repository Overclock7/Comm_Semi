library verilog;
use verilog.vl_types.all;
entity tdl is
    generic(
        SPAN            : integer := 16
    );
    port(
        \in\            : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SPAN : constant is 1;
end tdl;
