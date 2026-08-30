module ring_counter_4bit(
    input clk,
    output reg [3:0] Q
);

initial begin
    Q = 4'b1000;
end

always @(posedge clk) begin
    Q <= {Q[2:0], Q[3]};
end

endmodule