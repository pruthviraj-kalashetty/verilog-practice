module sync_4bit_down_counter(
    input clk,
    output reg [3:0] Q
);

initial begin
    Q = 4'b1111;
end

always @(posedge clk) begin
    Q <= Q - 1;
end

endmodule
