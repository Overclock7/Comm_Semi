library verilog;
use verilog.vl_types.all;
entity tb_transmit_16qam is
    generic(
        BIT_DAC         : integer := 14;
        SPS             : integer := 8;
        CLOCK_PERIOD    : integer := 20
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BIT_DAC : constant is 1;
    attribute mti_svvh_generic_type of SPS : constant is 1;
    attribute mti_svvh_generic_type of CLOCK_PERIOD : constant is 1;
end tb_transmit_16qam;
