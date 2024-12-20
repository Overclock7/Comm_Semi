library verilog;
use verilog.vl_types.all;
entity coeff_rom is
    generic(
        FILE_NAME       : string  := "coeff_8.txt";
        BIT_WIDTH       : integer := 11;
        MEMORY_DEPTH    : integer := 8
    );
    port(
        address         : in     vl_logic_vector;
        data            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of FILE_NAME : constant is 1;
    attribute mti_svvh_generic_type of BIT_WIDTH : constant is 1;
    attribute mti_svvh_generic_type of MEMORY_DEPTH : constant is 1;
end coeff_rom;
