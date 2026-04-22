library verilog;
use verilog.vl_types.all;
entity spi_slave is
    generic(
        RESPONSE_DATA   : vl_logic_vector(7 downto 0) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0)
    );
    port(
        rst_n           : in     vl_logic;
        sclk            : in     vl_logic;
        cs_n            : in     vl_logic;
        mosi            : in     vl_logic;
        miso            : out    vl_logic;
        rx_data         : out    vl_logic_vector(7 downto 0);
        rx_done         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of RESPONSE_DATA : constant is 2;
end spi_slave;
