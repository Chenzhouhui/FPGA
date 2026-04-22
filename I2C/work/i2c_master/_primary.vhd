library verilog;
use verilog.vl_types.all;
entity i2c_master is
    generic(
        CLK_DIV         : integer := 16
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        start           : in     vl_logic;
        slave_addr      : in     vl_logic_vector(6 downto 0);
        tx_data         : in     vl_logic_vector(7 downto 0);
        busy            : out    vl_logic;
        done            : out    vl_logic;
        ack_error       : out    vl_logic;
        debug_byte      : out    vl_logic_vector(7 downto 0);
        debug_phase     : out    vl_logic_vector(2 downto 0);
        scl             : inout  vl_logic;
        sda             : inout  vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_DIV : constant is 2;
end i2c_master;
