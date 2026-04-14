module fifo_tb;
    parameter DEPTH = 4;
    localparam AWIDTH = $clog2(DEPTH);

    reg clk, rst_n;
    reg wr_en, rd_en;
    reg [7:0] wr_data;

    wire [7:0] dout;
    wire [AWIDTH:0] count;

    fifo #(.DEPTH(DEPTH)) dut (
        .clk    (clk),
        .rst_n  (rst_n),
        .wr_en  (wr_en),
        .rd_en  (rd_en),
        .wr_data(wr_data),
        .dout   (dout),
        .count  (count)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        wr_en   = 0;
        rd_en   = 0;
        wr_data = 0;
        rst_n   = 0;

        #15 rst_n = 1;

        $display("\n=== Test 1: Basic write ===");
        wr_en = 1;
        repeat (DEPTH) begin
            wr_data = $random;
            @(posedge clk);
            #1;
            $display("Write: 0x%h | Count: %0d", wr_data, count);
        end
        wr_en = 0;

        if (count !== DEPTH)
            $display("Error: Expected count %0d, got %0d", DEPTH, count);

        $display("\n=== Test 2: Basic read ===");
        rd_en = 1;
        repeat (DEPTH) begin
            @(posedge clk);
            #1;
            $display("Read: 0x%h | Count: %0d", dout, count);
        end
        rd_en = 0;

        if (count !== 0)
            $display("Error: Expected count 0, got %0d", count);

        $display("\n=== Test 3: Concurrent R/W ===");
        wr_en = 1;
        rd_en = 1;
        repeat (4) begin
            wr_data = $random;
            @(posedge clk);
            #1;
            $display("Write: 0x%h | Read: 0x%h | Count: %0d",
                     wr_data, dout, count);
        end
        wr_en = 0;
        rd_en = 0;

        $display("\n=== Test 4: Boundary cases ===");
        wr_en = 1;
        repeat (DEPTH+2) begin
            wr_data = $urandom;
            @(posedge clk);
        end
        wr_en = 0;
        $display("Overflow count: %0d", count);

        rd_en = 1;
        repeat (DEPTH+2) @(posedge clk);
        rd_en = 0;
        $display("Underflow count: %0d", count);

        #100;
        $display("\nTestbench completed");
        $finish;
    end
    initial begin
        $dumpfile("fifo.vcd");
        $dumpvars(0, fifo_tb);
    end
endmodule
