library verilog;
use verilog.vl_types.all;
entity i2c_slave is
    generic(
        SLAVE_ADDR      : vl_logic_vector(6 downto 0) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0)
    );
    port(
        rst_n           : in     vl_logic;
        scl             : in     vl_logic;
        sda             : inout  vl_logic;
        rx_data         : out    vl_logic_vector(7 downto 0);
        rx_done         : out    vl_logic;
        addr_match      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of SLAVE_ADDR : constant is 2;
end i2c_slave;
