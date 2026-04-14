library verilog;
use verilog.vl_types.all;
entity fifo_tb is
    generic(
        DEPTH           : integer := 4
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
end fifo_tb;
