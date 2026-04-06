`timescale 1ns/1ps
module led_tb ;
parameter CLK_PERIOD = 20; 
reg clk_tb;
reg rst_n_tb;
wire led_tb;
initial begin
    clk_tb = 1'b0;
    forever #(CLK_PERIOD/2) clk_tb = ~clk_tb;
end
initial begin
    rst_n_tb = 1'b0;
    #(CLK_PERIOD*5) rst_n_tb = 1'b1;
    #(CLK_PERIOD*50) $finish;
end
led dut_inst (
    .clk    (clk_tb),
    .rst_n  (rst_n_tb),
    .led    (led_tb)
);
endmodule
