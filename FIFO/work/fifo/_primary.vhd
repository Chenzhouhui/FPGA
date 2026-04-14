library verilog;
use verilog.vl_types.all;
entity fifo is
    generic(
        DEPTH           : integer := 256;
        AWIDTH          : vl_notype
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        wr_en           : in     vl_logic;
        rd_en           : in     vl_logic;
        wr_data         : in     vl_logic_vector(7 downto 0);
        dout            : out    vl_logic_vector(7 downto 0);
        count           : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of DEPTH : constant is 1;
    attribute mti_svvh_generic_type of AWIDTH : constant is 3;
end fifo;
