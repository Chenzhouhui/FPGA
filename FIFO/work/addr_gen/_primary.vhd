library verilog;
use verilog.vl_types.all;
entity addr_gen is
    generic(
        MAX_DATA        : integer := 256;
        AWDTH           : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        en              : in     vl_logic;
        addr            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of MAX_DATA : constant is 1;
    attribute mti_svvh_generic_type of AWDTH : constant is 3;
end addr_gen;
