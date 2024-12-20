library verilog;
use verilog.vl_types.all;
entity \register\ is
    generic(
        SIZE            : integer := 4
    );
    port(
        \in\            : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        \out\           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SIZE : constant is 1;
end \register\;
