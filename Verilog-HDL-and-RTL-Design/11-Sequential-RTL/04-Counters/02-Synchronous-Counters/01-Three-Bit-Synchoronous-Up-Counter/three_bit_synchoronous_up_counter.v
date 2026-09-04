module sync_3bit_up_counter(
    input clk,
    output reg [2:0] Q
);

initial begin
   Q = 3'b000;
end

always @(posedge clk) begin
   Q <= Q + 1;
end

endmodule
