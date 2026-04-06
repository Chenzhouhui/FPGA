
module led (
    input wire clk,
    input wire rst_n,
    output reg led 
);
reg [3:0] cnt; 
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        cnt <= 4'd0;
        led <= 1'b0;
    end
    else begin
        cnt <= (cnt >= 4'd9) ? 4'd0 : cnt + 4'd1;
        if (cnt == 4'd9) begin
            led <= ~led;
        end
    end
end  
endmodule
