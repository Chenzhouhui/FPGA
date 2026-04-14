module addr_gen 
#(
    parameter MAX_DATA = 256,
    parameter AWDTH = $clog2(MAX_DATA)
)
(
    input clk,
    input rst_n,
    input en,
    output reg[AWDTH-1:0] addr
);
initial addr = 0;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        addr <= 0;
    end 
    else if (en) begin
        if (addr == MAX_DATA - 1) begin
            addr <= 0;
        end 
        else begin
            addr <= addr + 1;
        end
    end 
end  
endmodule
module fifo
#(
    parameter DEPTH = 256,
    parameter AWIDTH = $clog2(DEPTH)
)
(
    input clk,
    input rst_n,
    input wr_en,
    input rd_en,
    input [7:0] wr_data,
    output reg [7:0] dout,
    output reg [AWIDTH:0] count
);
wire [AWIDTH-1:0] w_addr, r_addr;
reg [7:0] data[0:DEPTH-1];
wire rd_fire = rd_en && (count != 0);
wire wr_fire = wr_en && ((count != DEPTH) || rd_fire);

always @(posedge clk) begin
    if (wr_fire) begin
        data[w_addr] <= wr_data;
    end
    if (rd_fire) begin
        dout <= data[r_addr];
    end
end
addr_gen #(.MAX_DATA(DEPTH)) fifo_writer (
    .clk(clk),
    .rst_n(rst_n),
    .en(wr_fire),
    .addr(w_addr)
);    
addr_gen #(.MAX_DATA(DEPTH)) fifo_reader (
    .clk(clk),
    .rst_n(rst_n),
    .en(rd_fire),
    .addr(r_addr)
); 
initial count = 0;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
        dout <= 0;
    end 
    else if (wr_fire && !rd_fire) begin
        count <= count + 1;
    end
    else if (!wr_fire && rd_fire) begin
        count <= count - 1;
    end
end  
endmodule
