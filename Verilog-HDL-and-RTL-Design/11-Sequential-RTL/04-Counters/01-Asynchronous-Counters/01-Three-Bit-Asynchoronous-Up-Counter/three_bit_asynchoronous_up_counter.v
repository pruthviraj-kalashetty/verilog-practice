module async_3bit_up_counter(
    input clk,
    output reg [2:0] Q
);

initial begin
    Q = 3'b000;
end

always @(posedge clk) begin
    Q[0] <= ~Q[0];
end

always @(negedge Q[0]) begin
    Q[1] <= ~Q[1];
end

always @(negedge Q[1]) begin
    Q[2] <= ~Q[2];
end

endmodule