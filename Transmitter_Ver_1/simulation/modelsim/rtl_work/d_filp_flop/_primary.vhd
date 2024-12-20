library verilog;
use verilog.vl_types.all;
entity d_filp_flop is
    port(
        clock           : in     vl_logic;
        reset           : in     vl_logic;
        d               : in     vl_logic;
        q               : out    vl_logic
    );
end d_filp_flop;
