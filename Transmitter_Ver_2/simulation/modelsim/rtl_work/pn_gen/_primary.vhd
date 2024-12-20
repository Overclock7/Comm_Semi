library verilog;
use verilog.vl_types.all;
entity pn_gen is
    generic(
        SEED            : vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        GEN_POLY        : vl_logic_vector(0 to 12) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi1, Hi1, Hi0, Hi1, Hi0, Hi0, Hi0, Hi1)
    );
    port(
        clock           : in     vl_logic;
        pn_out          : out    vl_logic;
        pn_roll         : out    vl_logic;
        reset           : in     vl_logic;
        state           : out    vl_logic_vector(11 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SEED : constant is 1;
    attribute mti_svvh_generic_type of GEN_POLY : constant is 1;
end pn_gen;
