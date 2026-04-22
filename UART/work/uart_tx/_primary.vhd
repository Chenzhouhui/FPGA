library verilog;
use verilog.vl_types.all;
entity uart_tx is
    generic(
        CLK_FREQ        : integer := 50000000;
        BAUD_RATE       : integer := 115200;
        CLKS_PER_BIT    : vl_logic_vector(31 downto 0)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        tx_start        : in     vl_logic;
        tx_data         : in     vl_logic_vector(7 downto 0);
        tx_done         : out    vl_logic;
        tx              : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_FREQ : constant is 2;
    attribute mti_svvh_generic_type of BAUD_RATE : constant is 2;
    attribute mti_svvh_generic_type of CLKS_PER_BIT : constant is 4;
end uart_tx;
