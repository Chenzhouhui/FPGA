library verilog;
use verilog.vl_types.all;
entity spi_tb is
    generic(
        CLK_PERIOD      : integer := 20;
        MASTER_TX       : vl_logic_vector(7 downto 0) := (Hi1, Hi0, Hi1, Hi0, Hi0, Hi1, Hi0, Hi1);
        SLAVE_TX        : vl_logic_vector(7 downto 0) := (Hi0, Hi0, Hi1, Hi1, Hi1, Hi1, Hi0, Hi0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of MASTER_TX : constant is 2;
    attribute mti_svvh_generic_type of SLAVE_TX : constant is 2;
end spi_tb;
