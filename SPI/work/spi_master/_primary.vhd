library verilog;
use verilog.vl_types.all;
entity spi_master is
    generic(
        CLK_DIV         : integer := 4
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        start           : in     vl_logic;
        tx_data         : in     vl_logic_vector(7 downto 0);
        rx_data         : out    vl_logic_vector(7 downto 0);
        busy            : out    vl_logic;
        done            : out    vl_logic;
        sclk            : out    vl_logic;
        mosi            : out    vl_logic;
        miso            : in     vl_logic;
        cs_n            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_DIV : constant is 2;
end spi_master;
