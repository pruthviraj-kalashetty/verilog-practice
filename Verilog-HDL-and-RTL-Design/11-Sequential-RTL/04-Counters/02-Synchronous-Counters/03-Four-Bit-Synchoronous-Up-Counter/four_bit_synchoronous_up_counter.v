
module sync_4bit_up_counter(
    input clk,
    output reg [3:0] Q
);

initial begin
   Q = 4'b0000;
end

always @(posedge clk) begin
   Q <= Q + 1;
end

endmodule
