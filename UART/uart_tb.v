`timescale 1ns / 1ps

module uart_tb;

    parameter CLK_PERIOD = 20;

    reg        clk;
    reg        rst_n;
    reg        tx_start;
    reg [7:0]  tx_data;
    wire       tx_done;
    wire       tx_line;
    wire       rx_valid;
    wire [7:0] rx_data;

    uart_tx #(
        .CLK_FREQ(50_000_000),
        .BAUD_RATE(5_000_000)
    ) u_tx (
        .clk(clk),
        .rst_n(rst_n),
        .tx_start(tx_start),
        .tx_data(tx_data),
        .tx_done(tx_done),
        .tx(tx_line)
    );

    uart_rx #(
        .CLK_FREQ(50_000_000),
        .BAUD_RATE(5_000_000)
    ) u_rx (
        .clk(clk),
        .rst_n(rst_n),
        .rx(tx_line),
        .rx_valid(rx_valid),
        .rx_data(rx_data)
    );

    initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    initial begin
        rst_n    = 1'b0;
        tx_start = 1'b0;
        tx_data  = 8'h00;

        #100;
        rst_n = 1'b1;

        send_byte(8'h41);
        send_byte(8'h5A);
        send_byte(8'hA5);

        #5000;
        $finish;
    end

    task send_byte(input [7:0] data);
    begin
        @(posedge clk);
        tx_data  <= data;
        tx_start <= 1'b1;
        @(posedge clk);
        tx_start <= 1'b0;

        @(posedge rx_valid);
        if (rx_data !== data)
            $error("UART loopback failed: expect=%h, recv=%h", data, rx_data);
    end
    endtask

    initial begin
        $dumpfile("uart_tb.vcd");
        $dumpvars(0, uart_tb);
    end

endmodule
