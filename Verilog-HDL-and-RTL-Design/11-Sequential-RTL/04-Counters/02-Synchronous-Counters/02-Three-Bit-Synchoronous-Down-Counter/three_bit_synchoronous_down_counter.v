module sync_3bit_down_counter(
    input clk,
    output reg [2:0] Q
);

initial begin
    Q = 3'b111;
end

always @(posedge clk) begin
    Q <= Q - 1;
end

endmodule